package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantProductEO;

public interface TenantProductMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantProductEO record);

    int insertSelective(TenantProductEO record);

    TenantProductEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantProductEO record);

    int updateByPrimaryKey(TenantProductEO record);
}