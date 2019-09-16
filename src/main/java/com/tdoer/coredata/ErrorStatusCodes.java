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
    @ReasonPhrase("获取基础信息失败")
    int GET_INFO_FAIL = 50003;

    @ReasonPhrase("{0}记录已存在")
    int RECORD_EXIST= 50004;

    @ReasonPhrase("记录不存在")
    int RECORD_NOT_EXIST= 50005;

    @ReasonPhrase("参数校验错误")
    int PARAM_VALID_FAIL = 50006;

    @ReasonPhrase("信息未找到")
    int INFO_NOT_FOUD = 50007;

    @ReasonPhrase("用户名或密码错误")
    int USER_PASSWD_ERROR = 50008;

    @ReasonPhrase("请至少给角色选择一个权限")
    int ROLE_AUTHORITY_ERROR = 50009;

    @ReasonPhrase("角色名称已存在")
    int ROLE_NAME_EXIST = 50010;

    @ReasonPhrase("数据异常，请刷新重试")
    int INFO_STATUS_ERROR = 50011;

    @ReasonPhrase("登录账号必须由字符或者数字组成")
    int USER_ACCOUNT_ERROR = 50012;

    @ReasonPhrase("登录账号已存在")
    int USER_ACCOUNT_EXIST = 50013;
    
    @ReasonPhrase("角色编码已存在")
    int ROLE_CODE_EXIST = 50014;

    @ReasonPhrase("菜单上级选择错误")
    int AUTH_PARENT_ERROR = 50015;

    @ReasonPhrase("系统角色，不允许编辑")
    int ROLE_NOT_EDIT = 50016;
    
    @ReasonPhrase("导出异常")
    int REPORT_ERROR = 50017;
    
    @ReasonPhrase("参数校验为空")
    int PARAM_VALID_NULL = 50018;
    
    @ReasonPhrase("上下文参数异常")
    int PARAM_VALID_CONTEXT_TYPE_CODE_ERROR = 50019;

    @ReasonPhrase("数据有变化,请刷新重试")
    int ROLE_ENABLED_ERROR = 50020;

    @ReasonPhrase("该身份类型没有默认系统角色，请联系管理员")
    int USER_DEFAULT_ROLE_ERROR = 50021;

    @ReasonPhrase("该机构下成员:{0}已存在")
    int MEMBER_USER_SAVE_ERROR = 50022;

    @ReasonPhrase("身份类别不能为空")
    int USER_TYPE_NULL = 50023;

    @ReasonPhrase("机构编码已存在")
    int ORGANIZATION_CODE_EXIST = 50024;

    @ReasonPhrase("省市区不可为空")
    int ORGANIZATION_AREA_ERROR = 50025;

    @ReasonPhrase("客户代码已存在")
    int ORGANIZATION_CUSTOMER_CODE_ERROR = 50026;

    @ReasonPhrase("供应商代码已存在")
    int ORGANIZATION_SUPPLIER_CODE_ERROR = 50027;

    @ReasonPhrase("该用户账号不存在,无法初始化账号信息")
    int USER_ACOUNT_NOT_FOUND = 50028;

    @ReasonPhrase("导入excel第{0}行、第{1}列 {2} 出错，请检查后重新上传")
    int IMPORT_FROM_EXCEL_FORMT_ERROR = 51001;

    @ReasonPhrase("导入excel出错，{0}数据已存在")
    int IMPORT_FROM_EXCEL_ALREADY_EXIST = 51002;

    @ReasonPhrase("导入excel出错，excel不能为空")
    int IMPORT_FROM_EXCEL_NO_DATA= 51003;

    @ReasonPhrase("导入excel错误，不是excel文件")
    int IMPORT_FROM_EXCEL_FILETYPE_ERROR = 51004;

    @ReasonPhrase("导入excel错误, 服务器内部错误")
    int IMPORT_FROM_EXCEL_INTERNEL_ERROR = 51005;

    @ReasonPhrase("导入excel数据第{0}行,{1}不能为空")
    int IMPORT_FROM_EXCEL_NOT_EMPTY = 51006;

    @ReasonPhrase("未找到您的门店信息，请登录后选择门店后再操作")
    int LOGIN_UNION_STORE_NOT_FOUND = 50029;

    @ReasonPhrase("门店编码已存在")
    int STORE_CODE_EXIST = 50030;

    @ReasonPhrase("经度取值范围:[0,180],纬度取值范围:[0，90]且经纬度必须精确到小数点后六位")
    int Location_LONGITUDE_LATITUDE_ERROR = 50032;

    @ReasonPhrase("组织成员删除错误：{}")
    int ORG_MEMBER_DELETE_ERROR = 50033;

    @ReasonPhrase("工程师已认证成功")
    int ORG_IDENTIFICATION_STATUS_ERROR = 50034;

    @ReasonPhrase("工程师认证信息已添加")
    int ORG_IDENTIFICATION_ADD_ERROR = 50035;

    @ReasonPhrase("工程师认证信息不存在")
    int ORG_IDENTIFICATION_ERROR = 50036;

    @ReasonPhrase("该门店下成员:{0}已存在")
    int MEMBER_USER_EXISTS = 50037;

    @ReasonPhrase("该用户已关联：{0}。请取消关联后再禁用！")
    int DISABLE_NOT_ALLOW = 50038;

    @ReasonPhrase("该成员{0}在“{1}”下已存在")
    int ORGANIZATION_MEMBER_BD_ERROR = 50039;
}
