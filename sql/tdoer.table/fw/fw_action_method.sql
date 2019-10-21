drop table if exists fw_action_method;

/*==============================================================*/
/* Table: fw_action_method                                    */
/*==============================================================*/
create table fw_action_method
(
   ID                   bigint not null auto_increment comment '关系映射Id',
   APPLICATION_ID       bigint not null comment '操作所属应用ID',
   PAGE_ID              bigint not null comment '所属页面ID',
   ACTION_ID            bigint not null comment '操作Id',
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
COMMENT='操作与服务方法关系映射表，执行操作想调用哪些服务方法'
AUTO_INCREMENT=1;

create unique index idx_fw_action_method_1 on fw_action_method (ACTION_ID, METHOD_ID);