package com.tdoer.coredata.framework.mapper.master.application;

import com.tdoer.coredata.framework.eo.application.ApplicationServiceEO;

public interface ApplicationServiceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ApplicationServiceEO record);

    int insertSelective(ApplicationServiceEO record);

    ApplicationServiceEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ApplicationServiceEO record);

    int updateByPrimaryKey(ApplicationServiceEO record);
}