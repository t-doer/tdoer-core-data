package com.tdoer.coredata.framework.mapper.master.product;

import com.tdoer.coredata.framework.eo.product.ClientTokenEO;

public interface ClientTokenMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientTokenEO record);

    int insertSelective(ClientTokenEO record);

    ClientTokenEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientTokenEO record);

    int updateByPrimaryKey(ClientTokenEO record);
}