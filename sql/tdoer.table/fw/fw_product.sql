drop table if exists fw_product;

/*==============================================================*/
/* Table: fw_product                                            */
/*==============================================================*/
create table fw_product
(
   ID                   varchar(64) not null comment 'Product ID',
   NAME                 varchar(64) not null comment 'Product''s name',
   LANGUAGES            varchar(200) not null comment 'Languages the product supports',
   DEFAULT_LANGUAGE     char(5) not null comment 'Default language',
   DESCRIPTION          varchar(512) comment 'Product''s description',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Product';
