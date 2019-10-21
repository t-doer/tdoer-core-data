drop table if exists fw_service_method_ext;

/*==============================================================*/
/* Table: fw_service_method_ext                                 */
/*==============================================================*/
create table fw_service_method_ext
(
   ID                   bigint not null auto_increment comment '扩展ID',
   METHOD_ID            bigint not null comment '服务方法ID',
   SERVICE_ID           bigint not null comment '方法所属服务ID',
   APPLICATION_ID       bigint default 0 not null comment '扩展属性：给特定应用的扩展，默认：0',
   PRODUCT_ID           bigint default 0  not null comment '扩展属性：给特定产品的扩展，默认：0',
   CLIENT_ID            bigint default 0 not null comment '扩展属性：给特定产品端的扩展，默认：0',
   TENANT_ID            bigint default 0 not null comment '扩展属性：给特定租户的扩展，默认：0',
   CONTEXT_PATH         varchar(512) default 'void' not null comment '扩展属性：给特定使用场景的扩展，默认：void',
   ENABLED              char(1) default 'N' not null comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务扩展方法'
AUTO_INCREMENT=1;

/**
 * Index list
 */
 create unique index idx_fw_service_method_ext_1 on fw_service_method_ext(METHOD_ID, APPLICATION_ID, PRODUCT_ID,
                                                                          CLIENT_ID, TENANT_ID, CONTEXT_PATH);
 create index idx_fw_service_method_ext_2 on fw_service_method_ext(SERVICE_ID, APPLICATION_ID, PRODUCT_ID,
                                                                         CLIENT_ID, TENANT_ID, CONTEXT_PATH);


