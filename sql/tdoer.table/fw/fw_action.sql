drop table if exists fw_action;

/*==============================================================*/
/* Table: fw_action                                             */
/*==============================================================*/
create table fw_action
(
   ID                   bigint not null auto_increment comment '操作ID',
   NAME                 varchar(64) not null comment '操作名称，在一个页面上需唯一',
   CODE                 varchar(64) not null comment '操作编码，在一个页面上需唯一',
   PAGE_ID              bigint not null comment '所属页面ID',
   APPLICATION_ID       bigint not null comment '所属应用ID',
   CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化操作：Y|N，默认：N',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='UI交互页面上提供的操作'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_action_1 on fw_action(NAME , PAGE_ID);
create unique index idx_fw_action_2 on fw_action(CODE , PAGE_ID);