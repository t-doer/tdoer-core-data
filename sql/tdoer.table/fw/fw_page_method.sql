drop table if exists fw_page_method;

/*==============================================================*/
/* Table: fw_page_method                                    */
/*==============================================================*/
create table fw_page_method
(
   ID                   bigint not null auto_increment comment 'Mapping ID',
   PAGE_ID          bigint not null comment 'Application Page ID',
   METHOD_ID            bigint not null comment 'Service Mehod ID',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Resource''s service method'
AUTO_INCREMENT=1;
