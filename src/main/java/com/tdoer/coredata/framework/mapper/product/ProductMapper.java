package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.eo.product.ProductEO;

public interface ProductMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProductEO record);

    int insertSelective(ProductEO record);

    ProductEO selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProductEO record);

    int updateByPrimaryKey(ProductEO record);
}