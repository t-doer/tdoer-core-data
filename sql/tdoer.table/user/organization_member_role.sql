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
