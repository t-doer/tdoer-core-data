drop table if exists fw_context_type;

/*==============================================================*/
/* Table: fw_context_type                                       */
/*==============================================================*/
create table fw_context_type
(
   ID                   bigint not null auto_increment comment '类型值',
   CODE                 varchar(64) not null comment '类型编码',
   NAME                 varchar(64) not null comment '类型名称',
   PARENT_TYPE          bigint not null default 0 comment '父类型值',
   CONTEXT_PATH         varchar(512) not null comment '使用场景类型路径',
   CATEGORY             varchar(64) not null comment '使用场景类型分类，例如：用户，组织等',
   TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='使用场景类型'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_type_1 on fw_context_type(CONTEXT_PATH);
create unique index idx_fw_context_type_2 on fw_context_type(CODE, TENANT_ID);
create unique index idx_fw_context_type_3 on fw_context_type(NAME, TENANT_ID);

