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


drop table if exists organization_member;

/*==============================================================*/
/* Table: organization_member                                   */
/*==============================================================*/
create table organization_member
(
   ID                   bigint(32) not null auto_increment comment 'Mapping ID',
   TENANT_ID            bigint not null comment 'Tenant ID',
   ORG_ID               bigint not null comment 'Organization ID',
   USER_ID              bigint not null comment 'User ID',
   STATUS               varchar(12) not null comment 'Member status: NORMAL, DISABLED',
   CREATED_BY           varchar(64) not null comment 'Created by',
   CREATED_AT           datetime not null comment 'Created at',
   UPDATED_BY           varchar(64) comment 'Updated by',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Organization Member'
AUTO_INCREMENT=1;

drop table if exists organization_member_role;

/*==============================================================*/
/* Table: organization_member_role                              */
/*==============================================================*/
create table organization_member_role
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   TENANT_ID            bigint not null comment 'Tenant ID',
   ORG_ID               bigint not null comment 'Organization ID',
   USER_ID              bigint not null comment 'User ID',
   ROLE_ID              bigint not null comment 'Role ID',
   CREATED_BY           national varchar(64) not null comment 'Created by',
   CREATED_AT           datetime not null comment 'Created at',
   UPDATED_BY           national varchar(64) comment 'Updated by',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Member role in organization'
AUTO_INCREMENT=1;

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

