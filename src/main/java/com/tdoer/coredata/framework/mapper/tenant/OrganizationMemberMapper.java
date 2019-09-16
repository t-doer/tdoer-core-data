package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.OrganizationMemberObj;

public interface OrganizationMemberMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrganizationMemberObj record);

    int insertSelective(OrganizationMemberObj record);

    OrganizationMemberObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrganizationMemberObj record);

    int updateByPrimaryKey(OrganizationMemberObj record);
}