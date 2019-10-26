drop table if exists fw_context_public_method;

/*==============================================================*/
/* Table: fw_context_public_method                                */
/*==============================================================*/
create table fw_context_public_method
(
   ID                   bigint not null auto_increment comment '关系映射Id',
   TENANT_ID            bigint default NULL comment '租户ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   CONTEXT_PATH         varchar(512) not null comment '使用场景路径，是实例时，属于扩展属性',
   METHOD_ID            bigint not null comment '服务方法ID',
   SERVICE_ID           bigint not null comment '服务ID',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色与后端服务方法授权关系表'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_public_method_1 on fw_context_public_method(CLIENT_ID, TENANT_ID, CONTEXT_PATH,
                                                                               METHOD_ID);
create index idx_fw_context_public_method_2 on fw_context_public_method(CLIENT_ID, TENANT_ID, CONTEXT_PATH);