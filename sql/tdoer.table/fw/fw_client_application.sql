drop table if exists fw_client_application;

/*==============================================================*/
/* Table: fw_client_application                                 */
/*==============================================================*/
create table fw_client_application
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   PRODUCT_ID           varchar(64) not null comment 'Product ID',
   CLIENT_ID            varchar(64) comment 'Exention for the client',
   TENANT_ID            bigint default 0 not null comment 'Extension for the tenant',
   APPLICATION_ID       varchar(64) not null comment 'Application ID',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Client Configuration: a product''s client supports which app'
AUTO_INCREMENT=1;
