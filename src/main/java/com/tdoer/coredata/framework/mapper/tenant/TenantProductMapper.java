package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.TenantProductObj;

public interface TenantProductMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantProductObj record);

    int insertSelective(TenantProductObj record);

    TenantProductObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantProductObj record);

    int updateByPrimaryKey(TenantProductObj record);
}