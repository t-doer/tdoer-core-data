drop table if exists fw_context_role_resource;

/*==============================================================*/
/* Table: fw_context_role                                       */
/*==============================================================*/
create table fw_context_role_resource
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   ROLE_ID              bigint not null comment '角色ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   RESOURCE_ID          bigint not null comment '授权的资源ID',
   RESOURCE_TYPE        varchar(16) not null comment '授权的资源类型：PAGE|ACTION|NAVIGATION',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='角色与产品前端资源授权关系表'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_role_resource_1 on fw_context_role_resource(ROLE_ID, CLIENT_ID, RESOURCE_ID,
                                                                               RESOURCE_TYPE);
