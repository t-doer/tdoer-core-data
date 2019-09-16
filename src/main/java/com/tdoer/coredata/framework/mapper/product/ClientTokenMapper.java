package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ClientTokenObj;

public interface ClientTokenMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientTokenObj record);

    int insertSelective(ClientTokenObj record);

    ClientTokenObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientTokenObj record);

    int updateByPrimaryKey(ClientTokenObj record);
}