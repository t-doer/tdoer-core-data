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

package com.tdoer.coredata.framework.service.impl.user;

import com.tdoer.coredata.framework.eo.user.UserEO;
import com.tdoer.coredata.framework.mapper.user.UserMapper;
import com.tdoer.coredata.framework.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/14
 * @description
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;

    @Override
    public UserEO selectByPrimaryKey(Long id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public UserEO selectByTenantIdAndAccount(Long tenantId, String account) {
        return userMapper.selectByTenantIdAndAccount(tenantId,account);
    }

    @Override
    public UserEO selectByTenantIdAndGuid(Long tenantId, String guid) {
        return userMapper.selectByTenantIdAndGuid(tenantId,guid);
    }
}
