drop table if exists fw_tenant;

/*==============================================================*/
/* Table: fw_tenant                                             */
/*==============================================================*/
create table fw_tenant
(
   ID                   bigint not null auto_increment comment '租户ID',
   GUID                 varchar(64) not null comment '租户全局ID，用于前端展示',
   NAME                 varchar(64) not null comment '租户名称',
   CODE                 varchar(64) not null comment '租户编码',

   ENABLED              char(1) not null default 'N' comment '是否启用：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='租户'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_1 on fw_tenant(GUID);
create unique index idx_fw_tenant_2 on fw_tenant(NAME);
create unique index idx_fw_tenant_3 on fw_tenant(CODE);

