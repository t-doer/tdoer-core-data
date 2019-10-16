drop table if exists fw_client_service;

/*==============================================================*/
/* Table: fw_client_service                                     */
/*==============================================================*/
create table fw_client_service
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   SERVICE_ID           bigint not null comment '服务ID',
   TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端与服务的关系表，一个端可以访问的服务'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_service_1 on fw_client_service(CLIENT_ID, SERVICE_ID, TENANT_ID);
