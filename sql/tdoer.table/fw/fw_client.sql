drop table if exists fw_client;

/*==============================================================*/
/* Table: fw_client                                             */
/*==============================================================*/
create table fw_client
(
   ID                   varchar(64) not null comment 'Client Id: o2o_engineer_app, life_h5, etc.',
   PRODUCT_ID           varchar(64) not null comment 'Product ID',
   NAME                 varchar(64) not null comment 'Client name',
   CATEGORY             varchar(64) not null comment 'Client category: B-END | C-END',
   SECRET               varchar(128) comment 'Client secret for authorization',
   GRANT_TYPES          varchar(128) not null comment 'Grant types',
   SCOPES               varchar(64) comment 'Permitted access scope, say, read, write, trust',
   AUTHORITIES          varchar(128) comment 'Authorities or roles the client play as',
   TRUSTED              char(1) default 'N' not null comment 'Trusted client or not: Y | N',
   AUTO_APPROVALS       varchar(256) comment 'Auto approvals',
   ENABLED              varchar(64) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Client Definition'
AUTO_INCREMENT=1;
