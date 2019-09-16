package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ClientContextObj;

public interface ClientContextMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientContextObj record);

    int insertSelective(ClientContextObj record);

    ClientContextObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientContextObj record);

    int updateByPrimaryKey(ClientContextObj record);
}