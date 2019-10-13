drop table if exists fw_application_service;

/*==============================================================*/
/* Table: fw_application_service                                */
/*==============================================================*/
create table fw_application_service
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   APPLICATION_ID       varchar(64) not null comment '应用ID',
   SERVICE_ID           varchar(64) not null comment '服务ID',
   PRODUCT_ID           varchar(64) comment '扩展属性：给特定产品的扩展',
   CLIENT_ID            varchar(64) comment '扩展属性：给特定产品端的扩展',
   TENANT_ID            varchar(64) comment '扩展属性：给特定租户的扩展',
   CONTEXT_PATH         varchar(512) comment '扩展属性：给特定使用场景的扩展',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='应用与服务关系映射表，应用需要调用哪些服务'
AUTO_INCREMENT=1;
