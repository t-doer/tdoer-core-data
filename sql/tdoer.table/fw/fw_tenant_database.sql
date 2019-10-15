
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
