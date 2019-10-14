package com.tdoer.coredata.framework.mapper.master.context;

import com.tdoer.coredata.framework.eo.context.ContextRoleAuthorityEO;

public interface ContextRoleAuthorityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextRoleAuthorityEO record);

    int insertSelective(ContextRoleAuthorityEO record);

    ContextRoleAuthorityEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextRoleAuthorityEO record);

    int updateByPrimaryKey(ContextRoleAuthorityEO record);
}