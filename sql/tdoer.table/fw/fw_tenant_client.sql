drop table if exists fw_tenant_client;

/*==============================================================*/
/* Table: fw_tenant_client                                      */
/*==============================================================*/
create table fw_tenant_client
(
   ID                   bigint not null comment 'Mapping ID',
   CLIENT_ID            varchar(64) not null comment 'Client type: H5, APP, WECHAT',
   TENANT_ID            bigint not NULL comment 'Extension for the tenant',
   HOSTS                varchar(512) not null comment 'Host domains, delimited by comma',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='A tenant has which clients and what''s client''s access host'
AUTO_INCREMENT=1;
