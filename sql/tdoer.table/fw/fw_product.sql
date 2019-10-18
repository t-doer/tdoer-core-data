drop table if exists fw_product;

/*==============================================================*/
/* Table: fw_product                                            */
/*==============================================================*/
create table fw_product
(
   ID                   bigint not null auto_increment comment '产品ID',
   NAME                 varchar(64) not null comment '产品名称',
   CODE                 varchar(64) not null comment '服务编码，必须唯一',
   DESCRIPTION          varchar(512) comment '产品描述',
   LANGUAGES            varchar(200) not null comment '产品支持的语言列表，以逗号隔开',
   VERSION              varchar(32) not null comment '产品版本号',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_product_1 on fw_product(NAME);
create unique index idx_fw_product_2 on fw_product(CODE);