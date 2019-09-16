package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.OrganizationObj;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrganizationObj record);

    int insertSelective(OrganizationObj record);

    OrganizationObj selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrganizationObj record);

    int updateByPrimaryKey(OrganizationObj record);
}