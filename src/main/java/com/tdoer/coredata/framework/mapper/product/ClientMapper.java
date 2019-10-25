package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.eo.product.ClientEO;

public interface ClientMapper {
    int deleteByPrimaryKey(String id);

    int insert(ClientEO record);

    int insertSelective(ClientEO record);

    ClientEO selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClientEO record);

    int updateByPrimaryKey(ClientEO record);
}