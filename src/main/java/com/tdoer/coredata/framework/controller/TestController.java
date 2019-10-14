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

package com.tdoer.coredata.framework.controller;

import com.tdoer.coredata.framework.bizz.tenant.TenantBizz;
import com.tdoer.coredata.framework.datasource.DynamicRoutingDataSource;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/test")
public class TestController {

    @Autowired
    private DynamicRoutingDataSource dynamicRoutingDataSource;
    @Autowired
    TenantBizz tenantBizz;

    /**
     * 添加数据源示例
     *
     * @return
     */
    @GetMapping("/addDataSource")
    public Object addDataSource(@Param("database") String database) {
        Map<String, String> map = new HashMap<>();
        map.put("database", database);
        return dynamicRoutingDataSource.addDataSource(map);
    }

    @GetMapping("/switchDataSource")
    public void switchDataSource() {
        tenantBizz.testDatasource();
    }
}
