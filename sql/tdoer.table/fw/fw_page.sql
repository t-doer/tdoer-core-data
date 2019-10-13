drop table if exists fw_page;

/*==============================================================*/
/* Table: fw_page                               */
/*==============================================================*/
create table fw_page
(
   ID                   bigint not null auto_increment comment '页面ID',
   NAME                 varchar(64) not null comment '页面名称',
   CODE                 varchar(64) comment '页面编码',
   URI                  varchar(256) not null comment '页面访问URI',
   APPLICATION_ID       varchar(64) not null comment '所属应用ID',
   PRODUCT_ID           varchar(64) comment '扩展属性：给特定产品的扩展',
   CLIENT_ID            varchar(64) comment '扩展属性：给特定产品端的扩展',
   TENANT_ID            bigint default NULL comment '扩展属性：给特定租户的扩展',
   CONTEXT_PATH         varchar(512) default NULL comment '扩展属性：给特定使用场景的扩展',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='UI交互页面'
AUTO_INCREMENT=1;
