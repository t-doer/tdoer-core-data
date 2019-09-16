drop table if exists fw_service;

/*==============================================================*/
/* Table: fw_service                                            */
/*==============================================================*/
create table fw_service
(
   ID                   varchar(64) not null comment 'Service ID',
   PROVIDER             char(10) comment 'The name of the server who provides the service',
   NAME                 varchar(64) not null comment 'Service name',
   DESCRIPTION          varchar(526) comment 'Service description',
   AUTHOR               varchar(64) comment 'Service author name',
   MAINTAINERS          varchar(128) comment 'Service maintainer names, delimited by comma',
   VERSION              varchar(32) comment 'Service version',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Backend service'
AUTO_INCREMENT=1;

