package com.tdoer.coredata.framework.mapper.context;

import com.tdoer.coredata.framework.obj.context.ContextRoleAuthorityObj;

public interface ContextRoleAuthorityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextRoleAuthorityObj record);

    int insertSelective(ContextRoleAuthorityObj record);

    ContextRoleAuthorityObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextRoleAuthorityObj record);

    int updateByPrimaryKey(ContextRoleAuthorityObj record);
}