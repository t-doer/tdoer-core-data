drop table if exists fw_action;

/*==============================================================*/
/* Table: fw_action                               */
/*==============================================================*/
create table fw_action
(
   ID                   bigint not null auto_increment comment 'Action ID',
   NAME                 varchar(64) not null comment 'Action name, should be unique in a page',
   CODE                 varchar(256) not null comment 'Action code, should be unique in a page',
   PAGE_ID              bigint default NULL comment 'Page Id, the action belongs to',
   APPLICATION_ID       varchar(64) not null comment 'Application ID',
   PRODUCT_ID           varchar(64) comment 'Extensionf or the product',
   CLIENT_ID            varchar(64) comment 'Extension for the product''s client',
   TENANT_ID            bigint default 0 not null comment 'Extension for the tenant',
   CONTEXT_PATH         varchar(512) default null comment 'Extension for the context path',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Application Page''s Action'
AUTO_INCREMENT=1;
