/*
 * Copyright 2019 T-Doer (tdoer.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.tdoer.coredata.framework.bizz.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantEO;
import com.tdoer.coredata.framework.eo.tenant.UserEO;
import com.tdoer.coredata.framework.service.tenant.TenantService;
import com.tdoer.coredata.framework.service.user.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author Leon Wang (ahbbhywmd@163.com)
 * @Description
 * @create 2019-10-05
 */
@Component
@Slf4j
public class TenantBizz {

    @Autowired
    UserService userService;
    @Autowired
    TenantService tenantService;

    public void testDatasource(Long id){
        TenantEO tenantEO =  tenantService.selectByPrimaryKey(id);
        log.info("tenantEO={}",tenantEO);
        UserEO userEO =  userService.selectByPrimaryKey(id);
        log.info("userEO={}",userEO);
    }

}
