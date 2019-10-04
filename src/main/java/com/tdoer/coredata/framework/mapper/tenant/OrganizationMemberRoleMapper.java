package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.OrganizationMemberRoleEO;

public interface OrganizationMemberRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrganizationMemberRoleEO record);

    int insertSelective(OrganizationMemberRoleEO record);

    OrganizationMemberRoleEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrganizationMemberRoleEO record);

    int updateByPrimaryKey(OrganizationMemberRoleEO record);
}