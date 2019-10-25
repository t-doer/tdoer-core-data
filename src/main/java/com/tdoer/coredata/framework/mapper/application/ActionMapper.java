package com.tdoer.coredata.framework.mapper.application;

import com.tdoer.coredata.framework.eo.application.ActionEO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ActionEO record);

    int insertSelective(ActionEO record);

    ActionEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ActionEO record);

    int updateByPrimaryKey(ActionEO record);
}