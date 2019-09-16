drop table if exists fw_application_service;

/*==============================================================*/
/* Table: fw_application_service                                */
/*==============================================================*/
create table fw_application_service
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   APPLICATION_ID       varchar(64) not null comment 'Application Id',
   SERVICE_ID           varchar(64) not null comment 'Service Id',
   PRODUCT_ID           varchar(64) comment 'Extension for the product',
   CLIENT_ID            varchar(64) comment 'Extension for the client',
   TENANT_ID            bigint default 0 not null comment 'Extension for the tenant',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Applicaction needs which services to support'
AUTO_INCREMENT=1;
