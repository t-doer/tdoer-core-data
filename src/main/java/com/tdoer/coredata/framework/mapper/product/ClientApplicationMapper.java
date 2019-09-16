package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ClientApplicationObj;

public interface ClientApplicationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientApplicationObj record);

    int insertSelective(ClientApplicationObj record);

    ClientApplicationObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientApplicationObj record);

    int updateByPrimaryKey(ClientApplicationObj record);
}