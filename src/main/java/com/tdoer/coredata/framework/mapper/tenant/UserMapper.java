package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.eo.tenant.UserEO;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserEO record);

    int insertSelective(UserEO record);

    UserEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserEO record);

    int updateByPrimaryKey(UserEO record);
}