drop table if exists fw_page_ext;

/*==============================================================*/
/* Table: fw_page_ext                                           */
/*==============================================================*/
create table fw_page_ext
(
   ID                   bigint not null auto_increment comment '扩展ID',
   PAGE_ID              bigint not null comment '页面ID',
   PRODUCT_ID           bigint not null default 0 comment '扩展属性：给特定产品的扩展，默认：0',
   CLIENT_ID            bigint not null default 0 comment '扩展属性：给特定产品端的扩展，默认：0',
   TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展，默认：0',
   CONTEXT_PATH         varchar(512) not null default 'void' NULL comment '扩展属性：给特定使用场景的扩展，void',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='UI交互扩展页面'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_ext_1 on fw_page_ext(PAGE_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);
