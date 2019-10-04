package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.eo.application.PageMethodEO;

public interface PageMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PageMethodEO record);

    int insertSelective(PageMethodEO record);

    PageMethodEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PageMethodEO record);

    int updateByPrimaryKey(PageMethodEO record);
}