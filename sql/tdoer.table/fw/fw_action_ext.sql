drop table if exists fw_action_ext;

/*==============================================================*/
/* Table: fw_action_ext                                         */
/*==============================================================*/
create table fw_action_ext
(
   ID                   bigint not null auto_increment comment '扩展ID',
   ACTION_ID            bigint not null comment '操作ID',
   PAGE_ID              bigint not null comment '操作所属页面ID',
   APPLICATION_ID       bigint not null comment '操作所属应用ID',
   PRODUCT_ID           bigint not null default 0 comment '扩展属性：给特定产品的扩展，默认：0',
   CLIENT_ID            bigint not null default 0 comment '扩展属性：给特定产品端的扩展，默认：0',
   TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展，默认：0',
   CONTEXT_PATH         varchar(512) not null default 'void' comment '扩展属性：给特定使用场景的扩展，void',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='页面扩展操作'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_action_ext_1 on fw_action_ext(ACTION_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);
create index idx_fw_action_ext_2 on fw_action_ext(PAGE_ID, APPLICATION_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID,
                                                  CONTEXT_PATH);