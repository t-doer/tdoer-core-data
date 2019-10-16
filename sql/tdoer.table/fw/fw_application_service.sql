drop table if exists fw_application_service;

/*==============================================================*/
/* Table: fw_application_service                                */
/*==============================================================*/
create table fw_application_service
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   APPLICATION_ID       bigint not null comment '应用ID',
   SERVICE_ID           bigint not null comment '服务ID',
   CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化操作：Y|N，默认：N',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='应用与服务关系映射表，应用需要调用哪些服务'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_application_service_1 on fw_application_service(APPLICATION_ID, SERVICE_ID);