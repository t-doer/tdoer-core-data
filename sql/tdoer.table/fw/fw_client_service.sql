drop table if exists fw_client_service;

/*==============================================================*/
/* Table: fw_client_service                                     */
/*==============================================================*/
create table fw_client_service
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   CLIENT_ID            varchar(64) comment '产品端ID',
   SERVICE_ID           varchar(64) not null comment '服务ID',
   TENANT_ID            bigint default NULL comment '扩展属性：给特定租户的扩展',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端与服务的关系表，一个端所有应用可以访问的服务'
AUTO_INCREMENT=1;