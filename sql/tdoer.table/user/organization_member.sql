drop table if exists organization_member;

/*==============================================================*/
/* Table: organization_member                                   */
/*==============================================================*/
create table organization_member
(
   ID                   bigint(32) not null auto_increment comment '关系映射ID',
   ORG_ID               bigint not null comment '组织ID',
   TENANT_ID            bigint not null comment '组织所属租户ID',
   USER_ID              bigint not null comment '用户ID',
   ROLE_IDS             varchar(512) comment '角色ID列表，以逗号分隔',
   STATUS               varchar(12) not null comment '成员状态，例如：NORMAL, DISABLED',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='组织成员'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_organization_member_1 on organization(ORG_ID, USER_ID);


