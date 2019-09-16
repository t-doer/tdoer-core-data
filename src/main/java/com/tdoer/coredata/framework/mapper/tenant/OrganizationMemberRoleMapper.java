package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.OrganizationMemberRoleObj;

public interface OrganizationMemberRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrganizationMemberRoleObj record);

    int insertSelective(OrganizationMemberRoleObj record);

    OrganizationMemberRoleObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrganizationMemberRoleObj record);

    int updateByPrimaryKey(OrganizationMemberRoleObj record);
}