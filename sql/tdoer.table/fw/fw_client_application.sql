drop table if exists fw_client_application;

/*==============================================================*/
/* Table: fw_client_application                                 */
/*==============================================================*/
create table fw_client_application
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   APPLICATION_ID       bigint not null comment '应用ID',
   TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品应用映射表，定义一个产品有哪些应用'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_application_1 on fw_client_application(CLIENT_ID, APPLICATION_ID, TENANT_ID);
