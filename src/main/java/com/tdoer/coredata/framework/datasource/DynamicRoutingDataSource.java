/*
 *
 *  Copyright 2017-2019 T-Doer (tdoer.com).
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 */

package com.tdoer.coredata.framework.datasource;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.tdoer.coredata.framework.datasource.config.MasterDatabaseConfig;
import com.tdoer.coredata.framework.datasource.config.TenantDatabaseConfig;
import com.tdoer.coredata.framework.eo.tenant.TenantDatabaseEO;
import com.tdoer.coredata.framework.mapper.master.tenant.TenantDatabaseMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import java.util.HashMap;
import java.util.Map;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/12
 * @description
 */
@Slf4j
public class DynamicRoutingDataSource extends AbstractRoutingDataSource {


    private static Map<Object, Object> targetDataSources = new HashMap<>();

    @Autowired
    MasterDatabaseConfig masterDatabaseConfig;
    @Autowired
    TenantDatabaseConfig tenantDatabaseConfig;
    @Autowired
    TenantDatabaseMapper tenantDatabaseMapper;


    /**
     * 设置当前数据源
     *
     * @return
     */
    @Override
    protected Object determineCurrentLookupKey() {
        log.debug("current dataSource is [{}]", DynamicDataSourceContextHolder.getDataSourceKey());
        return DynamicDataSourceContextHolder.getDataSourceKey();
    }

    @Override
    public void setTargetDataSources(Map<Object, Object> targetDataSources) {
        super.setTargetDataSources(targetDataSources);
        DynamicRoutingDataSource.targetDataSources = targetDataSources;
    }

    public DruidDataSource getDataSource(String database) {
        try {
            DruidDataSource dataSource;
            if (StringUtils.isBlank(database)) {
                dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(masterDatabaseConfig.getProperties());
                dataSource.init();
            } else {
                dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(tenantDatabaseConfig.getProperties(database, null, null));
            }
            return dataSource;
        } catch (Exception e) {
            log.error("get dataSource fail.database={},e={}", database, e);
            throw new RuntimeException(e);
        }
    }

    public Map<Object, Object> getTargetDataSource() {
        return targetDataSources;
    }

    /**
     * 是否存在当前key的 DataSource
     *
     * @param key
     * @return 存在返回 true, 不存在返回 false
     */
    public static boolean isExistDataSource(String key) {
        return targetDataSources.containsKey(key);
    }

    /**
     * 动态增加数据源
     *
     * @param database 数据库名
     * @return
     */
    public synchronized boolean addDataSource(String database, Long tenantId) {
        if (StringUtils.isBlank(database)) return false;
        if (DynamicRoutingDataSource.isExistDataSource(database)) return true;
        DruidDataSource masterDataSource = getDataSource(null);
        DynamicCreateDataSource.createDB(masterDataSource, database);
        Map<Object, Object> targetMap = DynamicRoutingDataSource.targetDataSources;
        DruidDataSource tenantDatabase = getDataSource(database);
        //切换创建库表的数据源
        DynamicDataSourceContextHolder.setDataSourceKey(database);
        database = DynamicDataSourceContextHolder.getDataSourceKey();
        //create table after init database and use success
        log.info("create tables.");
        DynamicCreateDataSource.createTable(tenantDatabase);
        TenantDatabaseEO eo = new TenantDatabaseEO();
        eo.setDbName(database);
        eo.setDbUrl(tenantDatabaseConfig.getUrl().replace("{0}", database));
        eo.setDriverClassName(tenantDatabaseConfig.getDriverClassName());
        eo.setUserName(tenantDatabaseConfig.getUsername());
        eo.setPassword(tenantDatabase.getPassword());
        eo.setTenantId(tenantId);
        tenantDatabaseMapper.insertSelective(eo);
        targetMap.put(database, tenantDatabase);
        this.setTargetDataSources(targetMap);
        this.afterPropertiesSet();
        log.info("dataSource {} has been added", database);
        return true;
    }

}
