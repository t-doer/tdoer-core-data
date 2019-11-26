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

package com.tdoer.coredata.bedrock.bizz;

import com.tdoer.bedrock.tenant.AccountStatus;
import com.tdoer.bedrock.tenant.BaseUser;
import com.tdoer.bedrock.tenant.CredentialStatus;
import com.tdoer.coredata.framework.eo.user.UserEO;
import com.tdoer.coredata.framework.service.user.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/11/5
 * @description
 */
@Component
public class UserBizz {

    @Autowired
    UserService userService;

    public BaseUser findByAccount(Long tenantId, String account) {
        UserEO user = userService.selectByTenantIdAndAccount(tenantId, account);
        return copyFromEo(user);
    }


    public BaseUser findByGuid(Long tenantId, String guid) {
        UserEO user = userService.selectByTenantIdAndGuid(tenantId, guid);
        return copyFromEo(user);
    }

    public BaseUser findById(Long id) {
        UserEO user = userService.selectByPrimaryKey(id);
        return copyFromEo(user);
    }

    private BaseUser copyFromEo(UserEO user) {
        if (user == null) {
            return null;
        }
        BaseUser vo = new BaseUser();
        BeanUtils.copyProperties(user, vo);
        vo.setStatus(AccountStatus.resolve(user.getStatus()));
        vo.setCredentialStatus(CredentialStatus.ACTIVE);
        return vo;
    }
}
