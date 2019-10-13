drop table if exists fw_client_context_application;

/*==============================================================*/
/* Table: fw_client_context_application                         */
/*==============================================================*/
create table fw_client_context_application
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   CLIENT_ID            varchar(64) default NULL comment '产品端ID',
   CONTEXT_PATH         varchar(512) not null comment '使用场景路径，是实例时，属于扩展属性',
   APPLICATION_ID       varchar(64) not null comment '应用ID',
   TENANT_ID            bigint default NULL comment '扩展属性：给特定租户的扩展',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端中使用场景与应用关系表，某产品端的用场景安装了哪些应用'
AUTO_INCREMENT=1;