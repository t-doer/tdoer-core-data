package com.tdoer.coredata.framework.mapper.master.product;

import com.tdoer.coredata.framework.eo.product.ClientServiceEO;

public interface ClientServiceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ClientServiceEO record);

    int insertSelective(ClientServiceEO record);

    ClientServiceEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ClientServiceEO record);

    int updateByPrimaryKey(ClientServiceEO record);
}