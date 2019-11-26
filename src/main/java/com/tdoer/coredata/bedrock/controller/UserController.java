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

package com.tdoer.coredata.bedrock.controller;

import com.tdoer.bedrock.tenant.BaseUser;
import com.tdoer.coredata.bedrock.bizz.UserBizz;
import com.tdoer.springboot.rest.GenericResponseData;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/11/5
 * @description
 */
@RequestMapping("/user")
@RestController
@Slf4j
@Api(tags = "服务端用户接口")
public class UserController {

    @Autowired
    UserBizz userBizz;

    @GetMapping({"/{tenantId}/account/{account}"})
    GenericResponseData<BaseUser> findByAccount(@PathVariable("tenantId") Long tenantId,
                                                @PathVariable("account") String account) {
        return new GenericResponseData<>(userBizz.findByAccount(tenantId, account));
    }

    @GetMapping({"/{tenantId}/guid/{guid}"})
    GenericResponseData<BaseUser> findByGuid(@PathVariable("tenantId") Long tenantId, @PathVariable("guid") String guid) {
        return new GenericResponseData<>(userBizz.findByGuid(tenantId, guid));
    }

    @GetMapping({"/{tenantId}/id/{userId}"})
    GenericResponseData<BaseUser> findById(@PathVariable("tenantId") Long tenantId, @PathVariable("userId") Long userId) {
        return new GenericResponseData<>(userBizz.findById(userId));
    }
}
