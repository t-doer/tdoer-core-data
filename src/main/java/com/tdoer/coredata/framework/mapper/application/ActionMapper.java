package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.ActionObj;

public interface ActionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActionObj record);

    int insertSelective(ActionObj record);

    ActionObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActionObj record);

    int updateByPrimaryKey(ActionObj record);
}