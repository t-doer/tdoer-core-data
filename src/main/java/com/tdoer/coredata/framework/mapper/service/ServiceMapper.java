package com.tdoer.coredata.framework.mapper.service;

import com.tdoer.coredata.framework.obj.service.ServiceObj;

public interface ServiceMapper {
    int deleteByPrimaryKey(String id);

    int insert(ServiceObj record);

    int insertSelective(ServiceObj record);

    ServiceObj selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ServiceObj record);

    int updateByPrimaryKey(ServiceObj record);
}