package com.tdoer.coredata.framework.mapper.master.tenant;

import com.tdoer.coredata.framework.eo.tenant.TenantDatabaseEO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TenantDatabaseMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TenantDatabaseEO record);

    int insertSelective(TenantDatabaseEO record);

    TenantDatabaseEO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TenantDatabaseEO record);

    int updateByPrimaryKey(TenantDatabaseEO record);

    List<TenantDatabaseEO> selectList();
}