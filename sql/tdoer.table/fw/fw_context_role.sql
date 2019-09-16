drop table if exists fw_context_role;

/*==============================================================*/
/* Table: fw_context_role                                       */
/*==============================================================*/
create table fw_context_role
(
   ID                   bigint not null auto_increment comment 'Role ID',
   NAME                 varchar(64) not null comment 'Role''s name',
   CODE                 varchar(64) not null comment 'Role''s code',
   CONTEXT_PATH         varchar(512) not null comment 'Context path',
   PRODUCT_ID           varchar(64) comment 'Extension for the product',
   CLIENT_ID            varchar(64) default NULL comment 'Extension for the  client',
   TENANT_ID            bigint default 0 not NULL comment 'Extension for the tenant',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Context Configuration: a context has what roles'
AUTO_INCREMENT=1;
