drop table if exists fw_context_type;

/*==============================================================*/
/* Table: fw_context_type                                       */
/*==============================================================*/
create table fw_context_type
(
   TYPE                 int not null comment 'Context type',
   CODE                 varchar(64) not null comment 'Context code',
   NAME                 varchar(64) not null comment 'Context  name',
   CATEGORY             varchar(64) not null comment 'Context  tag',
   PARENT_TYPE          int default NULL comment 'Parent''s context type',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (TYPE)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Context Type'
AUTO_INCREMENT=1;
