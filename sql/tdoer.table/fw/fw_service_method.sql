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
   SERVICE_ID           bigint not null comment '所属服务ID',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化过的服务方法：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务方法'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_service_method_1 on fw_service_method(SERVICE_ID, NAME);
