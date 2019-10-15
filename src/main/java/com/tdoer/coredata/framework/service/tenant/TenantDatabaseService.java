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

package com.tdoer.coredata.framework.service.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantDatabaseEO;

import java.util.List;

/**
 * @author conan (kly824968443@gmail.com)
 * @create 2019/10/14
 * @description
 */
public interface TenantDatabaseService {

    List<TenantDatabaseEO> selectList();

    int insert(TenantDatabaseEO record);


}
