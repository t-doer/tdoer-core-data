package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.ApplicationObj;

public interface ApplicationMapper {
    int deleteByPrimaryKey(String id);

    int insert(ApplicationObj record);

    int insertSelective(ApplicationObj record);

    ApplicationObj selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ApplicationObj record);

    int updateByPrimaryKey(ApplicationObj record);
}