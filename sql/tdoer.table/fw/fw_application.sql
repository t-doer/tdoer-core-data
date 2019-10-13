drop table if exists fw_application;

/*==============================================================*/
/* Table: fw_application                                        */
/*==============================================================*/
create table fw_application
(
   ID                   varchar(64) not null comment '应用ID',
   NAME                 varchar(64) not null comment '应用名称',
   DESCRIPTION          varchar(526) comment '应用描述',
   VERSION              varchar(32) comment '应用版本号',
   PROVIDER             varchar(64) comment '应用提供者，可以是个人或组织',
   AUTHOR               varchar(64) comment '应用开发者姓名，例如：Htinker Hu',
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
COMMENT='应用';
