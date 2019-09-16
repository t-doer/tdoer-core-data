drop table if exists fw_client_token;

/*==============================================================*/
/* Table: fw_client_token                                       */
/*==============================================================*/
create table fw_client_token
(
   ID                   bigint not null comment 'Mapping ID',
   CLIENT_ID            varchar(64) not null comment 'Client ID, say, engineer_app',
   TENANT_ID            bigint default 0 not null comment 'Extensionf for the tenant',
   WEB_REDIRECT_URI     varchar(256) default NULL comment 'Return uri after user authorization',
   ACCESS_TOKEN_VALIDITY int not null comment 'Access token validity in seconds, for example, 43200, 12 hours (12 x 60 x 60)',
   REFRESH_TOKEN_VALIDITY int not null comment 'Refresh token validity in seconds, for example, 2592000, 30 days (30 x 24 x 60 x 60)',
   SESSION_POLICY       varchar(64) comment 'User session creation policy: ALLOW_ALL| KICK_OFF_PREVIOUS | BLOCK_NEWLY_COMING',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Client configuration: client token'
AUTO_INCREMENT=1;
