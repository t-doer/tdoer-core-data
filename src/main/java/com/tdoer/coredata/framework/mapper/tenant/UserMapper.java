package com.tdoer.coredata.framework.mapper.tenant;

import com.tdoer.coredata.framework.obj.tenant.UserObj;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserObj record);

    int insertSelective(UserObj record);

    UserObj selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserObj record);

    int updateByPrimaryKey(UserObj record);
}