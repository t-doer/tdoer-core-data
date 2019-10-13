drop table if exists fw_client_context;

/*==============================================================*/
/* Table: fw_client_context                                     */
/*==============================================================*/
create table fw_client_context
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   CLIENT_ID            varchar(64) comment '产品端ID',
   CONTEXT_PATH         varchar(512) not null comment '使用场景类型路径',
   TENANT_ID            bigint default NULL comment '扩展属性：给特定租户的扩展',
   ENTRY_APP_ID         varchar(64) comment '默认入口应用ID',
   ENTRY_NAV_ITEM       varchar(64) comment '默认入口导航项',
   ENTRY_LANGUAGE       char(5) comment '默认访问语言，如果为空，将使用租户设置的默认语言',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端与使用场景关系表，产品端安装了哪些使用场景'
AUTO_INCREMENT=1;
