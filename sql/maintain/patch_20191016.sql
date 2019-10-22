drop table if exists fw_action;

/*==============================================================*/
/* Table: fw_action                                             */
/*==============================================================*/
create table fw_action
(
   ID                   bigint not null auto_increment comment '操作ID',
   NAME                 varchar(64) not null comment '操作名称，在一个页面上需唯一',
   CODE                 varchar(64) not null comment '操作编码，在一个页面上需唯一',
   PAGE_ID              bigint not null comment '所属页面ID',
   APPLICATION_ID       bigint not null comment '所属应用ID',
   CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化操作：Y|N，默认：N',
   ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
   CREATED_BY           bigint not null comment '创建用户ID',
   CREATED_AT           datetime not null comment '创建日期时间',
   UPDATED_BY           bigint not null comment '更新用户ID',
   UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
   primary key (ID)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='UI交互页面上提供的操作'
AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_action_1 on fw_action(NAME , PAGE_ID);
create unique index idx_fw_action_2 on fw_action(CODE , PAGE_ID);

drop table if exists fw_action_ext;

/*==============================================================*/
/* Table: fw_action_ext                                         */
/*==============================================================*/
create table fw_action_ext
(
    ID                   bigint not null auto_increment comment '扩展ID',
    ACTION_ID            bigint not null comment '操作ID',
    PAGE_ID              bigint not null comment '操作所属页面ID',
    APPLICATION_ID       bigint not null comment '操作所属应用ID',
    PRODUCT_ID           bigint not null default 0 comment '扩展属性：给特定产品的扩展，默认：0',
    CLIENT_ID            bigint not null default 0 comment '扩展属性：给特定产品端的扩展，默认：0',
    TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展，默认：0',
    CONTEXT_PATH         varchar(512) not null default 'void' comment '扩展属性：给特定使用场景的扩展，void',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='页面扩展操作'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_action_ext_1 on fw_action_ext(ACTION_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);
create index idx_fw_action_ext_2 on fw_action_ext(PAGE_ID, APPLICATION_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID,
                                                  CONTEXT_PATH);

drop table if exists fw_action_method;

/*==============================================================*/
/* Table: fw_action_method                                    */
/*==============================================================*/
create table fw_action_method
(
    ID                   bigint not null auto_increment comment '关系映射Id',
    APPLICATION_ID       bigint not null comment '操作所属应用ID',
    PAGE_ID              bigint not null comment '所属页面ID',
    ACTION_ID            bigint not null comment '操作Id',
    SERVICE_ID           bigint not null comment '方法所属服务ID',
    METHOD_ID            bigint not null comment '服务方法ID',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='操作与服务方法关系映射表，执行操作想调用哪些服务方法'
    AUTO_INCREMENT=1;

create unique index idx_fw_action_method_1 on fw_action_method (ACTION_ID, METHOD_ID);

drop table if exists fw_application;

/*==============================================================*/
/* Table: fw_application                                        */
/*==============================================================*/
create table fw_application
(
    ID                   bigint not null auto_increment comment '应用ID',
    NAME                 varchar(64) not null comment '应用名称',
    CODE                 varchar(64) not null comment '服务编码，必须唯一',
    DESCRIPTION          varchar(526) comment '应用描述',
    VERSION              varchar(32) not null comment '应用版本号',
    PROVIDER             varchar(64) not null comment '应用提供者，可以是个人或组织',
    ENABLED              char(1) default 'N' not null comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='应用'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_application_1 on fw_application(NAME);
create unique index idx_fw_application_2 on fw_application(CODE);

drop table if exists fw_application_service;

/*==============================================================*/
/* Table: fw_application_service                                */
/*==============================================================*/
create table fw_application_service
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    APPLICATION_ID       bigint not null comment '应用ID',
    SERVICE_ID           bigint not null comment '服务ID',
    CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化操作：Y|N，默认：N',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='应用与服务关系映射表，应用需要调用哪些服务'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_application_service_1 on fw_application_service(APPLICATION_ID, SERVICE_ID);

drop table if exists fw_application_service_ext;

/*==============================================================*/
/* Table: fw_application_service_ext                            */
/*==============================================================*/
create table fw_application_service_ext
(
    ID                   bigint not null auto_increment comment '扩展ID',
    APPLICATION_ID       bigint not null comment '应用ID',
    SERVICE_ID           bigint not null comment '服务ID',
    PRODUCT_ID           bigint not null default 0 comment '扩展属性：给特定产品的扩展，默认：0',
    CLIENT_ID            bigint not null default 0 comment '扩展属性：给特定产品端的扩展，默认：0',
    TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展，默认：0',
    CONTEXT_PATH         varchar(512) not null default 'void' comment '扩展属性：给特定使用场景的扩展，void',
    ENABLED              char(1) not null comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='应用服务扩展关系'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_application_service_ext_1 on fw_application_service_ext(APPLICATION_ID, SERVICE_ID, PRODUCT_ID,
                                                                                   CLIENT_ID, TENANT_ID, CONTEXT_PATH);
create unique index idx_fw_application_service_ext_2 on fw_application_service_ext(APPLICATION_ID,
                                                                                   PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);                                                                          CLIENT_ID, TENANT_ID, CONTEXT_PATH);

drop table if exists fw_client;

/*==============================================================*/
/* Table: fw_client                                             */
/*==============================================================*/
create table fw_client
(
    ID                   bigint not null auto_increment comment '产品端ID',
    PRODUCT_ID           bigint not null comment '所属产品ID',
    NAME                 varchar(64) not null comment '产品端名称',
    CODE                 varchar(64) not null comment '服务编码，必须唯一',
    CATEGORY             varchar(64) not null comment '端分类，例如2B端：B_END，2C端 ：C_END',
    TRUSTED              char(1) not null default 'N' comment '是否是受信任的产品端：Y|N，默认：N',
    SCOPES               varchar(64) not null comment '允许访问的服务资源范围，例如read, write, trust',
    ROLES                varchar(128) not null comment '产品端授权以访问服务资源，例如：ROLE_CLIENT,ROLE_TRUSTED_CLIENT',
    ENABLED              varchar(64) not null default 'N' comment '是否启用对外服务：Y|N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品端'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_1 on fw_client(CODE);
create unique index idx_fw_client_2 on fw_client(PRODUCT_ID, NAME);

drop table if exists fw_client_application;

/*==============================================================*/
/* Table: fw_client_application                                 */
/*==============================================================*/
create table fw_client_application
(
    ID                   bigint not null auto_increment comment '映射关系ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    APPLICATION_ID       bigint not null comment '应用ID',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品应用映射表，定义一个产品有哪些应用'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_application_1 on fw_client_application(CLIENT_ID, APPLICATION_ID, TENANT_ID);

drop table if exists fw_client_context;

/*==============================================================*/
/* Table: fw_client_context                                     */
/*==============================================================*/
create table fw_client_context
(
    ID                   bigint not null auto_increment comment '映射关系ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    CONTEXT_PATH         varchar(512) not null comment '使用场景类型路径',
    ENTRY_APP_CODE       varchar(64) not null comment '默认入口应用编码',
    ENTRY_NAV_ITEM       varchar(64) not null comment '默认入口导航项',
    ENTRY_LANGUAGE       char(5) not null comment '默认访问语言，如果为空，将使用租户设置的默认语言',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品端与使用场景关系表，产品端安装了哪些使用场景'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create index idx_fw_client_context_1 on fw_client_context(CLIENT_ID, CONTEXT_PATH);

drop table if exists fw_client_context_application;

/*==============================================================*/
/* Table: fw_client_context_application                         */
/*==============================================================*/
create table fw_client_context_application
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    CONTEXT_PATH         varchar(512) not null comment '使用场景路径，是实例时，属于扩展属性',
    APPLICATION_ID       bigint not null comment '应用ID',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品端中使用场景与应用关系表，某产品端的用场景安装了哪些应用'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_context_application_1 on fw_client_context_application(CLIENT_ID, CONTEXT_PATH,
                                                                                         APPLICATION_ID);

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

drop table if exists fw_client_service;

/*==============================================================*/
/* Table: fw_client_service                                     */
/*==============================================================*/
create table fw_client_service
(
    ID                   bigint not null auto_increment comment '映射关系ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    SERVICE_ID           bigint not null comment '服务ID',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品端与服务的关系表，一个端可以访问的服务'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_service_1 on fw_client_service(CLIENT_ID, SERVICE_ID, TENANT_ID);

drop table if exists fw_client_token;

/*==============================================================*/
/* Table: fw_client_token                                       */
/*==============================================================*/
create table fw_client_token
(
    ID                   bigint not null comment '映射关系ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    GRANT_TYPES          varchar(128) not null comment '授权类型列表，以逗号分隔，例如：authorization_code',
    AUTO_APPROVALS       varchar(256) comment '自动许可范围，*代表所有',
    WEB_REDIRECT_URI     varchar(256) comment '用户认证通过后重定向URI',
    ACCESS_TOKEN_VALIDITY int not null comment '访问令牌有效期限，单位秒，例如：43200, 12 小时',
    REFRESH_TOKEN_VALIDITY int not null comment '刷新令牌的有效期限，单位秒，例如：2592000，30 天',
    SESSION_POLICY       varchar(64) not null comment '用户Session创建策略：KICK_OFF_PREVIOUS',
    TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='客户端访问令牌设置'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_client_token on fw_client_token(CLIENT_ID, TENANT_ID);

drop table if exists fw_context_role;

/*==============================================================*/
/* Table: fw_context_role                                       */
/*==============================================================*/
create table fw_context_role
(
    ID                   bigint not null auto_increment comment '角色ID',
    NAME                 varchar(64) not null comment '角色名称',
    CODE                 varchar(64) not null comment '角色编码',
    CONTEXT_PATH         varchar(512) not null comment '角色所在的使用场景路径',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    ENABLED              char(1) not null comment '是否启用对外服务：Y|N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='使用场景定义的角色'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_role_1 on fw_context_role(TENANT_ID, CONTEXT_PATH, CODE);
create unique index idx_fw_context_role_2 on fw_context_role(TENANT_ID, CONTEXT_PATH, NAME);

drop table if exists fw_context_role_method;

/*==============================================================*/
/* Table: fw_context_role_method                                */
/*==============================================================*/
create table fw_context_role_method
(
    ID                   bigint not null auto_increment comment '关系映射Id',
    ROLE_ID              bigint not null comment '角色ID',
    METHOD_ID            bigint not null comment '服务方法ID',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='角色与后端服务方法授权关系表'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_role_method_1 on fw_context_role_method(ROLE_ID, METHOD_ID);

drop table if exists fw_context_role_resource;

/*==============================================================*/
/* Table: fw_context_role                                       */
/*==============================================================*/
create table fw_context_role_resource
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    ROLE_ID              bigint not null comment '角色ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    RESOURCE_ID          bigint not null comment '授权的资源ID',
    RESOURCE_TYPE        varchar(16) not null comment '授权的资源类型：PAGE|ACTION|NAVIGATION',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint comment '更新用户ID',
    UPDATED_AT           timestamp default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='角色与产品前端资源授权关系表'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_role_resource_1 on fw_context_role_resource(ROLE_ID, CLIENT_ID, RESOURCE_ID,
                                                                               RESOURCE_TYPE);
drop table if exists fw_context_type;

/*==============================================================*/
/* Table: fw_context_type                                       */
/*==============================================================*/
create table fw_context_type
(
    ID                   bigint not null auto_increment comment '类型值',
    CODE                 varchar(64) not null comment '类型编码',
    NAME                 varchar(64) not null comment '类型名称',
    PARENT_TYPE          bigint not null default 0 comment '父类型值',
    CONTEXT_PATH         varchar(512) not null comment '使用场景类型路径',
    CATEGORY             varchar(64) not null comment '使用场景类型分类，例如：用户，组织等',
    TENANT_ID            bigint not null default 0 comment '所属ID，如果ID值为0，为默认设置',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='使用场景类型'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_context_type_1 on fw_context_type(CONTEXT_PATH);
create unique index idx_fw_context_type_2 on fw_context_type(CODE, TENANT_ID);
create unique index idx_fw_context_type_3 on fw_context_type(NAME, TENANT_ID);

drop table if exists fw_page;

/*==============================================================*/
/* Table: fw_page                                               */
/*==============================================================*/
create table fw_page
(
    ID                   bigint not null auto_increment comment '页面ID',
    NAME                 varchar(64) not null comment '页面名称',
    CODE                 varchar(64) not null comment '页面编码',
    URI                  varchar(256) not null comment '页面访问URI',
    APPLICATION_ID       bigint not null comment '所属应用ID',
    CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化过的服务方法：Y|N，默认：N',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='UI交互页面'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_1 on fw_page(APPLICATION_ID, NAME);
create unique index idx_fw_page_2 on fw_page(APPLICATION_ID, CODE);

drop table if exists fw_page_ext;

/*==============================================================*/
/* Table: fw_page_ext                                           */
/*==============================================================*/
create table fw_page_ext
(
    ID                   bigint not null auto_increment comment '扩展ID',
    PAGE_ID              bigint not null comment '页面ID',
    APPLICATION_ID       bigint not null comment '页面所属应用ID',
    PRODUCT_ID           bigint not null default 0 comment '扩展属性：给特定产品的扩展，默认：0',
    CLIENT_ID            bigint not null default 0 comment '扩展属性：给特定产品端的扩展，默认：0',
    TENANT_ID            bigint not null default 0 comment '扩展属性：给特定租户的扩展，默认：0',
    CONTEXT_PATH         varchar(512) not null default 'void' NULL comment '扩展属性：给特定使用场景的扩展，void',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='UI交互扩展页面'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_ext_1 on fw_page_ext(PAGE_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);
create unique index idx_fw_page_ext_1 on fw_page_ext(APPLICATION_ID, PRODUCT_ID, CLIENT_ID, TENANT_ID, CONTEXT_PATH);


drop table if exists fw_page_method;

/*==============================================================*/
/* Table: fw_page_method                                    */
/*==============================================================*/
create table fw_page_method
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    APPLICATION_ID       bigint not null comment '页面所属应用ID',
    PAGE_ID              bigint not null comment '页面ID',
    SERVICE_ID           bigint not null comment '方法所属服务ID',
    METHOD_ID            bigint not null comment '服务方法ID',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='页面与服务方法关系映射表，加载页面需调用哪些服务方法'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_page_method_1 on fw_page_method(PAGE_ID, METHOD_ID);


drop table if exists fw_product;

/*==============================================================*/
/* Table: fw_product                                            */
/*==============================================================*/
create table fw_product
(
    ID                   bigint not null auto_increment comment '产品ID',
    NAME                 varchar(64) not null comment '产品名称',
    CODE                 varchar(64) not null comment '服务编码，必须唯一',
    DESCRIPTION          varchar(512) comment '产品描述',
    LANGUAGES            varchar(200) not null comment '产品支持的语言列表，以逗号隔开',
    VERSION              varchar(32) not null comment '产品版本号',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_product_1 on fw_product(NAME);
create unique index idx_fw_product_2 on fw_product(CODE);

drop table if exists fw_service;

/*==============================================================*/
/* Table: fw_service                                            */
/*==============================================================*/
create table fw_service
(
    ID                   bigint not null auto_increment comment '服务ID',
    NAME                 varchar(64) not null comment '服务名称',
    CODE                 varchar(64) not null comment '服务编码，必须唯一',
    TYPE                 varchar(16) not null comment '服务类型：GATEWAY, BUSINESS, INFRASTRUCTURE等',
    DESCRIPTION          varchar(526) comment '服务描述',
    VERSION              varchar(32) not null comment '服务版本，比如1.0',
    PROVIDER             varchar(64) not null comment '服务提供者，可以是个人，也可以是组织',
    ENABLED              char(1) default 'N' not null comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='服务'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_service_1 on fw_service(NAME);
create unique index idx_fw_service_2 on fw_service(CODE);

drop table if exists fw_service_method;

/*==============================================================*/
/* Table: fw_service_method                                     */
/*==============================================================*/
create table fw_service_method
(
    ID                   bigint not null auto_increment comment '服务方法ID',
    NAME                 varchar(256) not null comment '服务方法名称',
    METHOD               varchar(32) not null comment 'HTTP方法，例如： POST 、 GET、DELETE 等',
    URI                  varchar(256) not null comment '服务方法访问URI',
    SERVICE_ID           bigint not null comment '所属服务ID',
    ENABLED              char(1) not null default 'N' comment '是否启用对外服务：Y|N，默认：N',
    CUSTOMIZED           char(1) not null default 'N' comment '是否为定制化过的服务方法：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='服务方法'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_service_method_1 on fw_service_method(SERVICE_ID, NAME);

drop table if exists fw_service_method_ext;

/*==============================================================*/
/* Table: fw_service_method_ext                                 */
/*==============================================================*/
create table fw_service_method_ext
(
    ID                   bigint not null auto_increment comment '扩展ID',
    METHOD_ID            bigint not null comment '服务方法ID',
    SERVICE_ID           bigint not null comment '方法所属服务ID',
    APPLICATION_ID       bigint default 0 not null comment '扩展属性：给特定应用的扩展，默认：0',
    PRODUCT_ID           bigint default 0  not null comment '扩展属性：给特定产品的扩展，默认：0',
    CLIENT_ID            bigint default 0 not null comment '扩展属性：给特定产品端的扩展，默认：0',
    TENANT_ID            bigint default 0 not null comment '扩展属性：给特定租户的扩展，默认：0',
    CONTEXT_PATH         varchar(512) default 'void' not null comment '扩展属性：给特定使用场景的扩展，默认：void',
    ENABLED              char(1) default 'N' not null comment '是否启用对外服务：Y|N，默认：N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='服务扩展方法'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_service_method_ext_1 on fw_service_method_ext(METHOD_ID, APPLICATION_ID, PRODUCT_ID,
                                                                         CLIENT_ID, TENANT_ID, CONTEXT_PATH);
create index idx_fw_service_method_ext_2 on fw_service_method_ext(SERVICE_ID, APPLICATION_ID, PRODUCT_ID,
                                                                  CLIENT_ID, TENANT_ID, CONTEXT_PATH);
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

drop table if exists fw_tenant;

/*==============================================================*/
/* Table: fw_tenant                                             */
/*==============================================================*/
create table fw_tenant
(
    ID                   bigint not null auto_increment comment '租户ID',
    GUID                 varchar(64) not null comment '租户全局ID，用于前端展示',
    NAME                 varchar(64) not null comment '租户名称',
    CODE                 varchar(64) not null comment '租户编码',
    ENABLED              char(1) not null default 'N' comment '是否启用：Y|N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='租户'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_1 on fw_tenant(GUID);
create unique index idx_fw_tenant_2 on fw_tenant(NAME);
create unique index idx_fw_tenant_3 on fw_tenant(CODE);

drop table if exists fw_tenant_client;

/*==============================================================*/
/* Table: fw_tenant_client                                      */
/*==============================================================*/
create table fw_tenant_client
(
    ID                   bigint not null auto_increment comment '关系映射ID',
    TENANT_ID            bigint default NULL comment '租户ID',
    PRODUCT_ID           bigint not null comment '产品ID',
    CLIENT_ID            bigint not null comment '产品端ID',
    SECRET               varchar(64) not null comment '租户接入产品端的秘钥',
    HOSTS                varchar(512) not null comment '端访问域名列表，以逗号分隔',
    ENABLED              char(1) not null default 'N' comment '是否生效：Y|N',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint not null comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='租户与产品端关系表，产品端给租户的配置，比如访问域名等'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_client_1 on fw_tenant_client(TENANT_ID, CLIENT_ID);


drop table if exists fw_tenant_product;

/*==============================================================*/
/* Table: fw_tenant_product                                     */
/*==============================================================*/
create table fw_tenant_product
(
    ID                   bigint not null auto_increment comment '映射关系ID',
    TENANT_ID            bigint not null comment '租户ID',
    PRODUCT_ID           bigint not null comment '产品ID',
    START_DATE           date not null comment '租赁开始时间',
    END_DATE             date not null comment '租赁结束时间',
    DEFAULT_LANGUAGE     char(5) not null comment '默认使用产品的语言',
    ENABLED              char(1) not null default 'N' comment '租赁是否生效',
    CREATED_BY           bigint not null comment '创建用户ID',
    CREATED_AT           datetime not null comment '创建日期时间',
    UPDATED_BY           bigint comment '更新用户ID',
    UPDATED_AT           timestamp not null default current_timestamp on update current_timestamp comment '更新日期时间',
    primary key (ID)
)
    ENGINE=InnoDB
    DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
    COMMENT='产品租赁表，租户租用了哪些产品'
    AUTO_INCREMENT=1;

/**
 * Index list
 */
create unique index idx_fw_tenant_product_1 on fw_tenant_product(TENANT_ID, PRODUCT_ID);


/**
 * Index list
 */
create unique index idx_fw_tenant_product_1 on fw_tenant_product(TENANT_ID, PRODUCT_ID);


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fw_tenant_database
-- ----------------------------
DROP TABLE IF EXISTS `fw_tenant_database`;
CREATE TABLE `fw_tenant_database` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '租户数据源配置ID',
  `TENANT_ID` bigint(20) NOT NULL COMMENT '租户ID',
  `DB_NAME` varchar(64) NOT NULL COMMENT '数据库名称',
  `DB_URL` varchar(255) NOT NULL COMMENT '数据库连接地址',
  `USER_NAME` varchar(64) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(64) NOT NULL COMMENT '密码',
  `DRIVER_CLASS_NAME` varchar(128) NOT NULL COMMENT '数据库驱动',
  `DELETED` char(1) NOT NULL DEFAULT 'N' COMMENT '是否删除 : Y | N',
  `CREATED_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CREATED_AT` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(64) DEFAULT NULL COMMENT '更新人',
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='租户数据源配置表';

SET FOREIGN_KEY_CHECKS = 1;

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
create unique index idx_organization_member_1 on organization_member(ORG_ID, USER_ID);

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


