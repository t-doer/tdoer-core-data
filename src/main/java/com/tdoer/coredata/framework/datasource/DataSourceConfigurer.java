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

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.tdoer.coredata.framework.datasource.config.MasterDatabaseConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/12
 * @description
 */
@Configuration
@MapperScan("com.tdoer.coredata.framework.mapper")
public class DataSourceConfigurer {

    @Autowired
    private MasterDatabaseConfig masterDatabaseConfig;


    private static final Logger LOGGER = LoggerFactory.getLogger(DataSourceConfigurer.class);



    /**
     * 注册动态数据源
     *
     * @return
     */
    @Bean("dynamicRoutingDataSource")
    public DataSource dynamicRoutingDataSource() {
        DynamicRoutingDataSource dynamicRoutingDataSource;
        try {
            LOGGER.info("init dataSource success.");
            dynamicRoutingDataSource = new DynamicRoutingDataSource();
            Map<Object, Object> dataSourceMap = new HashMap<>();
            DataSource dataSource = DruidDataSourceFactory.createDataSource(masterDatabaseConfig.getProperties());
            dataSourceMap.put(masterDatabaseConfig.getName(), dataSource);
            dynamicRoutingDataSource.setDefaultTargetDataSource(dataSource);// 设置默认数据源
            dynamicRoutingDataSource.setTargetDataSources(dataSourceMap);
        } catch (Exception e) {
            LOGGER.error("Create DataSource Error : {}", e);
            throw new RuntimeException();
        }
        return dynamicRoutingDataSource;
    }

    /**
     * 事务管理器
     *
     * @return the platform transaction manager
     */
    @Bean
    public PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dynamicRoutingDataSource());
    }
}
