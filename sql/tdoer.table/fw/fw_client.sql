drop table if exists fw_client;

/*==============================================================*/
/* Table: fw_client                                             */
/*==============================================================*/
create table fw_client
(
   ID                   bigint not null auto_increment comment '产品端ID',
   PRODUCT_ID           bigint not null comment '所属产品ID',
   NAME                 varchar(64) not null comment '产品端名称',
   CODE                 varchar(64) not null comment '服务编码，必须唯一',
   CATEGORY             varchar(64) not null comment '端分类，例如2B端：B_END，2C端 ：C_END',
   TRUSTED              char(1) not null default 'N' comment '是否是受信任的产品端：Y|N，默认：N',
   SCOPES               varchar(64) not null comment '允许访问的服务资源范围，例如read, write, trust',
   ROLES                varchar(128) not null comment '产品端授权以访问服务资源，例如：ROLE_CLIENT,ROLE_TRUSTED_CLIENT',
   ENABLED              varchar(64) not null default 'N' comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_1 on fw_client(CODE);
create unique index idx_fw_client_2 on fw_client(PRODUCT_ID, NAME);
