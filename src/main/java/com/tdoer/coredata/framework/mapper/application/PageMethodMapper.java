package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.PageMethodObj;

public interface PageMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(PageMethodObj record);

    int insertSelective(PageMethodObj record);

    PageMethodObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PageMethodObj record);

    int updateByPrimaryKey(PageMethodObj record);
}