package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.ActionMethodObj;

public interface ActionMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActionMethodObj record);

    int insertSelective(ActionMethodObj record);

    ActionMethodObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActionMethodObj record);

    int updateByPrimaryKey(ActionMethodObj record);
}