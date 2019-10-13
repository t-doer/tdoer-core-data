drop table if exists fw_client;

/*==============================================================*/
/* Table: fw_client                                             */
/*==============================================================*/
create table fw_client
(
   ID                   varchar(64) not null comment '产品端ID',
   PRODUCT_ID           varchar(64) not null comment '所属产品ID',
   NAME                 varchar(64) not null comment '产品端名称',
   CATEGORY             varchar(64) not null comment '端分类，例如2B端：2B，2C端 | 2C',
   TRUSTED              char(1) comment '是否是受信任的产品端：Y|N',
   SCOPES               varchar(64) comment '允许访问的服务资源范围，例如read, write, trust',
   ROLES                varchar(128) comment '产品端授权以访问服务资源，例如：ROLE_CLIENT,ROLE_TRUSTED_CLIENT',
   ENABLED              varchar(64) not null comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端';
