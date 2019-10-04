package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.OrganizationMemberEO;

public interface OrganizationMemberMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrganizationMemberEO record);

    int insertSelective(OrganizationMemberEO record);

    OrganizationMemberEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrganizationMemberEO record);

    int updateByPrimaryKey(OrganizationMemberEO record);
}