drop table if exists fw_page_method;

/*==============================================================*/
/* Table: fw_page_method                                    */
/*==============================================================*/
create table fw_page_method
(
   ID                   bigint not null auto_increment comment '关系映射ID',
   APPLICATION_ID       bigint not null comment '页面所属应用ID',
   PAGE_ID              bigint not null comment '页面ID',
   SERVICE_ID           bigint not null comment '方法所属服务ID',
   METHOD_ID            bigint not null comment '服务方法ID',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='页面与服务方法关系映射表，加载页面需调用哪些服务方法'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_method_1 on fw_page_method(PAGE_ID, METHOD_ID);
