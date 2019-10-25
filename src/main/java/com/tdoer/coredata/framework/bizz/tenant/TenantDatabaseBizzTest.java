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

package com.tdoer.coredata.framework.bizz.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantDatabaseEO;
import com.tdoer.coredata.framework.service.tenant.TenantDatabaseService;
import com.tdoer.datasource.DynamicRoutingDataSource;
import com.tdoer.datasource.eo.TenantDatabaseVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/25
 * @description
 */
@Component
@Slf4j
public class TenantDatabaseBizzTest {

    @Autowired
    TenantDatabaseService tenantDatabaseService;

    @Autowired
    private DynamicRoutingDataSource dynamicRoutingDataSource;

    public void addDatabase(String database, Long tenantId) {
        TenantDatabaseVo tenantDatabaseVo = dynamicRoutingDataSource.addDataSource(database, tenantId);
        TenantDatabaseEO tenantDatabaseEO = new TenantDatabaseEO();
        BeanUtils.copyProperties(tenantDatabaseVo, tenantDatabaseEO);
        tenantDatabaseService.save(tenantDatabaseEO);
    }
}
