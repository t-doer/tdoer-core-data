package com.tdoer.coredata.framework.mapper.context;

import com.tdoer.coredata.framework.eo.context.ContextRoleEO;

public interface ContextRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextRoleEO record);

    int insertSelective(ContextRoleEO record);

    ContextRoleEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextRoleEO record);

    int updateByPrimaryKey(ContextRoleEO record);
}