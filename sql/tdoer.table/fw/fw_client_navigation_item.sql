drop table if exists fw_client_navigation_item;

/*==============================================================*/
/* Table: fw_client_navigation_item                             */
/*==============================================================*/
create table fw_client_navigation_item
(
   ID                   bigint not null auto_increment comment '导航项ID',
   CLIENT_ID            bigint not null comment '产品端ID',
   CONTEXT_PATH         varchar(512) not null comment '使用场景路径，是实例时，属于扩展属性',
   TENANT_ID            bigint default 0 comment '扩展属性：给特定租户的扩展',
   NODE_ID              varchar(64) comment '导航节点ID',
   PARENT_ID            varchar(64) comment '导航父节点D',
   SEQUENCE             tinyint default 0 comment '导航节点显示顺序',
   NAME                 varchar(64) comment '导航节点名称',
   TYPE                 varchar(16) comment '导航节点类型： TAB | SUBTAB | MENU | MENUOPTION | PAGE',
   ANCHOR               varchar(512) comment '导航节点访问连接',
   PAGE_ID              bigint default NULL comment '应用的页面ID',
   APPLICATION_ID       varchar(64) default NULL comment '应用ID',
   SOURCE               varchar(64) comment '页面来源：SYSTEM | 3RD-PARTY等',
   ICON_STYLE           varchar(128) comment '导航图标式样',
   IMAGE_URL            varchar(128) comment '导航图片URL',
   PROTECTION           varchar(16) comment '保护级别：SYSTEM | TENANT | ...',
   IS_PUBLIC            char(1) comment '是否属公开资源：Y|N',
   MODE                 varchar(16) not null comment '扩展模式：ELEMENT | ATTRIBUTE',
   ENABLED              char(1) comment '是否启用：Y|N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='产品端导航项配置'
AUTO_INCREMENT=1;

/**
 * Index list
 */
