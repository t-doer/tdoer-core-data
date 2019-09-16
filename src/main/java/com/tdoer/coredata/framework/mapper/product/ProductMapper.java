package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.ProductObj;

public interface ProductMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProductObj record);

    int insertSelective(ProductObj record);

    ProductObj selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProductObj record);

    int updateByPrimaryKey(ProductObj record);
}