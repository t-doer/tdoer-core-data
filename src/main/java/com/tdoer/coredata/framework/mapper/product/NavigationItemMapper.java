package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.eo.product.NavigationItemEO;

public interface NavigationItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(NavigationItemEO record);

    int insertSelective(NavigationItemEO record);

    NavigationItemEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NavigationItemEO record);

    int updateByPrimaryKey(NavigationItemEO record);
}