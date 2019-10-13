drop table if exists fw_action;

/*==============================================================*/
/* Table: fw_action                               */
/*==============================================================*/
create table fw_action
(
   ID                   bigint not null auto_increment comment '操作ID',
   NAME                 varchar(64) not null comment '操作名称，在一个页面上需唯一',
   CODE                 varchar(64) not null comment '操作编码，在一个页面上需唯一',
   PAGE_ID              bigint default NULL comment '所属页面ID',
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
COMMENT='UI交互页面上提供的操作'
AUTO_INCREMENT=1;
