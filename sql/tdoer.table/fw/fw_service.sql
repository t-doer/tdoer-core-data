drop table if exists fw_service;

/*==============================================================*/
/* Table: fw_service                                            */
/*==============================================================*/
create table fw_service
(
   ID                   varchar(64) not null comment '服务ID',
   NAME                 varchar(64) not null comment '服务名称',
   DESCRIPTION          varchar(526) comment '服务描述',
   VERSION              varchar(32) comment '服务版本，比如1.0',
   PROVIDER             varchar(64) comment '服务提供者，可以是个人，也可以是组织',
   AUTHOR               varchar(64) comment '服务开发者姓名，例如：Htinker Hu',
   MAINTAINERS          varchar(128) comment '维护人员名单列表，以逗号分隔',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务';