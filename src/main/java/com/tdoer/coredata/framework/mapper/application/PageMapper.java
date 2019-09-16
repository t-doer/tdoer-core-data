package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.PageObj;

public interface PageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PageObj record);

    int insertSelective(PageObj record);

    PageObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PageObj record);

    int updateByPrimaryKey(PageObj record);
}