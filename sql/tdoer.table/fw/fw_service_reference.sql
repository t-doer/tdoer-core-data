drop table if exists fw_service_reference;

/*==============================================================*/
/* Table: fw_service_reference                                  */
/*==============================================================*/
create table fw_service_reference
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    SERVICE_ID           bigint not null comment '服务ID',
    REFEREE_ID           bigint not null comment '被引用服务ID',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key(ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='服务引用，一个服务需直接引用哪些其他服务'
AUTO_INCREMENT=1;