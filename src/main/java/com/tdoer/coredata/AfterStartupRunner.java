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

package com.tdoer.coredata;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.tdoer.coredata.framework.eo.tenant.TenantDatabaseEO;
import com.tdoer.coredata.framework.mapper.tenant.TenantDatabaseMapper;
import com.tdoer.datasource.DynamicRoutingDataSource;
import com.tdoer.datasource.config.TenantDatabaseConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/12
 * @description
 */
@Component
@Slf4j
public class AfterStartupRunner implements ApplicationRunner {

    @Autowired
    private TenantDatabaseMapper tenantDatabaseMapper;
    @Autowired
    private DynamicRoutingDataSource dynamicRoutingDataSource;
    @Autowired
    private TenantDatabaseConfig tenantDatabaseConfig;

    /**
     * 加载租户数据源
     */
    @Override
    public void run(ApplicationArguments args) throws Exception {
        Map<Object, Object> targetDataSource = dynamicRoutingDataSource.getTargetDataSource();
        Map<Object, Object> tenantDataSourceMap = new HashMap<>();
        List<TenantDatabaseEO> list = tenantDatabaseMapper.selectList();
        try {
            for (TenantDatabaseEO tenantDatabaseEO : list) {
                DataSource tenantDataSource = DruidDataSourceFactory.createDataSource(tenantDatabaseConfig.getProperties(tenantDatabaseEO.getDbName(), tenantDatabaseEO.getUserName(), tenantDatabaseEO.getPassword()));
                tenantDataSourceMap.put(tenantDatabaseEO.getDbName(), tenantDataSource);
            }
            if (!CollectionUtils.isEmpty(tenantDataSourceMap)) {
                targetDataSource.putAll(tenantDataSourceMap);
            }
        } catch (Exception e) {
            log.error("init tenant datasource fail.e={}", e);
        }
        dynamicRoutingDataSource.setTargetDataSources(targetDataSource);
    }
}