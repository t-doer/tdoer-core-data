package com.tdoer.coredata.framework.mapper.master.context;

import com.tdoer.coredata.framework.eo.context.ContextTypeEO;

public interface ContextTypeMapper {
    int deleteByPrimaryKey(Integer type);

    int insert(ContextTypeEO record);

    int insertSelective(ContextTypeEO record);

    ContextTypeEO selectByPrimaryKey(Integer type);

    int updateByPrimaryKeySelective(ContextTypeEO record);

    int updateByPrimaryKey(ContextTypeEO record);
}