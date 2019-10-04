package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.OrganizationEO;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrganizationEO record);

    int insertSelective(OrganizationEO record);

    OrganizationEO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrganizationEO record);

    int updateByPrimaryKey(OrganizationEO record);
}