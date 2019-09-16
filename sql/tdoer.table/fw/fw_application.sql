drop table if exists fw_application;

/*==============================================================*/
/* Table: fw_application                                        */
/*==============================================================*/
create table fw_application
(
   ID                   varchar(64) not null comment 'Application ID',
   NAME                 varchar(64) not null comment 'Application name',
   DESCRIPTION          varchar(526) comment 'Application description',
   AUTHOR               varchar(64) comment 'Application author name',
   MAINTAINERS          varchar(128) comment 'Application maintainer names, delimited by comma',
   VERSION              varchar(32) comment 'Application version',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not:Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Front-end application'
AUTO_INCREMENT=1;
