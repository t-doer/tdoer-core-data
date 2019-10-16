drop table if exists fw_client_token;

/*==============================================================*/
/* Table: fw_client_token                                       */
/*==============================================================*/
create table fw_client_token
(
   ID                   bigint not null comment '映射关系ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   GRANT_TYPES          varchar(128) not null comment '授权类型列表，以逗号分隔，例如：authorization_code',
   AUTO_APPROVALS       varchar(256) comment '自动许可范围，*代表所有',
   WEB_REDIRECT_URI     varchar(256) comment '用户认证通过后重定向URI',
   ACCESS_TOKEN_VALIDITY int not null comment '访问令牌有效期限，单位秒，例如：43200, 12 小时',
   REFRESH_TOKEN_VALIDITY int not null comment '刷新令牌的有效期限，单位秒，例如：2592000，30 天',
   SESSION_POLICY       varchar(64) not null comment '用户Session创建策略：KICK_OFF_PREVIOUS',
   TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='客户端访问令牌设置'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_token on fw_client_token(CLIENT_ID, TENANT_ID);
