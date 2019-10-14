package com.tdoer.coredata.framework.mapper.master.context;

import com.tdoer.coredata.framework.eo.context.ContextApplicationEO;

public interface ContextApplicationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ContextApplicationEO record);

    int insertSelective(ContextApplicationEO record);

    ContextApplicationEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ContextApplicationEO record);

    int updateByPrimaryKey(ContextApplicationEO record);
}