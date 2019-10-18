drop table if exists user;

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   ID                   bigint not null auto_increment comment '用户ID',
   GUID                 varchar(64) not null comment '用户全局ID，用于前端展示',
   TENANT_ID            bigint not null comment '所属租户ID',
   ACCOUNT              varchar(64) not null comment '登录帐号',
   PASSWORD             varchar(64) not null comment '登录密码',
   NAME                 varchar(64) not null comment '用户名',
   PHONE                varchar(20) not null comment '手机号码',
   EMAIL                varchar(20) comment 'E-mail地址',
   STATUS               varchar(12) not null default '1' comment '帐号状态：NORMAL, LOCKED',
   REMARK               varchar(256) comment '备注',
   DELETED              char(1) not null comment '是否删除：Y | N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='租户的用户'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_user_1 on user(GUID);
create unique index idx_user_2 on user(TENANT_ID, ACCOUNT);
create unique index idx_user_3 on user(TENANT_ID, PHONE);
create unique index idx_user_4 on user(TENANT_ID, EMAIL);
create unique index idx_user_5 on user(TENANT_ID, NAME);

