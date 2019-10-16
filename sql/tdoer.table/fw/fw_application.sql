drop table if exists fw_application;

/*==============================================================*/
/* Table: fw_application                                        */
/*==============================================================*/
create table fw_application
(
   ID                   bigint not null auto_increment comment '应用ID',
   NAME                 varchar(64) not null comment '应用名称',
   CODE                 varchar(64) not null comment '服务编码，必须唯一',
   DESCRIPTION          varchar(526) comment '应用描述',
   VERSION              varchar(32) not null comment '应用版本号',
   PROVIDER             varchar(64) not null comment '应用提供者，可以是个人或组织',
   ENABLED              char(1) default 'N' not null comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='应用'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_application_1 on fw_application(NAME);
create unique index idx_fw_application_2 on fw_application(CODE);
