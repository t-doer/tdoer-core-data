package com.tdoer.coredata.framework.mapper.service;

import com.tdoer.coredata.framework.eo.service.ServiceMethodEO;

public interface ServiceMethodMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ServiceMethodEO record);

    int insertSelective(ServiceMethodEO record);

    ServiceMethodEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ServiceMethodEO record);

    int updateByPrimaryKey(ServiceMethodEO record);
}