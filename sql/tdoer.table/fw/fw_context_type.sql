drop table if exists fw_context_type;

/*==============================================================*/
/* Table: fw_context_type                                       */
/*==============================================================*/
create table fw_context_type
(
   TYPE                 int not null comment '类型值',
   CODE                 varchar(64) not null comment '类型编码',
   NAME                 varchar(64) not null comment '类型名称',
   PARENT_TYPE          int not null comment '父类型值',
   CONTEXT_PATH         varchar(512) not null comment '使用场景类型路径',
   CATEGORY             varchar(64) comment '使用场景类型分类，例如：用户，组织等',
   ENABLED              char(1) comment '是否启用对外服务：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (TYPE)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='使用场景类型';
