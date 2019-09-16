drop table if exists fw_client_context;

/*==============================================================*/
/* Table: fw_client_context                                     */
/*==============================================================*/
create table fw_client_context
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   PRODUCT_ID           varchar(64) not null comment 'Product ID',
   CLIENT_ID            varchar(64) comment 'Extension for the client',
   TENANT_ID            bigint default 0 not null comment 'Extension for the tenant',
   CONTEXT_PATH         varchar(512) not null comment 'Context path to support',
   ENTRY_APP_ID         varchar(64) comment 'Default entry application ID when user enters the context',
   ENTRY_NAV_ITEM       varchar(64) comment 'Default entry navigation item when user enters the context instance',
   ENTRY_LANGUAGE       char(5) comment 'Default language when user enters the context',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Client Configuration: a product''s client supports which context'
AUTO_INCREMENT=1;

