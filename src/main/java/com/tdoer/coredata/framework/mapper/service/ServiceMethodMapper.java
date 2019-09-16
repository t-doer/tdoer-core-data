package com.tdoer.coredata.framework.mapper.service;

import com.tdoer.coredata.framework.obj.service.ServiceMethodObj;

public interface ServiceMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ServiceMethodObj record);

    int insertSelective(ServiceMethodObj record);

    ServiceMethodObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ServiceMethodObj record);

    int updateByPrimaryKey(ServiceMethodObj record);
}