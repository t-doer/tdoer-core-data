package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ClientServiceObj;

public interface ClientServiceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientServiceObj record);

    int insertSelective(ClientServiceObj record);

    ClientServiceObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientServiceObj record);

    int updateByPrimaryKey(ClientServiceObj record);
}