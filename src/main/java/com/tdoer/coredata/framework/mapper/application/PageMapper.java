package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.eo.application.PageEO;

public interface PageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PageEO record);

    int insertSelective(PageEO record);

    PageEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PageEO record);

    int updateByPrimaryKey(PageEO record);
}