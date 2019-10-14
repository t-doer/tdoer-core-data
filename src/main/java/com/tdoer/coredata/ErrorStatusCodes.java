/*
 * Copyright 2017-2019 T-Doer (tdoer.com).
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
package com.tdoer.coredata;

import com.tdoer.springboot.annotation.ReasonPhrase;
import com.tdoer.springboot.http.StatusCodes;

/**
 * Declare customer error codes here, 41000 ~ 49999 for client-side bad request, and 51000~59999 for server-side internal error
 *
 * @author Htinker Hu (htinker@163.com)
 * @create 2017-09-19
 */

public interface ErrorStatusCodes extends StatusCodes {

    // 41xxx - client-side bad request
    @ReasonPhrase("Success")
    int SUCCESS = 200;

    // 41xxx - client-side bad request
    @ReasonPhrase("Invalid Login")
    int INVALID_LOGIN = 41001;

    @ReasonPhrase("用户未登录")
    int USER_LOGIN_FAIL = 41002;

    @ReasonPhrase("未找到对应用户")
    int USER_NOT_FOUND = 41003;

    @ReasonPhrase("用户没有访问{0}资源的权限")
    int SOURCE_NO_PERMISSION = 41004;

    @ReasonPhrase("服务器繁忙，请稍后再试")
    int SERVER_ERROR = 50001;

    @ReasonPhrase("参数校验错误{0}")
    int PARAM_SINGLE_VALID_FAIL = 50002;

    @ReasonPhrase("初始化数据库信息失败")
    int INIT_DATABASE_FAIL = 50003;

}
