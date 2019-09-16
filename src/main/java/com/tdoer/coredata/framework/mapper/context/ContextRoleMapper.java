package com.tdoer.coredata.framework.mapper.context;

import com.tdoer.coredata.framework.obj.context.ContextRoleObj;

public interface ContextRoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextRoleObj record);

    int insertSelective(ContextRoleObj record);

    ContextRoleObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextRoleObj record);

    int updateByPrimaryKey(ContextRoleObj record);
}