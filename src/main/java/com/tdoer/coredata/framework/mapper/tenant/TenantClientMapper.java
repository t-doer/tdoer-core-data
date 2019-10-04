package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantClientEO;

public interface TenantClientMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantClientEO record);

    int insertSelective(TenantClientEO record);

    TenantClientEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantClientEO record);

    int updateByPrimaryKey(TenantClientEO record);
}