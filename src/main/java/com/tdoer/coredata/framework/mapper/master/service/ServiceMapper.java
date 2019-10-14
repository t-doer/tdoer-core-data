package com.tdoer.coredata.framework.mapper.master.service;

import com.tdoer.coredata.framework.eo.service.ServiceEO;

public interface ServiceMapper {
    int deleteByPrimaryKey(String id);

    int insert(ServiceEO record);

    int insertSelective(ServiceEO record);

    ServiceEO selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ServiceEO record);

    int updateByPrimaryKey(ServiceEO record);
}