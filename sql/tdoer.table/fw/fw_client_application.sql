drop table if exists fw_client_application;

/*==============================================================*/
/* Table: fw_client_application                                 */
/*==============================================================*/
create table fw_client_application
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   CLIENT_ID            varchar(64) comment '产品端ID',
   APPLICATION_ID       varchar(64) not null comment '应用ID',
   TENANT_ID            bigint default NULL comment '扩展属性：给特定租户的扩展',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品应用映射表，定义一个产品有哪些应用'
AUTO_INCREMENT=1;