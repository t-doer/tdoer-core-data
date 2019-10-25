package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.eo.application.ApplicationEO;

public interface ApplicationMapper {
    int deleteByPrimaryKey(String id);

    int insert(ApplicationEO record);

    int insertSelective(ApplicationEO record);

    ApplicationEO selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ApplicationEO record);

    int updateByPrimaryKey(ApplicationEO record);
}