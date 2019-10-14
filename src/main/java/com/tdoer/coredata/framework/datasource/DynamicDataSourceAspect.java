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

import com.tdoer.coredata.framework.datasource.config.MasterDatabaseConfig;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/12
 * @description
 */
@Aspect
@Component
@Slf4j
public class DynamicDataSourceAspect {

    @Autowired
    MasterDatabaseConfig masterDatabaseConfig;

    /**
     * 定义切点,
     * mapper 以及其子包下默认是master库
     */
    @Pointcut("execution( * com.tdoer.coredata.framework.mapper.master..*.*(..))")
    public void masterDataSourceAspect() {
    }

    /**
     * 定义切点,非主数据源根据租户信息获取数据源
     */
    @Pointcut("execution( * com.tdoer..mapper..*.*(..)) && !execution( * com.tdoer.coredata.framework.mapper.master..*.*(..))")
    public void tenantDataSourceAspect() {
    }

    /**
     * 选择租户数据源
     *
     * @param point
     */
    @Before("tenantDataSourceAspect()")
    public void switchDataSource(JoinPoint point) {
        String tenantDatabase = "demo1";

        if (DynamicRoutingDataSource.isExistDataSource(tenantDatabase) && !tenantDatabase.equals(DynamicDataSourceContextHolder.getDataSourceKey())) {
            DynamicDataSourceContextHolder.setDataSourceKey(tenantDatabase);
        }
        log.debug("switch datasource to {} in Method {}",
                DynamicDataSourceContextHolder.getDataSourceKey(), point.getSignature());
    }

    /**
     * 选择主数据源
     *
     * @param point
     */
    @Before("masterDataSourceAspect()")
    public void masterDataSourceBefore(JoinPoint point) {

        DynamicDataSourceContextHolder.setDataSourceKey(masterDatabaseConfig.getName());
        log.debug("switch datasource to {} in Method {}",
                DynamicDataSourceContextHolder.getDataSourceKey(), point.getSignature());
    }

    /**
     * 重置数据源
     *
     * @param point
     */
    @After("masterDataSourceAspect()")
    public void resetDataSource(JoinPoint point) {
        DynamicDataSourceContextHolder.clearDataSourceKey();
        log.debug("reset dataSource to {} in method {}",
                DynamicDataSourceContextHolder.getDataSourceKey(), point.getSignature());
    }

}

