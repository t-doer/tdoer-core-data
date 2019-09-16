package com.tdoer.coredata.framework.mapper.product;

import com.tdoer.coredata.framework.obj.product.NavigationItemObj;

public interface NavigationItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(NavigationItemObj record);

    int insertSelective(NavigationItemObj record);

    NavigationItemObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NavigationItemObj record);

    int updateByPrimaryKey(NavigationItemObj record);
}