drop table if exists fw_client_context_application;

/*==============================================================*/
/* Table: fw_client_context_application                         */
/*==============================================================*/
create table fw_client_context_application
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   CONTEXT_PATH         varchar(512) not null comment '使用场景路径，是实例时，属于扩展属性',
   APPLICATION_ID       bigint not null comment '应用ID',
   TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端中使用场景与应用关系表，某产品端的用场景安装了哪些应用'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_context_application_1 on fw_client_context_application(CLIENT_ID, CONTEXT_PATH,
APPLICATION_ID);
