drop table if exists organization;

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   ID                   int not null auto_increment comment 'Organization ID',
   TENANT_ID            int not null comment 'Tenant ID',
   NAME                 varchar(128) not null comment 'Organization name',
   CODE                 varchar(64) not null comment 'Organization code',
   LEVEL                int not null comment 'Organization hierarchy level: 1, 2, 3',
   STATUS               varchar(12) not null comment 'Organization status: ACTIVE, DISABLED',
   PARENT_ID            bigint(32) default NULL comment 'Parent organization‘s ID',
   CONTEXT_TYPE         int not null comment 'Context type',
   CONTEXT_PATH         varchar(512) not null comment 'Context path',
   DESCRIPTION          varchar(512) comment 'Description',
   CREATED_BY           varchar(32) not null comment 'Created by',
   CREATED_AT           datetime not null comment 'Created at',
   UPDATED_BY           varchar(32) comment 'Updated by',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Organization'
AUTO_INCREMENT=1;
