package com.tdoer.coredata.framework.mapper.context;

import com.tdoer.coredata.framework.obj.context.ContextApplicationObj;

public interface ContextApplicationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextApplicationObj record);

    int insertSelective(ContextApplicationObj record);

    ContextApplicationObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextApplicationObj record);

    int updateByPrimaryKey(ContextApplicationObj record);
}