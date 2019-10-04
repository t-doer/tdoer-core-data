package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.eo.application.ActionMethodEO;

public interface ActionMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActionMethodEO record);

    int insertSelective(ActionMethodEO record);

    ActionMethodEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActionMethodEO record);

    int updateByPrimaryKey(ActionMethodEO record);
}