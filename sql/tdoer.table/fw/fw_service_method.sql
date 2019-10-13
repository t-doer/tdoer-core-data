drop table if exists fw_service_method;

/*==============================================================*/
/* Table: fw_service_method                                     */
/*==============================================================*/
create table fw_service_method
(
   ID                   bigint not null auto_increment comment '服务方法ID',
   NAME                 varchar(256) not null comment '服务方法名称',
   METHOD               varchar(32) not null comment 'HTTP方法，例如： POST 、 GET、DELETE 等',
   URI                  varchar(256) not null comment '服务方法访问URI',
   SERVICE_ID           varchar(64) not null comment '所属服务ID',
   APPLICATION_ID       varchar(64) comment '扩展属性：给特定应用的扩展',
   PRODUCT_ID           varchar(64) comment '扩展属性：给特定产品的扩展',
   CLIENT_ID            varchar(64) comment '扩展属性：给特定产品端的扩展',
   TENANT_ID            bigint comment '扩展属性：给特定租户的扩展',
   CONTEXT_PATH         varchar(512) comment '扩展属性：给特定使用场景的扩展',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务方法'
AUTO_INCREMENT=1;
