drop table if exists fw_tenant_client;

/*==============================================================*/
/* Table: fw_tenant_client                                      */
/*==============================================================*/
create table fw_tenant_client
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   TENANT_ID            bigint default NULL comment '租户ID',
   PRODUCT_ID           bigint not null comment '产品ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   SECRET               varchar(64) not null comment '租户接入产品端的秘钥',
   HOSTS                varchar(512) not null comment '端访问域名列表，以逗号分隔',
   ENABLED              char(1) not null default 'N' comment '是否生效：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='租户与产品端关系表，产品端给租户的配置，比如访问域名等'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_client_1 on fw_tenant_client(TENANT_ID, CLIENT_ID);
