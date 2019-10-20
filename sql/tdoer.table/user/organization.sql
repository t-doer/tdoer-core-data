drop table if exists organization;

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   ID                   bigint not null auto_increment comment '组织ID',
   GUID                 varchar(64) not null comment '组织全局ID，用于前端展示',
   TENANT_ID            bigint not null comment '组织所属租户ID',
   NAME                 varchar(128) not null comment '组织名称',
   CODE                 varchar(64) not null comment '组织编码',
   LEVEL                int not null comment '组织层级：1, 2, 3',
   STATUS               varchar(12) not null comment '组织状态，例如：ACTIVE, DISABLED',
   PARENT_ID            bigint(32) default NULL comment '父组织ID',
   CONTEXT_TYPE         bigint not null comment '使用场景类型',
   CONTEXT_PATH         varchar(512) not null comment '使用场景路径',
   DESCRIPTION          varchar(512) comment '描述',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint comment '更新用户ID',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='组织'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_organization_1 on organization(GUID);
create unique index idx_organization_2 on organization(TENANT_ID, NAME);
create unique index idx_organization_3 on organization(TENANT_ID, CODE);

