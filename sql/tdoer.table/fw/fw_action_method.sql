drop table if exists fw_action_method;

/*==============================================================*/
/* Table: fw_action_method                                    */
/*==============================================================*/
create table fw_action_method
(
   ID                   bigint not null auto_increment comment '关系映射Id',
   ACTION_ID            bigint not null comment '操作Id',
   METHOD_ID            bigint not null comment '服务方法ID',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='操作与服务方法关系映射表，执行操作想调用哪些服务方法'
AUTO_INCREMENT=1;
