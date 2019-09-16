package com.tdoer.coredata.framework.mapper.context;

import com.tdoer.coredata.framework.obj.context.ContextTypeObj;

public interface ContextTypeMapper {
    int deleteByPrimaryKey(Integer type);

    int insert(ContextTypeObj record);

    int insertSelective(ContextTypeObj record);

    ContextTypeObj selectByPrimaryKey(Integer type);

    int updateByPrimaryKeySelective(ContextTypeObj record);

    int updateByPrimaryKey(ContextTypeObj record);
}