drop table if exists fw_tenant_product;

/*==============================================================*/
/* Table: fw_tenant_product                                     */
/*==============================================================*/
create table fw_tenant_product
(
   ID                   bigint not null comment 'Mapping ID',
   TENANT_ID            bigint not null comment 'Tenant ID',
   PRODUCT_ID           varchar(64) not null comment 'Product ID',
   START_DATE           date not null comment 'Rental start date',
   END_DATE             date not null comment 'Rental end date',
   ENABLED              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated the record',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Product Rental, the tenant rents which products'
AUTO_INCREMENT=1;
