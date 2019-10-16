drop table if exists fw_context_role;

/*==============================================================*/
/* Table: fw_context_role                                       */
/*==============================================================*/
create table fw_context_role
(
   ID                   bigint not null auto_increment comment '角色ID',
   NAME                 varchar(64) not null comment '角色名称',
   CODE                 varchar(64) not null comment '角色编码',
   CONTEXT_PATH         varchar(512) not null comment '角色所在的使用场景路径',
   TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
   ENABLED              char(1) not null comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='使用场景定义的角色'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_role_1 on fw_context_role(TENANT_ID, CONTEXT_PATH, CODE);
create unique index idx_fw_context_role_2 on fw_context_role(TENANT_ID, CONTEXT_PATH, NAME);
