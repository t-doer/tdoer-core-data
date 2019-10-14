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
import com.tdoer.coredata.ErrorStatusCodes;
import com.tdoer.springboot.error.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/14
 * @description
 */
@Slf4j
public class DynamicCreateDataSource {

    /**
     * 创建数据库
     * @param druidDataSource
     * @param dbName
     */
    public static void createDB(DruidDataSource druidDataSource, String dbName) {
        Connection connection = null;
        Statement statement = null;
        try {
            connection = druidDataSource.getConnection();
            statement = connection.createStatement();

            String dbExistSql = "SELECT COUNT(*) FROM information_schema.schemata WHERE schema_name=\"" + dbName + "\"";
            ResultSet rs = statement.executeQuery(dbExistSql);
            if (rs.next() && rs.getInt(1) != 0) {
                log.error("database {} already exist...", dbName);
                throw new BusinessException(ErrorStatusCodes.INIT_DATABASE_FAIL);
            }
            String sql = "CREATE DATABASE IF NOT EXISTS " + dbName + " DEFAULT CHARACTER SET UTF8";
            statement.execute(sql);
            log.info("create new database {} success.", dbName);
        } catch (BusinessException be) {
            throw be;
        } catch (SQLException e) {
            e.printStackTrace();
            log.error("create database fail.e={}", e);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 创建表
     * @param dataSource
     */
    public static void createTable(DruidDataSource dataSource) {
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        Resource resource = resourceLoader.getResource("classpath:" + "init.sql");
        ResourceDatabasePopulator resourceDatabasePopulator = new ResourceDatabasePopulator();
        resourceDatabasePopulator.addScripts(resource);
        resourceDatabasePopulator.execute(dataSource);
    }
}
