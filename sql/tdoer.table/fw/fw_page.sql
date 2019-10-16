drop table if exists fw_page;

/*==============================================================*/
/* Table: fw_page                                               */
/*==============================================================*/
create table fw_page
(
   ID                   bigint not null auto_increment comment '页面ID',
   NAME                 varchar(64) not null comment '页面名称',
   CODE                 varchar(64) not null comment '页面编码',
   URI                  varchar(256) not null comment '页面访问URI',
   APPLICATION_ID       bigint not null comment '所属应用ID',
   CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化过的服务方法：Y|N，默认：N',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='UI交互页面'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_1 on fw_page(APPLICATION_ID, NAME);
create unique index idx_fw_page_2 on fw_page(APPLICATION_ID, CODE);