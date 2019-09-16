package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.TenantObj;

public interface TenantMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantObj record);

    int insertSelective(TenantObj record);

    TenantObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantObj record);

    int updateByPrimaryKey(TenantObj record);
}