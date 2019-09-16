drop table if exists fw_service_method;

/*==============================================================*/
/* Table: fw_service_method                                     */
/*==============================================================*/
create table fw_service_method
(
   ID                   bigint not null auto_increment comment 'Service method''s ID',
   SERVICE_ID           varchar(64) not null comment 'The service who provide the service method',
   NAME                 varchar(256) not null comment 'Servie method''s name',
   METHOD               varchar(32) not null comment 'HTTP method: POST | GET | DELETE | ...',
   URI                  varchar(256) not null comment 'The method''s HTTP URI',
   PRODUCT_ID           varchar(64) comment 'Extension for the product',
   CLIENT_ID            varchar(64) comment 'Extension for the product''s client',
   TENANT_ID            bigint default 0 not null comment 'Extension for the tenant',
   CONTEXT_PATH         varchar(512) comment 'Extension for the context path',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Service method'
AUTO_INCREMENT=1;
