drop table if exists fw_context_role_authority;

/*==============================================================*/
/* Table: fw_context_role_authority                             */
/*==============================================================*/
create table fw_context_role_authority
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   ROLE_ID              bigint not null comment 'Role ID',
   RESOURCE_ID          bigint not null comment 'Authorized resource''s ID:  Navigation Item ID or Resource ID',
   RESOURCE_TYPE        varchar(16) not null comment 'PAGE | ACTION | NAVIGATION',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Context Role Authority'
AUTO_INCREMENT=1;
