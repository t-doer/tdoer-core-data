package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.obj.application.ApplicationServiceObj;

public interface ApplicationServiceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ApplicationServiceObj record);

    int insertSelective(ApplicationServiceObj record);

    ApplicationServiceObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ApplicationServiceObj record);

    int updateByPrimaryKey(ApplicationServiceObj record);
}