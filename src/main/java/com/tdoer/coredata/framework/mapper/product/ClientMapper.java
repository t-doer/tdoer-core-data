package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ClientObj;

public interface ClientMapper {
    int deleteByPrimaryKey(String id);

    int insert(ClientObj record);

    int insertSelective(ClientObj record);

    ClientObj selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ClientObj record);

    int updateByPrimaryKey(ClientObj record);
}