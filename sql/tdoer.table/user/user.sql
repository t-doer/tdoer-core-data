drop table if exists user;

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   ID                   bigint not null auto_increment comment 'User ID',
   TENANT_ID            bigint not null comment 'Tenant ID',
   ACCOUNT              varchar(64) not null comment 'Login account',
   PASSWORD             varchar(64) not null comment 'Login password',
   NAME                 varchar(64) not null comment 'User name',
   PHONE                varchar(20) not null comment 'Mobile phone',
   EMAIL                varchar(20) comment 'User E-mail',
   STATUS               varchar(12) not null default '1' comment 'Account status: NORMAL, LOCKED',
   REMARK               varchar(256) comment 'Remark',
   DELETED              char(1) not null comment 'Deleted or not : Y | N',
   CREATED_BY           varchar(64) not null comment 'Created by',
   CREATED_AT           datetime not null comment 'Created at',
   UPDATED_BY           varchar(64) comment 'Updated by',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='User'
AUTO_INCREMENT=1;

