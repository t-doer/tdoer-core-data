drop table if exists fw_client_navigation_item;

/*==============================================================*/
/* Table: fw_client_navigation_item                             */
/*==============================================================*/
create table fw_client_navigation_item
(
   id                   bigint not null auto_increment comment 'Navigation item''s ID',
   client_id            varchar(512) not null comment 'Client_ID',
   context_path         varchar(512) not null comment 'Extension for the context path',
   tenant_id            bigint default 0 not null comment 'Extension for the tenant',
   node_id              varchar(64) comment 'Node ID',
   parent_id            varchar(64) comment 'Parent node''s ID',
   sequence             tinyint default 0 comment 'Node sequence',
   name                 varchar(64) comment 'Node name',
   type                 varchar(16) comment 'Node type: TAB | SUBTAB | MENU | MENUOPTION | PAGE',
   anchor               varchar(512) comment 'Node anchor',
   page_id              int default NULL comment 'Page reference to application page'' ID',
   application_id       varchar(64) default NULL comment 'Application ID to which navigation page references',
   source               varchar(64) comment 'Page source: SYSTEM | 3RD-PARTY etc.',
   icon                 varchar(128) comment 'Icon URL',
   image                varchar(128) comment 'Image URL',
   protection           varchar(16) comment 'Protection scope: SYSTEM | TENANT | ...',
   is_public            char(1) default 'N' not null comment 'Public or not: Y | N',
   mode                 varchar(16) not null comment 'Extension mode: ELEMENT | ATTRIBUTE',
   context_scope        int(11) not null comment 'Context scope: 0, 1, 2, 3',
   enabled              char(1) default 'N' not null comment 'Enabled or not: Y | N',
   CREATED_BY           varchar(64) not null comment 'User''s name who created the record',
   CREATED_AT           datetime not null comment 'The time created at',
   UPDATED_BY           varchar(64) comment 'User''s name who updated at',
   UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment 'The time updated at',
   primary key (id)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Client configuration:  client navigation'
AUTO_INCREMENT=1;
