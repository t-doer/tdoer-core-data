drop table if exists fw_tenant;

/*==============================================================*/
/* Table: fw_tenant                                             */
/*==============================================================*/
create table fw_tenant
(
   ID                   bigint not null comment 'Tenant ID',
   NAME                 varchar(64) not null comment 'Tenant name',
   CODE                 varchar(64) not null comment 'Tenant code',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null,
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) character set utf8,
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Tenant'
AUTO_INCREMENT=1;


