drop table if exists fw_tenant_product;

/*==============================================================*/
/* Table: fw_tenant_product                                     */
/*==============================================================*/
create table fw_tenant_product
(
   ID                   bigint not null auto_increment comment '映射关系ID',
   TENANT_ID            bigint not null comment '租户ID',
   PRODUCT_ID           bigint not null comment '产品ID',
   START_DATE           date not null comment '租赁开始时间',
   END_DATE             date not null comment '租赁结束时间',
   DEFAULT_LANGUAGE     char(5) not null comment '默认使用产品的语言',
   ENABLED              char(1) not null default 'N' comment '租赁是否生效',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品租赁表，租户租用了哪些产品'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_product_1 on fw_tenant_product(TENANT_ID, PRODUCT_ID);
