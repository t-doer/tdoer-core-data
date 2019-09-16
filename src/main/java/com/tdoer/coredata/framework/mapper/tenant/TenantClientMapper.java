package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.TenantClientObj;

public interface TenantClientMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantClientObj record);

    int insertSelective(TenantClientObj record);

    TenantClientObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantClientObj record);

    int updateByPrimaryKey(TenantClientObj record);
}