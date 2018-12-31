-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: tc
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_history`
--

DROP TABLE IF EXISTS `action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_history` (
  `object_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `additional_data` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  KEY `action_history_comment` (`comment_id`),
  KEY `action_history_object` (`object_id`),
  KEY `action_history_action_object_i` (`action`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  `host_addr` varchar(80) COLLATE utf8_bin NOT NULL,
  `port` int(11) NOT NULL,
  `agent_type_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `authorized` int(11) DEFAULT NULL,
  `registered` int(11) DEFAULT NULL,
  `registration_timestamp` bigint(20) DEFAULT NULL,
  `last_binding_timestamp` bigint(20) DEFAULT NULL,
  `unregistered_reason` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authorization_token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `status_to_restore` int(11) DEFAULT NULL,
  `status_restoring_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_name_ui` (`name`),
  KEY `agent_host_address` (`host_addr`),
  KEY `agent_authorization_token` (`authorization_token`),
  KEY `agent_agent_type_id` (`agent_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'AGENT_13669','192.168.12.147',9090,1,1,0,1,1546271353944,1546271353973,NULL,'5a5d64e1657a4fbad5984499f10cc40f',NULL,NULL);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_pool`
--

DROP TABLE IF EXISTS `agent_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_pool` (
  `agent_pool_id` int(11) NOT NULL,
  `agent_pool_name` varchar(191) COLLATE utf8_bin DEFAULT NULL,
  `min_agents` int(11) DEFAULT NULL,
  `max_agents` int(11) DEFAULT NULL,
  `owner_project_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`agent_pool_id`),
  KEY `agent_pool_name_idx` (`agent_pool_name`),
  KEY `owner_project_idx` (`owner_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_pool`
--

LOCK TABLES `agent_pool` WRITE;
/*!40000 ALTER TABLE `agent_pool` DISABLE KEYS */;
INSERT INTO `agent_pool` VALUES (0,'Default',NULL,NULL,NULL);
/*!40000 ALTER TABLE `agent_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_pool_project`
--

DROP TABLE IF EXISTS `agent_pool_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_pool_project` (
  `agent_pool_id` int(11) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`agent_pool_id`,`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_pool_project`
--

LOCK TABLES `agent_pool_project` WRITE;
/*!40000 ALTER TABLE `agent_pool_project` DISABLE KEYS */;
INSERT INTO `agent_pool_project` VALUES (0,'_Root');
/*!40000 ALTER TABLE `agent_pool_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type`
--

DROP TABLE IF EXISTS `agent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type` (
  `agent_type_id` int(11) NOT NULL,
  `agent_pool_id` int(11) NOT NULL,
  `cloud_code` varchar(6) COLLATE utf8_bin NOT NULL,
  `profile_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `image_id` varchar(60) COLLATE utf8_bin NOT NULL,
  `policy` int(11) NOT NULL,
  PRIMARY KEY (`agent_type_id`),
  UNIQUE KEY `agent_type_ak` (`cloud_code`,`profile_id`,`image_id`),
  KEY `agent_type_pool_i` (`agent_pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type`
--

LOCK TABLES `agent_type` WRITE;
/*!40000 ALTER TABLE `agent_type` DISABLE KEYS */;
INSERT INTO `agent_type` VALUES (1,0,'A','A','real-1',1);
/*!40000 ALTER TABLE `agent_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type_bt_access`
--

DROP TABLE IF EXISTS `agent_type_bt_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type_bt_access` (
  `agent_type_id` int(11) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`agent_type_id`,`build_type_id`),
  KEY `agent_type_bt_access_bt_i` (`build_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type_bt_access`
--

LOCK TABLES `agent_type_bt_access` WRITE;
/*!40000 ALTER TABLE `agent_type_bt_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_type_bt_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type_info`
--

DROP TABLE IF EXISTS `agent_type_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type_info` (
  `agent_type_id` int(11) NOT NULL,
  `os_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `cpu_rank` int(11) DEFAULT NULL,
  `created_timestamp` datetime DEFAULT NULL,
  `modified_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`agent_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type_info`
--

LOCK TABLES `agent_type_info` WRITE;
/*!40000 ALTER TABLE `agent_type_info` DISABLE KEYS */;
INSERT INTO `agent_type_info` VALUES (1,'Linux, version 3.10.0',747,'2018-12-31 15:49:16','2018-12-31 15:49:16');
/*!40000 ALTER TABLE `agent_type_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type_param`
--

DROP TABLE IF EXISTS `agent_type_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type_param` (
  `agent_type_id` int(11) NOT NULL,
  `param_kind` char(1) COLLATE utf8_bin NOT NULL,
  `param_name` varchar(160) COLLATE utf8_bin NOT NULL,
  `param_value` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`agent_type_id`,`param_kind`,`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type_param`
--

LOCK TABLES `agent_type_param` WRITE;
/*!40000 ALTER TABLE `agent_type_param` DISABLE KEYS */;
INSERT INTO `agent_type_param` VALUES (1,'B','env.HOME','/'),(1,'B','env.JAVA_HOME','/usr/lib/jvm/java'),(1,'B','env.JDK_18','/usr/lib/jvm/java'),(1,'B','env.JDK_18_x64','/usr/lib/jvm/java'),(1,'B','env.JDK_HOME','/usr/lib/jvm/java'),(1,'B','env.JELASTIC_EXPOSE','0'),(1,'B','env.JRE_HOME','/usr/lib/jvm/java'),(1,'B','env.MASTER_HOST','node13669'),(1,'B','env.MASTER_ID','13669'),(1,'B','env.MASTER_IP','192.168.12.147'),(1,'B','env.OLDPWD','/opt/teamcity/bin'),(1,'B','env.PATH','/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin'),(1,'B','env.PWD','/opt/teamcity/bin'),(1,'B','env.SERVER_DOCKER_EXPOSED_PORT','8111'),(1,'B','env.SERVER_ENV_DOCKER_EXPOSED_PORT','8111'),(1,'B','env.SERVER_ENV_JRE_HOME','/usr/lib/jvm/oracle-jdk/jre'),(1,'B','env.SERVER_ENV_LANG','en_US.UTF-8'),(1,'B','env.SERVER_ENV_MASTER_HOST','node13670'),(1,'B','env.SERVER_ENV_MASTER_ID','13670'),(1,'B','env.SERVER_ENV_MASTER_IP','192.168.11.82'),(1,'B','env.SERVER_ENV_PATH','/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'),(1,'B','env.SERVER_ENV_TEAMCITY_DATA_PATH','/data/teamcity_server/datadir'),(1,'B','env.SERVER_ENV_TEAMCITY_DIST','/opt/teamcity'),(1,'B','env.SERVER_ENV_TEAMCITY_LOGS','/opt/teamcity/logs'),(1,'B','env.SERVER_HOST','192.168.11.82'),(1,'B','env.SERVER_JRE_HOME','/usr/lib/jvm/oracle-jdk/jre'),(1,'B','env.SERVER_LANG','en_US.UTF-8'),(1,'B','env.SERVER_MASTER_HOST','node13670'),(1,'B','env.SERVER_MASTER_ID','13670'),(1,'B','env.SERVER_MASTER_IP','192.168.11.82'),(1,'B','env.SERVER_PATH','/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'),(1,'B','env.SERVER_PORT','8111'),(1,'B','env.SERVER_PORT_8111_TCP','tcp://192.168.11.82:8111'),(1,'B','env.SERVER_PORT_8111_TCP_ADDR','192.168.11.82'),(1,'B','env.SERVER_PORT_8111_TCP_PORT','8111'),(1,'B','env.SERVER_PORT_8111_TCP_PROTO','tcp'),(1,'B','env.SERVER_TEAMCITY_DATA_PATH','/data/teamcity_server/datadir'),(1,'B','env.SERVER_TEAMCITY_DIST','/opt/teamcity'),(1,'B','env.SERVER_TEAMCITY_LOGS','/opt/teamcity/logs'),(1,'B','env.SHELL','/bin/bash'),(1,'B','env.SHLVL','5'),(1,'B','env.TEAMCITY_CAPTURE_ENV','\"/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/bin/java\" -jar \"/opt/teamcity/plugins/environment-fetcher/bin/env-fetcher.jar\"'),(1,'B','env.TEAMCITY_GIT_PATH','/usr/bin/git'),(1,'B','env.TERM','linux'),(1,'B','env._','/usr/bin/nohup'),(1,'B','system.agent.home.dir','/opt/teamcity'),(1,'B','system.agent.name','AGENT_13669'),(1,'B','system.agent.work.dir','/opt/teamcity/work'),(1,'B','system.teamcity.agent.cpuBenchmark','747'),(1,'B','system.teamcity.build.tempDir','/opt/teamcity/temp/buildTmp'),(1,'C','docker.version','18.09.0'),(1,'C','dockerCompose.version','1.21.2'),(1,'C','teamcity.agent.hardware.cpuCount','5'),(1,'C','teamcity.agent.hardware.memorySizeMb','10240'),(1,'C','teamcity.agent.home.dir','/opt/teamcity'),(1,'C','teamcity.agent.hostname','node13669-teamcity.madrid.central.jelastic.team'),(1,'C','teamcity.agent.jvm.file.encoding','ANSI_X3.4-1968'),(1,'C','teamcity.agent.jvm.file.separator','/'),(1,'C','teamcity.agent.jvm.java.home','/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre'),(1,'C','teamcity.agent.jvm.os.arch','amd64'),(1,'C','teamcity.agent.jvm.os.name','Linux'),(1,'C','teamcity.agent.jvm.os.version','3.10.0'),(1,'C','teamcity.agent.jvm.path.separator',':'),(1,'C','teamcity.agent.jvm.specification','1.8'),(1,'C','teamcity.agent.jvm.user.country','US'),(1,'C','teamcity.agent.jvm.user.home','/root'),(1,'C','teamcity.agent.jvm.user.language','en'),(1,'C','teamcity.agent.jvm.user.name','root'),(1,'C','teamcity.agent.jvm.user.timezone','UTC'),(1,'C','teamcity.agent.jvm.version','1.8.0_191'),(1,'C','teamcity.agent.launcher.version','58658'),(1,'C','teamcity.agent.name','AGENT_13669'),(1,'C','teamcity.agent.os.arch.bits','64'),(1,'C','teamcity.agent.ownPort','9090'),(1,'C','teamcity.agent.protocol','polling'),(1,'C','teamcity.agent.tools.dir','/opt/teamcity/tools'),(1,'C','teamcity.agent.work.dir','/opt/teamcity/work'),(1,'C','teamcity.agent.work.dir.freeSpaceMb','9218602'),(1,'C','teamcity.dotCover.home','/opt/teamcity/tools/JetBrains.dotCover.CommandLineTools.bundled'),(1,'C','teamcity.serverUrl','http://SERVER:8111'),(1,'C','teamcity.tool.JetBrains.dotCover.CommandLineTools.bundled','/opt/teamcity/tools/JetBrains.dotCover.CommandLineTools.bundled'),(1,'C','teamcity.tool.TeamCity.Dotnet.Integration.1.0.3','/opt/teamcity/plugins/dotnet.cli/tools/TeamCity.Dotnet.Integration.1.0.3'),(1,'C','teamcity.tool.TeamCity.Dotnet.Integration.BUNDLED','/opt/teamcity/plugins/dotnet.cli/tools/TeamCity.Dotnet.Integration.1.0.3'),(1,'C','teamcity.tool.TeamCity.Dotnet.Integration.DEFAULT','/opt/teamcity/plugins/dotnet.cli/tools/TeamCity.Dotnet.Integration.1.0.3'),(1,'C','teamcity.tool.ant-net-tasks','/opt/teamcity/tools/ant-net-tasks'),(1,'C','teamcity.tool.dotCover','/opt/teamcity/tools/JetBrains.dotCover.CommandLineTools.bundled'),(1,'C','teamcity.tool.gant','/opt/teamcity/tools/gant'),(1,'C','teamcity.tool.idea','/opt/teamcity/tools/idea'),(1,'C','teamcity.tool.idea-runner-runtime-libs','/opt/teamcity/plugins/idea-runner-runtime-libs'),(1,'C','teamcity.tool.jacoco.0.7.5','/opt/teamcity/tools/jacoco.0.7.5'),(1,'C','teamcity.tool.jacoco.0.8.2','/opt/teamcity/tools/jacoco.0.8.2'),(1,'C','teamcity.tool.jetbrains.resharper-clt.bundled','/opt/teamcity/tools/jetbrains.resharper-clt.bundled'),(1,'C','teamcity.tool.jps','/opt/teamcity/tools/jps'),(1,'C','teamcity.tool.maven','/opt/teamcity/tools/maven'),(1,'C','teamcity.tool.maven3','/opt/teamcity/tools/maven3'),(1,'C','teamcity.tool.maven3_1','/opt/teamcity/tools/maven3_1'),(1,'C','teamcity.tool.maven3_2','/opt/teamcity/tools/maven3_2'),(1,'C','teamcity.tool.maven3_3','/opt/teamcity/tools/maven3_3');
/*!40000 ALTER TABLE `agent_type_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type_runner`
--

DROP TABLE IF EXISTS `agent_type_runner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type_runner` (
  `agent_type_id` int(11) NOT NULL,
  `runner` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`agent_type_id`,`runner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type_runner`
--

LOCK TABLES `agent_type_runner` WRITE;
/*!40000 ALTER TABLE `agent_type_runner` DISABLE KEYS */;
INSERT INTO `agent_type_runner` VALUES (1,'Ant'),(1,'DockerCommand'),(1,'DockerCompose'),(1,'Duplicator'),(1,'Inspection'),(1,'JPS'),(1,'Maven2'),(1,'SBT'),(1,'buildServerResources'),(1,'cargo-deploy-runner'),(1,'dotnet.cli'),(1,'ftp-deploy-runner'),(1,'gradle-runner'),(1,'jetbrains_powershell'),(1,'rake-runner'),(1,'simpleRunner'),(1,'smb-deploy-runner'),(1,'ssh-deploy-runner'),(1,'ssh-exec-runner');
/*!40000 ALTER TABLE `agent_type_runner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_type_vcs`
--

DROP TABLE IF EXISTS `agent_type_vcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_type_vcs` (
  `agent_type_id` int(11) NOT NULL,
  `vcs` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`agent_type_id`,`vcs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_type_vcs`
--

LOCK TABLES `agent_type_vcs` WRITE;
/*!40000 ALTER TABLE `agent_type_vcs` DISABLE KEYS */;
INSERT INTO `agent_type_vcs` VALUES (1,'cvs'),(1,'jetbrains.git'),(1,'mercurial'),(1,'perforce'),(1,'svn'),(1,'tfs');
/*!40000 ALTER TABLE `agent_type_vcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_additional_object`
--

DROP TABLE IF EXISTS `audit_additional_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_additional_object` (
  `comment_id` bigint(20) DEFAULT NULL,
  `object_index` int(11) DEFAULT NULL,
  `object_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `object_name` text COLLATE utf8_bin,
  KEY `audit_a_o_comment` (`comment_id`),
  KEY `audit_a_o_object_index` (`object_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_additional_object`
--

LOCK TABLES `audit_additional_object` WRITE;
/*!40000 ALTER TABLE `audit_additional_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_additional_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_builds`
--

DROP TABLE IF EXISTS `backup_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_builds` (
  `build_id` bigint(20) NOT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_builds`
--

LOCK TABLES `backup_builds` WRITE;
/*!40000 ALTER TABLE `backup_builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_info`
--

DROP TABLE IF EXISTS `backup_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_info` (
  `mproc_id` int(11) NOT NULL,
  `file_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `started` datetime NOT NULL,
  `finished` datetime DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mproc_id`),
  KEY `backup_info_file_i` (`file_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_info`
--

LOCK TABLES `backup_info` WRITE;
/*!40000 ALTER TABLE `backup_info` DISABLE KEYS */;
INSERT INTO `backup_info` VALUES (1,'TeamCity_Before_Upgrade_20181231_154132.zip',7752221,'2018-12-31 15:41:32','2018-12-31 15:41:33','F');
/*!40000 ALTER TABLE `backup_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_artifact_dependency`
--

DROP TABLE IF EXISTS `build_artifact_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_artifact_dependency` (
  `artif_dep_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  `source_build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `revision_rule` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `src_paths` text COLLATE utf8_bin,
  KEY `build_artif_dep_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_artifact_dependency`
--

LOCK TABLES `build_artifact_dependency` WRITE;
/*!40000 ALTER TABLE `build_artifact_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_artifact_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_attrs`
--

DROP TABLE IF EXISTS `build_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_attrs` (
  `build_state_id` bigint(20) NOT NULL,
  `attr_name` varchar(70) COLLATE utf8_bin NOT NULL,
  `attr_value` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `attr_num_value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`build_state_id`,`attr_name`),
  KEY `build_attrs_num_i` (`attr_num_value`,`attr_name`,`build_state_id`),
  KEY `build_attrs_name_idx` (`attr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_attrs`
--

LOCK TABLES `build_attrs` WRITE;
/*!40000 ALTER TABLE `build_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_checkout_rules`
--

DROP TABLE IF EXISTS `build_checkout_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_checkout_rules` (
  `build_state_id` bigint(20) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `vcs_root_id` int(11) NOT NULL,
  `checkout_rules` text COLLATE utf8_bin,
  PRIMARY KEY (`build_state_id`,`build_type_id`,`vcs_root_id`),
  KEY `build_checkout_rules_vcs_r_i` (`vcs_root_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_checkout_rules`
--

LOCK TABLES `build_checkout_rules` WRITE;
/*!40000 ALTER TABLE `build_checkout_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_checkout_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_data_storage`
--

DROP TABLE IF EXISTS `build_data_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_data_storage` (
  `build_id` bigint(20) NOT NULL,
  `metric_id` bigint(20) NOT NULL,
  `metric_value` decimal(19,6) NOT NULL,
  PRIMARY KEY (`build_id`,`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_data_storage`
--

LOCK TABLES `build_data_storage` WRITE;
/*!40000 ALTER TABLE `build_data_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_data_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_dependency`
--

DROP TABLE IF EXISTS `build_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_dependency` (
  `build_state_id` bigint(20) NOT NULL,
  `depends_on` bigint(20) NOT NULL,
  `dependency_options` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_state_id`,`depends_on`),
  KEY `build_dependency_ak` (`depends_on`,`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_dependency`
--

LOCK TABLES `build_dependency` WRITE;
/*!40000 ALTER TABLE `build_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_labels`
--

DROP TABLE IF EXISTS `build_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_labels` (
  `build_id` bigint(20) NOT NULL,
  `vcs_root_id` int(11) NOT NULL,
  `label` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `error_message` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`build_id`,`vcs_root_id`),
  KEY `build_labels_vcs_root_i` (`vcs_root_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_labels`
--

LOCK TABLES `build_labels` WRITE;
/*!40000 ALTER TABLE `build_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_overriden_roots`
--

DROP TABLE IF EXISTS `build_overriden_roots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_overriden_roots` (
  `build_state_id` bigint(20) NOT NULL,
  `original_vcs_root_id` int(11) NOT NULL,
  `substitution_vcs_root_id` int(11) NOT NULL,
  PRIMARY KEY (`build_state_id`,`original_vcs_root_id`),
  KEY `build_subst_root_index` (`substitution_vcs_root_id`),
  KEY `build_orig_root_index` (`original_vcs_root_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_overriden_roots`
--

LOCK TABLES `build_overriden_roots` WRITE;
/*!40000 ALTER TABLE `build_overriden_roots` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_overriden_roots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_problem`
--

DROP TABLE IF EXISTS `build_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_problem` (
  `build_state_id` bigint(20) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `problem_description` text COLLATE utf8_bin,
  PRIMARY KEY (`build_state_id`,`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_problem`
--

LOCK TABLES `build_problem` WRITE;
/*!40000 ALTER TABLE `build_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_problem_attribute`
--

DROP TABLE IF EXISTS `build_problem_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_problem_attribute` (
  `build_state_id` bigint(20) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `attr_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `attr_value` varchar(2000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`build_state_id`,`problem_id`,`attr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_problem_attribute`
--

LOCK TABLES `build_problem_attribute` WRITE;
/*!40000 ALTER TABLE `build_problem_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_problem_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_problem_muted`
--

DROP TABLE IF EXISTS `build_problem_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_problem_muted` (
  `build_state_id` bigint(20) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `mute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_state_id`,`problem_id`),
  KEY `build_problem_mute_id` (`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_problem_muted`
--

LOCK TABLES `build_problem_muted` WRITE;
/*!40000 ALTER TABLE `build_problem_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_problem_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_project`
--

DROP TABLE IF EXISTS `build_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_project` (
  `build_id` bigint(20) NOT NULL,
  `project_level` int(11) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`build_id`,`project_level`),
  KEY `build_project_project_idx` (`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_project`
--

LOCK TABLES `build_project` WRITE;
/*!40000 ALTER TABLE `build_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_queue`
--

DROP TABLE IF EXISTS `build_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_queue` (
  `build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `agent_restrictor_type_id` int(11) DEFAULT NULL,
  `agent_restrictor_id` int(11) DEFAULT NULL,
  `requestor` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  KEY `build_queue_build_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_queue`
--

LOCK TABLES `build_queue` WRITE;
/*!40000 ALTER TABLE `build_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_revisions`
--

DROP TABLE IF EXISTS `build_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_revisions` (
  `build_state_id` bigint(20) NOT NULL,
  `vcs_root_id` int(11) NOT NULL,
  `vcs_revision` varchar(200) COLLATE utf8_bin NOT NULL,
  `vcs_revision_display_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `vcs_branch_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `modification_id` bigint(20) DEFAULT NULL,
  `vcs_root_type` int(11) DEFAULT NULL,
  `checkout_mode` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_state_id`,`vcs_root_id`),
  KEY `build_revisions_vcs_root_i` (`vcs_root_id`),
  KEY `build_revisions_mod_id_i` (`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_revisions`
--

LOCK TABLES `build_revisions` WRITE;
/*!40000 ALTER TABLE `build_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_set_tmp`
--

DROP TABLE IF EXISTS `build_set_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_set_tmp` (
  `build_id` bigint(20) NOT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_set_tmp`
--

LOCK TABLES `build_set_tmp` WRITE;
/*!40000 ALTER TABLE `build_set_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_set_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_state`
--

DROP TABLE IF EXISTS `build_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state` (
  `id` bigint(20) NOT NULL,
  `build_id` bigint(20) DEFAULT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `modification_id` bigint(20) DEFAULT NULL,
  `chain_modification_id` bigint(20) DEFAULT NULL,
  `personal_modification_id` bigint(20) DEFAULT NULL,
  `personal_user_id` bigint(20) DEFAULT NULL,
  `is_personal` tinyint(1) NOT NULL DEFAULT '0',
  `is_canceled` tinyint(1) NOT NULL DEFAULT '0',
  `is_changes_detached` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `branch_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `queued_time` bigint(20) DEFAULT NULL,
  `remove_from_queue_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `build_state_build_i` (`build_id`),
  KEY `build_state_mod_i` (`modification_id`),
  KEY `build_state_build_type_i` (`build_type_id`),
  KEY `build_state_puser_i` (`personal_user_id`),
  KEY `build_state_pmod_i` (`personal_modification_id`),
  KEY `build_state_rem_queue_time_i` (`remove_from_queue_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_state`
--

LOCK TABLES `build_state` WRITE;
/*!40000 ALTER TABLE `build_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_state_private_tag`
--

DROP TABLE IF EXISTS `build_state_private_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state_private_tag` (
  `build_state_id` bigint(20) NOT NULL,
  `owner` bigint(20) NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`build_state_id`,`owner`,`tag`),
  KEY `build_state_private_tag_ie1` (`owner`,`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_state_private_tag`
--

LOCK TABLES `build_state_private_tag` WRITE;
/*!40000 ALTER TABLE `build_state_private_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_state_private_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_state_tag`
--

DROP TABLE IF EXISTS `build_state_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_state_tag` (
  `build_state_id` bigint(20) NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`build_state_id`,`tag`),
  KEY `build_state_tag_ie1` (`tag`,`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_state_tag`
--

LOCK TABLES `build_state_tag` WRITE;
/*!40000 ALTER TABLE `build_state_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_state_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_type`
--

DROP TABLE IF EXISTS `build_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_type` (
  `int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `config_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `origin_project_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `delete_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `build_type_ak` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_type`
--

LOCK TABLES `build_type` WRITE;
/*!40000 ALTER TABLE `build_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_type_edge_relation`
--

DROP TABLE IF EXISTS `build_type_edge_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_type_edge_relation` (
  `child_modification_id` bigint(20) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `parent_num` int(11) NOT NULL,
  `change_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`child_modification_id`,`build_type_id`,`parent_num`),
  KEY `bt_edge_relation_btid` (`build_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_type_edge_relation`
--

LOCK TABLES `build_type_edge_relation` WRITE;
/*!40000 ALTER TABLE `build_type_edge_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_type_edge_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_type_mapping`
--

DROP TABLE IF EXISTS `build_type_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_type_mapping` (
  `int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `ext_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`int_id`,`ext_id`),
  UNIQUE KEY `build_type_mapping_ak` (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_type_mapping`
--

LOCK TABLES `build_type_mapping` WRITE;
/*!40000 ALTER TABLE `build_type_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_type_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_type_vcs_change`
--

DROP TABLE IF EXISTS `build_type_vcs_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_type_vcs_change` (
  `modification_id` bigint(20) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `change_type` int(11) DEFAULT NULL,
  UNIQUE KEY `build_type_vcs_change_ui` (`modification_id`,`build_type_id`),
  KEY `build_type_vcs_change_btid` (`build_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_type_vcs_change`
--

LOCK TABLES `build_type_vcs_change` WRITE;
/*!40000 ALTER TABLE `build_type_vcs_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_type_vcs_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canceled_info`
--

DROP TABLE IF EXISTS `canceled_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canceled_info` (
  `build_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canceled_info`
--

LOCK TABLES `canceled_info` WRITE;
/*!40000 ALTER TABLE `canceled_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `canceled_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clean_checkout_enforcement`
--

DROP TABLE IF EXISTS `clean_checkout_enforcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clean_checkout_enforcement` (
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `agent_id` int(11) NOT NULL,
  `current_build_id` bigint(20) NOT NULL,
  `request_time` datetime NOT NULL,
  PRIMARY KEY (`build_type_id`,`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clean_checkout_enforcement`
--

LOCK TABLES `clean_checkout_enforcement` WRITE;
/*!40000 ALTER TABLE `clean_checkout_enforcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `clean_checkout_enforcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleanup_history`
--

DROP TABLE IF EXISTS `cleanup_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cleanup_history` (
  `proc_id` bigint(20) NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `finish_time` bigint(20) DEFAULT NULL,
  `interrupt_reason` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`proc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleanup_history`
--

LOCK TABLES `cleanup_history` WRITE;
/*!40000 ALTER TABLE `cleanup_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleanup_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_image_without_agent`
--

DROP TABLE IF EXISTS `cloud_image_without_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_image_without_agent` (
  `profile_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `cloud_code` varchar(6) COLLATE utf8_bin NOT NULL,
  `image_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`profile_id`,`cloud_code`,`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_image_without_agent`
--

LOCK TABLES `cloud_image_without_agent` WRITE;
/*!40000 ALTER TABLE `cloud_image_without_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_image_without_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_started_instance`
--

DROP TABLE IF EXISTS `cloud_started_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_started_instance` (
  `profile_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `cloud_code` varchar(6) COLLATE utf8_bin NOT NULL,
  `image_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `instance_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`profile_id`,`cloud_code`,`image_id`,`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_started_instance`
--

LOCK TABLES `cloud_started_instance` WRITE;
/*!40000 ALTER TABLE `cloud_started_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_started_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `when_changed` bigint(20) NOT NULL,
  `commentary` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `comments_when_changed_i` (`when_changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compiler_output`
--

DROP TABLE IF EXISTS `compiler_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compiler_output` (
  `build_id` bigint(20) DEFAULT NULL,
  `message_order` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_bin,
  KEY `co_build_id_index` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compiler_output`
--

LOCK TABLES `compiler_output` WRITE;
/*!40000 ALTER TABLE `compiler_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `compiler_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_storage_dict`
--

DROP TABLE IF EXISTS `data_storage_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_storage_dict` (
  `metric_id` bigint(20) NOT NULL,
  `value_type_key` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`metric_id`),
  UNIQUE KEY `value_type_key_index` (`value_type_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_storage_dict`
--

LOCK TABLES `data_storage_dict` WRITE;
/*!40000 ALTER TABLE `data_storage_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_storage_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_heartbeat`
--

DROP TABLE IF EXISTS `db_heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_heartbeat` (
  `node_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `starting_code` bigint(20) NOT NULL,
  `starting_time` datetime NOT NULL,
  `lock_mode` char(1) COLLATE utf8_bin NOT NULL,
  `ip_address` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `additional_info` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `last_time` datetime NOT NULL,
  `update_interval` bigint(20) DEFAULT NULL,
  `uuid` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `app_type` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `access_token` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_number` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `display_version` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`starting_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_heartbeat`
--

LOCK TABLES `db_heartbeat` WRITE;
/*!40000 ALTER TABLE `db_heartbeat` DISABLE KEYS */;
INSERT INTO `db_heartbeat` VALUES ('MAIN_SERVER',886181945,'2018-12-31 15:35:54','W','192.168.11.82','IP: 192.168.11.82, Port: 8111, Installation Directory: /opt/teamcity, Data Directory: /data/teamcity_server/datadir','2018-12-31 15:53:47',60000,'d64a4688-9e3b-472c-859d-6137660d1aa4','main_server','http://ttttt.stg.jelastic.com','1923135553377175409','58658','2018.1.3');
/*!40000 ALTER TABLE `db_heartbeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version_number` int(11) NOT NULL,
  `version_time` datetime NOT NULL,
  PRIMARY KEY (`version_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES (829,'2018-04-20 13:26:10'),(830,'2018-12-31 15:41:34'),(831,'2018-12-31 15:41:34'),(832,'2018-12-31 15:41:34'),(833,'2018-12-31 15:41:34'),(834,'2018-12-31 15:41:34'),(835,'2018-12-31 15:41:34'),(836,'2018-12-31 15:41:34'),(837,'2018-12-31 15:41:34'),(838,'2018-12-31 15:41:34'),(839,'2018-12-31 15:41:34'),(840,'2018-12-31 15:41:34'),(841,'2018-12-31 15:41:34'),(842,'2018-12-31 15:41:34'),(843,'2018-12-31 15:41:34'),(844,'2018-12-31 15:41:34'),(845,'2018-12-31 15:41:34'),(846,'2018-12-31 15:41:34'),(847,'2018-12-31 15:41:34'),(848,'2018-12-31 15:41:34'),(849,'2018-12-31 15:41:34'),(850,'2018-12-31 15:41:34'),(851,'2018-12-31 15:41:34'),(852,'2018-12-31 15:41:34'),(853,'2018-12-31 15:41:34'),(854,'2018-12-31 15:41:34'),(855,'2018-12-31 15:41:34'),(856,'2018-12-31 15:41:34');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_build_parameters`
--

DROP TABLE IF EXISTS `default_build_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_build_parameters` (
  `build_state_id` bigint(20) DEFAULT NULL,
  `param_name` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `param_value` text COLLATE utf8_bin,
  KEY `def_build_params_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_build_parameters`
--

LOCK TABLES `default_build_parameters` WRITE;
/*!40000 ALTER TABLE `default_build_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_build_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_build_types`
--

DROP TABLE IF EXISTS `deleted_build_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_build_types` (
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `delete_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`build_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_build_types`
--

LOCK TABLES `deleted_build_types` WRITE;
/*!40000 ALTER TABLE `deleted_build_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_build_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloaded_artifacts`
--

DROP TABLE IF EXISTS `downloaded_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloaded_artifacts` (
  `target_build_id` bigint(20) DEFAULT NULL,
  `source_build_id` bigint(20) DEFAULT NULL,
  `download_timestamp` bigint(20) DEFAULT NULL,
  `artifact_path` text COLLATE utf8_bin,
  KEY `downloaded_artifacts_source_id` (`source_build_id`),
  KEY `downloaded_artifacts_ts_id` (`target_build_id`,`source_build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloaded_artifacts`
--

LOCK TABLES `downloaded_artifacts` WRITE;
/*!40000 ALTER TABLE `downloaded_artifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloaded_artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicate_diff`
--

DROP TABLE IF EXISTS `duplicate_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicate_diff` (
  `build_id` bigint(20) NOT NULL,
  `hash` bigint(20) NOT NULL,
  PRIMARY KEY (`build_id`,`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_diff`
--

LOCK TABLES `duplicate_diff` WRITE;
/*!40000 ALTER TABLE `duplicate_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicate_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicate_fragments`
--

DROP TABLE IF EXISTS `duplicate_fragments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicate_fragments` (
  `id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `line` int(11) NOT NULL,
  `offset_info` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`,`file_id`,`line`,`offset_info`),
  KEY `duplicate_fragments_file_i` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_fragments`
--

LOCK TABLES `duplicate_fragments` WRITE;
/*!40000 ALTER TABLE `duplicate_fragments` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicate_fragments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicate_results`
--

DROP TABLE IF EXISTS `duplicate_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicate_results` (
  `id` bigint(20) NOT NULL,
  `build_id` bigint(20) NOT NULL,
  `hash` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `duplicate_results_build_i` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_results`
--

LOCK TABLES `duplicate_results` WRITE;
/*!40000 ALTER TABLE `duplicate_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicate_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicate_stats`
--

DROP TABLE IF EXISTS `duplicate_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duplicate_stats` (
  `build_id` bigint(20) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `new_total` int(11) DEFAULT NULL,
  `old_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_stats`
--

LOCK TABLES `duplicate_stats` WRITE;
/*!40000 ALTER TABLE `duplicate_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicate_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_tests_output`
--

DROP TABLE IF EXISTS `failed_tests_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_tests_output` (
  `build_id` bigint(20) NOT NULL,
  `test_id` int(11) NOT NULL,
  `problem_description` text COLLATE utf8_bin,
  `std_output` text COLLATE utf8_bin,
  `error_output` text COLLATE utf8_bin,
  `stacktrace` text COLLATE utf8_bin,
  `expected` text COLLATE utf8_bin,
  `actual` text COLLATE utf8_bin,
  PRIMARY KEY (`build_id`,`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_tests_output`
--

LOCK TABLES `failed_tests_output` WRITE;
/*!40000 ALTER TABLE `failed_tests_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_tests_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_artifact_dependency`
--

DROP TABLE IF EXISTS `final_artifact_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_artifact_dependency` (
  `artif_dep_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  `source_build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `revision_rule` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `src_paths` text COLLATE utf8_bin,
  KEY `final_artif_dep_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_artifact_dependency`
--

LOCK TABLES `final_artifact_dependency` WRITE;
/*!40000 ALTER TABLE `final_artifact_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_artifact_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidden_health_item`
--

DROP TABLE IF EXISTS `hidden_health_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hidden_health_item` (
  `item_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  KEY `health_item_id_ie` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidden_health_item`
--

LOCK TABLES `hidden_health_item` WRITE;
/*!40000 ALTER TABLE `hidden_health_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `hidden_health_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `build_id` bigint(20) NOT NULL,
  `agent_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_start_time_server` bigint(20) DEFAULT NULL,
  `build_start_time_agent` bigint(20) DEFAULT NULL,
  `build_finish_time_server` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_text` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_status_text` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `is_personal` int(11) DEFAULT NULL,
  `is_canceled` int(11) DEFAULT NULL,
  `build_number` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `requestor` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  `agent_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_id`),
  KEY `start_time_index` (`build_start_time_server`),
  KEY `build_type_id_index` (`build_type_id`),
  KEY `pinned_index` (`pin`),
  KEY `status_index` (`status`),
  KEY `history_state_id` (`build_state_id`),
  KEY `history_agname_bfintimesrv_i` (`agent_name`,`build_finish_time_server`),
  KEY `history_finish_time_i` (`build_finish_time_server`),
  KEY `history_build_number` (`build_number`(255)),
  KEY `history_agt_b_i` (`agent_type_id`,`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ignored_tests`
--

DROP TABLE IF EXISTS `ignored_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ignored_tests` (
  `build_id` bigint(20) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `ignore_reason` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  KEY `ignored_tests_build_id` (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ignored_tests`
--

LOCK TABLES `ignored_tests` WRITE;
/*!40000 ALTER TABLE `ignored_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ignored_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_data`
--

DROP TABLE IF EXISTS `inspection_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_data` (
  `hash` bigint(20) NOT NULL,
  `result` text COLLATE utf8_bin,
  `severity` int(11) DEFAULT NULL,
  `type_pattern` int(11) DEFAULT NULL,
  `fqname` text COLLATE utf8_bin,
  `file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_fqnames` text COLLATE utf8_bin,
  `parent_type_patterns` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `module_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `inspection_id` bigint(20) DEFAULT NULL,
  `is_local` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`hash`),
  KEY `inspection_data_file_index` (`file_name`),
  KEY `inspection_data_insp_index` (`inspection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_data`
--

LOCK TABLES `inspection_data` WRITE;
/*!40000 ALTER TABLE `inspection_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_diff`
--

DROP TABLE IF EXISTS `inspection_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_diff` (
  `build_id` bigint(20) NOT NULL,
  `hash` bigint(20) NOT NULL,
  UNIQUE KEY `inspection_diff_ak` (`build_id`,`hash`),
  KEY `inspection_diff_hash_index` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_diff`
--

LOCK TABLES `inspection_diff` WRITE;
/*!40000 ALTER TABLE `inspection_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_fixes`
--

DROP TABLE IF EXISTS `inspection_fixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_fixes` (
  `hash` bigint(20) NOT NULL,
  `hint` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `inspection_fixes_hash_index` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_fixes`
--

LOCK TABLES `inspection_fixes` WRITE;
/*!40000 ALTER TABLE `inspection_fixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_fixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_info`
--

DROP TABLE IF EXISTS `inspection_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_info` (
  `id` bigint(20) NOT NULL,
  `inspection_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `inspection_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `inspection_desc` text COLLATE utf8_bin,
  `group_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inspection_info_ak` (`inspection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_info`
--

LOCK TABLES `inspection_info` WRITE;
/*!40000 ALTER TABLE `inspection_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_results`
--

DROP TABLE IF EXISTS `inspection_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_results` (
  `build_id` bigint(20) NOT NULL,
  `hash` bigint(20) NOT NULL,
  `line` int(11) NOT NULL,
  KEY `inspection_results_hash_index` (`hash`),
  KEY `inspection_results_buildhash_i` (`build_id`,`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_results`
--

LOCK TABLES `inspection_results` WRITE;
/*!40000 ALTER TABLE `inspection_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection_stats`
--

DROP TABLE IF EXISTS `inspection_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection_stats` (
  `build_id` bigint(20) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `new_total` int(11) DEFAULT NULL,
  `old_total` int(11) DEFAULT NULL,
  `errors` int(11) DEFAULT NULL,
  `new_errors` int(11) DEFAULT NULL,
  `old_errors` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_stats`
--

LOCK TABLES `inspection_stats` WRITE;
/*!40000 ALTER TABLE `inspection_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light_history`
--

DROP TABLE IF EXISTS `light_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `light_history` (
  `build_id` bigint(20) NOT NULL,
  `agent_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_start_time_server` bigint(20) DEFAULT NULL,
  `build_start_time_agent` bigint(20) DEFAULT NULL,
  `build_finish_time_server` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_text` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_status_text` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `is_personal` int(11) DEFAULT NULL,
  `is_canceled` int(11) DEFAULT NULL,
  `build_number` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `requestor` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `queued_time` bigint(20) DEFAULT NULL,
  `remove_from_queue_time` bigint(20) DEFAULT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  `agent_type_id` int(11) DEFAULT NULL,
  `branch_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`build_id`),
  KEY `start_time_index_light` (`build_start_time_server`),
  KEY `build_type_id_index_light` (`build_type_id`),
  KEY `pinned_index_light` (`pin`),
  KEY `status_index_light` (`status`),
  KEY `light_history_agname_bftime_i` (`agent_name`,`build_finish_time_server`),
  KEY `light_history_finish_time_i` (`build_finish_time_server`),
  KEY `light_history_agt_b_i` (`agent_type_id`,`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light_history`
--

LOCK TABLES `light_history` WRITE;
/*!40000 ALTER TABLE `light_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `light_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `long_file_name`
--

DROP TABLE IF EXISTS `long_file_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `long_file_name` (
  `hash` varchar(40) COLLATE utf8_bin NOT NULL,
  `file_name` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `long_file_name`
--

LOCK TABLES `long_file_name` WRITE;
/*!40000 ALTER TABLE `long_file_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `long_file_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_file_line`
--

DROP TABLE IF EXISTS `meta_file_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_file_line` (
  `file_name` varchar(15) COLLATE utf8_bin NOT NULL,
  `line_nr` int(11) NOT NULL,
  `line_text` varchar(160) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`file_name`,`line_nr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_file_line`
--

LOCK TABLES `meta_file_line` WRITE;
/*!40000 ALTER TABLE `meta_file_line` DISABLE KEYS */;
INSERT INTO `meta_file_line` VALUES ('backup.config',1,'-- INTERNAL BACKUP CONFIGURATION'),('backup.config',2,''),('backup.config',3,''),('backup.config',4,'TABLES-NOT-TO-BACKUP'),('backup.config',5,''),('backup.config',6,'  db_heartbeat'),('backup.config',7,'  build_set_tmp'),('backup.config',8,'  backup_builds'),('backup.config',9,'  node_events'),('backup.config',10,''),('backup.config',11,''),('backup.config',12,'TABLES-TO-FILTER-BY-BUILDS'),('backup.config',13,''),('backup.config',14,'  build_data_storage'),('backup.config',15,'  build_labels'),('backup.config',16,'  compiler_output'),('backup.config',17,'  failed_tests_output'),('backup.config',18,'  ignored_tests'),('backup.config',19,'  personal_build_relative_path'),('backup.config',20,'  stats'),('backup.config',21,'  test_info'),('backup.config',22,'  inspection_results'),('backup.config',23,'  inspection_stats'),('backup.config',24,'  inspection_diff'),('backup.config',25,'  duplicate_results'),('backup.config',26,'  duplicate_diff'),('backup.config',27,'  duplicate_stats'),('backup.config',28,'  running'),('backup.config',29,'  history'),('backup.config',30,'  light_history'),('backup.config',31,''),('backup.config',32,''),('backup.config',33,''),('backup.config',34,''),('backup.config',35,''),('backup.config',36,''),('schema.config',1,'-- TEAMCITY DATABASE SCHEMA'),('schema.config',2,''),('schema.config',3,''),('schema.config',4,'-- Each table describes as a table name started from the first position of the line,'),('schema.config',5,'-- and followed by its inner constructions with offset. All inner constructions'),('schema.config',6,'-- should be written with the same offset.'),('schema.config',7,''),('schema.config',8,''),('schema.config',9,''),('schema.config',10,'--                              ABBREVIATIONS'),('schema.config',11,'--                              -------------'),('schema.config',12,'--                              M:  mandatory (not null)'),('schema.config',13,'--                              PK: primary key'),('schema.config',14,'--                              AK: alternative key (unique index)'),('schema.config',15,'--                              IE: inversion entry (non-unique index)'),('schema.config',16,''),('schema.config',17,''),('schema.config',18,'--                              DATA TYPES'),('schema.config',19,'--                              ----------'),('schema.config',20,'--                              int             : 4-bytes signed integer'),('schema.config',21,'--                              long_int        : 8-bytes signed integer'),('schema.config',22,'--                              decimal(p,s)    : decimal number, p for precision, s for scale'),('schema.config',23,'--                              char            : one character'),('schema.config',24,'--                              str(n)          : string of length n, n is limited to 2000'),('schema.config',25,'--                              long_str(n)     : long text of length n (CLOB)'),('schema.config',26,'--                              uni_str(n)      : unicode string of length n, n is limited to 1000'),('schema.config',27,'--                              long_uni_str(n) : long unicode text of length n (NCLOB)'),('schema.config',28,'--                              timestamp       : date and time with 1 second precision, without time zone'),('schema.config',29,'--                              boolean         : boolean'),('schema.config',30,''),('schema.config',31,''),('schema.config',32,'--                              FIELD OPTIONS'),('schema.config',33,'--                              -------------'),('schema.config',34,'--                              default <value> : specifies default value'),('schema.config',35,'--                              defines         : defines value of it\'s domain'),('schema.config',36,'--                              refers          : references to domain values defines in other tables'),('schema.config',37,'--                              serial          : means that this field gets it values from a sequence'),('schema.config',38,''),('schema.config',39,''),('schema.config',40,'-- Notes:'),('schema.config',41,'-- 1. The first table should be the \'db_version\', the last table should be the \'server\'.'),('schema.config',42,'-- 2. Tables are grouped by categories. Please put new one into a proper category.'),('schema.config',43,'-- 3. All names should be written in lower case; national characters are not allowed.'),('schema.config',44,'-- 4. Names of temporary tables are suffixed with \'$\'.'),('schema.config',45,'-- 5. Ensure that there are no tab characters at beginning of lines.'),('schema.config',46,'-- 6. Unicode string and text types are used since 9.0.'),('schema.config',47,'-- 7. BLOBs (strings more than 4000 or unicode strings more than 2000) must be the last fields.'),('schema.config',48,'-- 8. In this file allows at most 160 character per line.'),('schema.config',49,''),('schema.config',50,''),('schema.config',51,''),('schema.config',52,'-- DOMAINS'),('schema.config',53,''),('schema.config',54,'config_id:                 domain of str(80)'),('schema.config',55,'group_id:                  domain of str(16)'),('schema.config',56,'teamcity_username:         domain of str(60)'),('schema.config',57,'user_id:                   domain of long_int'),('schema.config',58,'user_role_id:              domain of str(80)'),('schema.config',59,'user_notific_rule_id:      domain of long_int'),('schema.config',60,'group_notific_rule_id:     domain of long_int'),('schema.config',61,'subject_property_key:      domain of str(80)'),('schema.config',62,'agent_pool_id:             domain of int'),('schema.config',63,'agent_id:                  domain of int'),('schema.config',64,'agent_type_id:             domain of int'),('schema.config',65,'project_ext_id:            domain of str(80)'),('schema.config',66,'bt_ext_id:                 domain of str(80)'),('schema.config',67,'vcs_root_ext_id:           domain of str(80)'),('schema.config',68,'project_int_id:            domain of str(80)'),('schema.config',69,'bt_int_id:                 domain of str(80)  -- for both build_type and build_template'),('schema.config',70,'vcs_root_int_id:           domain of int'),('schema.config',71,'vcs_root_instance_id:      domain of int'),('schema.config',72,'vcs_revision:              domain of str(200)'),('schema.config',73,'modification_hash:         domain of str(40)'),('schema.config',74,'modification_id:           domain of long_int'),('schema.config',75,'personal_modification_id:  domain of long_int'),('schema.config',76,'promotion_id:              domain of long_int'),('schema.config',77,'build_id:                  domain of long_int'),('schema.config',78,'test_name_hash:            domain of long_int'),('schema.config',79,'problem_id:                domain of int'),('schema.config',80,'problem_type:              domain of str(80)'),('schema.config',81,'problem_identity:          domain of str(60)'),('schema.config',82,'mute_id:                   domain of int'),('schema.config',83,'file_name_hash:            domain of str(40)'),('schema.config',84,'tag_phrase:                domain of uni_str(255)'),('schema.config',85,'metric_hash:               domain of long_int'),('schema.config',86,'server_health_item_id:     domain of long_int'),('schema.config',87,'audit_comment_id:          domain of long_int'),('schema.config',88,'cleanup_proc_id:           domain of long_int'),('schema.config',89,'inspection_id_hash:        domain of long_int'),('schema.config',90,'inspection_id_str:         domain of str(255)'),('schema.config',91,'inspection_data_hash:      domain of long_int'),('schema.config',92,'duplicate_file_id:         domain of long_int'),('schema.config',93,'duplicate_file_name:       domain of str(255)'),('schema.config',94,'duplicate_result_id:       domain of long_int'),('schema.config',95,'duplicate_result_hash:     domain of int'),('schema.config',96,'dependency_id:             domain of str(40)'),('schema.config',97,''),('schema.config',98,''),('schema.config',99,''),('schema.config',100,''),('schema.config',101,''),('schema.config',102,''),('schema.config',103,'-- TABLES THAT CONTAIN PREDEFINED IMMUTABLE DATA'),('schema.config',104,''),('schema.config',105,'db_version:                     table'),('schema.config',106,''),('schema.config',107,'  version_number:               int M'),('schema.config',108,'  version_time:                 timestamp M'),('schema.config',109,''),('schema.config',110,'  db_version_pk:                PK (version_number)'),('schema.config',111,''),('schema.config',112,''),('schema.config',113,'meta_file_line:                 table'),('schema.config',114,''),('schema.config',115,'  file_name:                    str(15)  M  -- metadata file name with suffix'),('schema.config',116,'  line_nr:                      int      M  -- line number, started with 1'),('schema.config',117,'  line_text:                    str(160)    -- text of line'),('schema.config',118,''),('schema.config',119,'  meta_file_line_pk:            PK (file_name, line_nr)'),('schema.config',120,''),('schema.config',121,''),('schema.config',122,'single_row:                     table'),('schema.config',123,''),('schema.config',124,'  dummy_field:                  char'),('schema.config',125,''),('schema.config',126,''),('schema.config',127,'server_property:                table'),('schema.config',128,''),('schema.config',129,'  prop_name:                    str(80) M'),('schema.config',130,'  prop_value:                   str(256) M'),('schema.config',131,''),('schema.config',132,'  server_property_pk:           PK (prop_name)'),('schema.config',133,''),('schema.config',134,''),('schema.config',135,''),('schema.config',136,''),('schema.config',137,'-- GLOBAL TABLES (NOT RELATED TO PROJECTS OR USERS OR AGENTS)'),('schema.config',138,''),('schema.config',139,''),('schema.config',140,'db_heartbeat:                   table'),('schema.config',141,''),('schema.config',142,'  node_id:                      str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',143,'  starting_code:                long_int M'),('schema.config',144,'  starting_time:                timestamp M'),('schema.config',145,'  lock_mode:                    char M'),('schema.config',146,'  ip_address:                   str(80)'),('schema.config',147,'  additional_info:              str(2000)'),('schema.config',148,'  last_time:                    timestamp M'),('schema.config',149,'  update_interval:              long_int      -- non mandatory for backward compatibility with previous versions'),('schema.config',150,'  uuid:                         str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',151,'  app_type:                     str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',152,'  url:                          str(128)      -- non mandatory for backward compatibility with previous versions'),('schema.config',153,'  access_token:                 str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',154,'  build_number:                 str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',155,'  display_version:              str(80)       -- non mandatory for backward compatibility with previous versions'),('schema.config',156,''),('schema.config',157,'  db_heartbeat_pk:              PK (starting_code)'),('schema.config',158,''),('schema.config',159,''),('schema.config',160,'backup_info:                    table'),('schema.config',161,''),('schema.config',162,'  mproc_id:                     int M'),('schema.config',163,'  file_name:                    str(1000)'),('schema.config',164,'  file_size:                    long_int'),('schema.config',165,'  started:                      timestamp M'),('schema.config',166,'  finished:                     timestamp'),('schema.config',167,'  status:                       char'),('schema.config',168,''),('schema.config',169,'  backup_info_pk:               PK (mproc_id)'),('schema.config',170,''),('schema.config',171,'  backup_info_file_i:           IE (file_name)'),('schema.config',172,''),('schema.config',173,''),('schema.config',174,'backup_builds:                  table'),('schema.config',175,''),('schema.config',176,'  build_id:                     build_id M'),('schema.config',177,''),('schema.config',178,'  backup_builds_pk:             PK (build_id)'),('schema.config',179,''),('schema.config',180,''),('schema.config',181,'cleanup_history:                table'),('schema.config',182,''),('schema.config',183,'  proc_id:                      cleanup_proc_id M serial defines'),('schema.config',184,'  start_time:                   long_int M'),('schema.config',185,'  finish_time:                  long_int'),('schema.config',186,'  interrupt_reason:             str(20)'),('schema.config',187,''),('schema.config',188,'  cleanup_history_pk:           PK (proc_id)'),('schema.config',189,''),('schema.config',190,''),('schema.config',191,'-- AGENT RELATED TABLES'),('schema.config',192,''),('schema.config',193,'-- PROJECTS AND BUILD HISTORY TABLES'),('schema.config',194,''),('schema.config',195,''),('schema.config',196,'project:                        dictionary table'),('schema.config',197,''),('schema.config',198,'  int_id:                       project_int_id   M  serial   defines'),('schema.config',199,'  config_id:                    config_id        M           defines'),('schema.config',200,'  origin_project_id:            project_int_id'),('schema.config',201,'  delete_time:                  long_int'),('schema.config',202,''),('schema.config',203,'  project_pk:                   PK (int_id)'),('schema.config',204,'  project_ak:                   AK (config_id)               stable'),('schema.config',205,''),('schema.config',206,''),('schema.config',207,'build_type:                     dictionary table'),('schema.config',208,''),('schema.config',209,'  int_id:                       bt_int_id        M  serial   defines'),('schema.config',210,'  config_id:                    config_id        M           defines'),('schema.config',211,'  origin_project_id:            project_int_id'),('schema.config',212,'  delete_time:                  long_int'),('schema.config',213,''),('schema.config',214,'  build_type_pk:                PK (int_id)'),('schema.config',215,'  build_type_ak:                AK (config_id)               stable'),('schema.config',216,''),('schema.config',217,''),('schema.config',218,'vcs_root:                       dictionary table'),('schema.config',219,''),('schema.config',220,'  int_id:                       vcs_root_int_id  M  serial   defines'),('schema.config',221,'  config_id:                    config_id        M           defines'),('schema.config',222,'  origin_project_id:            project_int_id'),('schema.config',223,'  delete_time:                  long_int'),('schema.config',224,''),('schema.config',225,'  vcs_root_pk:                  PK (int_id)'),('schema.config',226,'  vcs_root_ak:                  AK (config_id)               stable'),('schema.config',227,''),('schema.config',228,''),('schema.config',229,'project_mapping:                table'),('schema.config',230,''),('schema.config',231,'  int_id:                       project_int_id M       refers'),('schema.config',232,'  ext_id:                       project_ext_id M       defines'),('schema.config',233,'  main:                         boolean M'),('schema.config',234,''),('schema.config',235,'  project_mapping_pk:           PK (int_id, ext_id)'),('schema.config',236,'  project_mapping_ak:           AK (ext_id)'),('schema.config',237,''),('schema.config',238,''),('schema.config',239,'build_type_mapping:             table'),('schema.config',240,''),('schema.config',241,'  int_id:                       bt_int_id M            refers'),('schema.config',242,'  ext_id:                       bt_ext_id M            defines'),('schema.config',243,'  main:                         boolean M'),('schema.config',244,''),('schema.config',245,'  build_type_mapping_pk:        PK (int_id, ext_id)'),('schema.config',246,'  build_type_mapping_ak:        AK (ext_id)'),('schema.config',247,''),('schema.config',248,''),('schema.config',249,'vcs_root_mapping:               table'),('schema.config',250,''),('schema.config',251,'  int_id:                       vcs_root_int_id M      defines -- refers    TODO return refers when vcs_root table is populated'),('schema.config',252,'  ext_id:                       vcs_root_ext_id M      defines'),('schema.config',253,'  main:                         boolean M'),('schema.config',254,''),('schema.config',255,'  vcs_root_mapping_pk:          PK (int_id, ext_id)'),('schema.config',256,'  vcs_root_mapping_ak:          AK (ext_id)'),('schema.config',257,''),('schema.config',258,''),('schema.config',259,'deleted_build_types:            table'),('schema.config',260,''),('schema.config',261,'  build_type_id:                bt_int_id M            refers'),('schema.config',262,'  delete_time:                  long_int'),('schema.config',263,''),('schema.config',264,'  deleted_build_types_pk:       PK (build_type_id)'),('schema.config',265,''),('schema.config',266,''),('schema.config',267,'agent_pool:                     table'),('schema.config',268,''),('schema.config',269,'  agent_pool_id:                agent_pool_id M  serial defines   -- 0 means the Default Pool'),('schema.config',270,'  agent_pool_name:              uni_str(191)            defines   -- see jetbrains.buildServer.serverSide.agentPools.AgentPoolConstants.MAX_POOL_NAME_LENGTH'),('schema.config',271,'  min_agents:                   int'),('schema.config',272,'  max_agents:                   int                       -- -1 means unlimited'),('schema.config',273,'  owner_project_id:             project_int_id          refers'),('schema.config',274,''),('schema.config',275,'  agent_pool_id_pk:             PK (agent_pool_id)'),('schema.config',276,'  agent_pool_name_idx:          IE (agent_pool_name)'),('schema.config',277,'  owner_project_idx:            IE (owner_project_id)'),('schema.config',278,''),('schema.config',279,''),('schema.config',280,'agent_type:                     table'),('schema.config',281,''),('schema.config',282,'  agent_type_id:                agent_type_id M  serial defines'),('schema.config',283,'  agent_pool_id:                agent_pool_id M         refers'),('schema.config',284,'  cloud_code:                   str(6) M'),('schema.config',285,'  profile_id:                   str(30) M'),('schema.config',286,'  image_id:                     str(60) M'),('schema.config',287,'  policy:                       int M       -- 1: all configurations, 2: selected ones only'),('schema.config',288,''),('schema.config',289,'  agent_type_pk:                PK (agent_type_id)'),('schema.config',290,'  agent_type_ak:                AK (cloud_code, profile_id, image_id)'),('schema.config',291,'  agent_type_pool_i:            IE (agent_pool_id)'),('schema.config',292,''),('schema.config',293,''),('schema.config',294,'agent_type_info:                table'),('schema.config',295,''),('schema.config',296,'  agent_type_id:                agent_type_id M  refers'),('schema.config',297,'  os_name:                      str(60) M'),('schema.config',298,'  cpu_rank:                     int'),('schema.config',299,'  created_timestamp:            timestamp'),('schema.config',300,'  modified_timestamp:           timestamp'),('schema.config',301,''),('schema.config',302,'  agent_type_info_pk:           PK (agent_type_id)'),('schema.config',303,''),('schema.config',304,''),('schema.config',305,'agent_type_runner:              table'),('schema.config',306,''),('schema.config',307,'  agent_type_id:                agent_type_id M  refers'),('schema.config',308,'  runner:                       str(250) M'),('schema.config',309,''),('schema.config',310,'  agent_type_runner_pk:         PK (agent_type_id, runner)'),('schema.config',311,''),('schema.config',312,''),('schema.config',313,'agent_type_vcs:                 table'),('schema.config',314,''),('schema.config',315,'  agent_type_id:                agent_type_id M  refers'),('schema.config',316,'  vcs:                          str(250) M'),('schema.config',317,''),('schema.config',318,'  agent_type_vcs_pk:            PK (agent_type_id, vcs)'),('schema.config',319,''),('schema.config',320,''),('schema.config',321,'agent_type_param:               table'),('schema.config',322,''),('schema.config',323,'  agent_type_id:                agent_type_id M  refers'),('schema.config',324,'  param_kind:                   char M'),('schema.config',325,'  param_name:                   str(160) M'),('schema.config',326,'  param_value:                  uni_str(2000)'),('schema.config',327,''),('schema.config',328,'  agent_type_param_pk:          PK (agent_type_id, param_kind, param_name)'),('schema.config',329,''),('schema.config',330,''),('schema.config',331,'agent:                          table'),('schema.config',332,''),('schema.config',333,'  id:                           agent_id M       serial defines'),('schema.config',334,'  name:                         str(80) M               defines'),('schema.config',335,'  host_addr:                    str(80) M'),('schema.config',336,'  port:                         int M'),('schema.config',337,'  agent_type_id:                int M'),('schema.config',338,'  status:                       int'),('schema.config',339,'  authorized:                   int'),('schema.config',340,'  registered:                   int'),('schema.config',341,'  registration_timestamp:       long_int'),('schema.config',342,'  last_binding_timestamp:       long_int'),('schema.config',343,'  unregistered_reason:          str(256)'),('schema.config',344,'  authorization_token:          str(32)'),('schema.config',345,'  status_to_restore:            int'),('schema.config',346,'  status_restoring_timestamp:   long_int'),('schema.config',347,''),('schema.config',348,'  agent_pk:                     PK (id)'),('schema.config',349,'  agent_name_ui:                AK (name)'),('schema.config',350,''),('schema.config',351,'  agent_host_address:           IE (host_addr)'),('schema.config',352,'  agent_authorization_token:    IE (authorization_token)'),('schema.config',353,'  agent_agent_type_id:          IE (agent_type_id)'),('schema.config',354,''),('schema.config',355,''),('schema.config',356,'cloud_started_instance:         table'),('schema.config',357,''),('schema.config',358,'  profile_id:                   str(30) M'),('schema.config',359,'  cloud_code:                   str(6) M'),('schema.config',360,'  image_id:                     str(80) M'),('schema.config',361,'  instance_id:                  str(80) M'),('schema.config',362,'  last_update:                  timestamp M'),('schema.config',363,''),('schema.config',364,'  cloud_started_instance_pk:    PK (profile_id, cloud_code, image_id, instance_id)'),('schema.config',365,''),('schema.config',366,''),('schema.config',367,'cloud_image_without_agent:      table'),('schema.config',368,''),('schema.config',369,'  profile_id:                   str(30) M'),('schema.config',370,'  cloud_code:                   str(6) M'),('schema.config',371,'  image_id:                     str(80) M'),('schema.config',372,'  last_update:                  timestamp M'),('schema.config',373,''),('schema.config',374,'  cloud_image_without_agent_pk: PK (profile_id, cloud_code, image_id)'),('schema.config',375,''),('schema.config',376,''),('schema.config',377,''),('schema.config',378,''),('schema.config',379,'-- USERS DEFINITION TABLES'),('schema.config',380,''),('schema.config',381,''),('schema.config',382,'usergroups:                     dictionary table'),('schema.config',383,''),('schema.config',384,'  group_id:                     group_id      M      defines'),('schema.config',385,'  name:                         uni_str(255)  M      defines'),('schema.config',386,'  description:                  uni_str(2000)'),('schema.config',387,''),('schema.config',388,'  usergroups_pk:                PK (group_id)        stable'),('schema.config',389,'  usergroups_ak:                AK (name)'),('schema.config',390,''),('schema.config',391,''),('schema.config',392,'usergroup_property:             table'),('schema.config',393,''),('schema.config',394,'  group_id:                     group_id M               refers'),('schema.config',395,'  prop_key:                     subject_property_key  M  defines'),('schema.config',396,'  prop_value:                   uni_str(2000)'),('schema.config',397,''),('schema.config',398,'  usergroup_property_pk:        PK (group_id, prop_key)'),('schema.config',399,''),('schema.config',400,''),('schema.config',401,'users:                          dictionary table'),('schema.config',402,''),('schema.config',403,'  id:                           user_id    M  serial defines  -- user\'s surrogate id'),('schema.config',404,'  username:                     teamcity_username  M defines  -- user\'s natural id, in lower case'),('schema.config',405,'  password:                     str(128)                      -- enciphered password'),('schema.config',406,'  name:                         uni_str(256)                  -- user\'s real name'),('schema.config',407,'  email:                        str(256)'),('schema.config',408,'  last_login_timestamp:         long_int'),('schema.config',409,''),('schema.config',410,'  users_pk:                     PK (id)'),('schema.config',411,'  users_ak:                     AK (username) stable'),('schema.config',412,''),('schema.config',413,''),('schema.config',414,'user_property:                  table'),('schema.config',415,''),('schema.config',416,'  user_id:                      user_id                M  refers'),('schema.config',417,'  prop_key:                     subject_property_key   M  defines'),('schema.config',418,'  prop_value:                   uni_str(2000)'),('schema.config',419,''),('schema.config',420,'  user_property_pk:             PK (user_id, prop_key)'),('schema.config',421,''),('schema.config',422,''),('schema.config',423,'user_blocks:                    table'),('schema.config',424,''),('schema.config',425,'  user_id:                      user_id M  refers'),('schema.config',426,'  block_type:                   str(80) M'),('schema.config',427,'  state:                        str(2048)'),('schema.config',428,''),('schema.config',429,'  user_blocks_pk:               PK (user_id, block_type)'),('schema.config',430,''),('schema.config',431,''),('schema.config',432,'user_notification_events:       table'),('schema.config',433,''),('schema.config',434,'  id:                           user_notific_rule_id M  serial defines'),('schema.config',435,'  user_id:                      user_id M                      refers'),('schema.config',436,'  notificator_type:             str(20) M'),('schema.config',437,'  events_mask:                  int M'),('schema.config',438,''),('schema.config',439,'  user_notification_events_pk:  PK (id)'),('schema.config',440,''),('schema.config',441,'  notification_events_notifier: IE (notificator_type)'),('schema.config',442,'  notification_events_user_id:  IE (user_id)'),('schema.config',443,''),('schema.config',444,''),('schema.config',445,'user_watch_type:                table'),('schema.config',446,''),('schema.config',447,'  rule_id:                      user_notific_rule_id M   refers'),('schema.config',448,'  user_id:                      user_id M                refers'),('schema.config',449,'  notificator_type:             str(20) M'),('schema.config',450,'  watch_type:                   int M    -- values 1..5; 2 - project, 3 - build type, other - unknown'),('schema.config',451,'  watch_value:                  str(80) M'),('schema.config',452,'  order_num:                    long_int'),('schema.config',453,''),('schema.config',454,'  user_watch_type_pk:           IE (user_id, notificator_type, watch_type, watch_value)'),('schema.config',455,'  watch_type_rule_id:           IE (rule_id)'),('schema.config',456,''),('schema.config',457,''),('schema.config',458,'user_notification_data:         table'),('schema.config',459,'  user_id:                      user_id M                refers'),('schema.config',460,'  rule_id:                      user_notific_rule_id M   refers'),('schema.config',461,'  additional_data:              str(2000)'),('schema.config',462,''),('schema.config',463,'  user_notif_data_pk:           PK (user_id, rule_id)'),('schema.config',464,'  user_notif_data_rule_id:      IE (rule_id)'),('schema.config',465,''),('schema.config',466,''),('schema.config',467,'usergroup_subgroups:            table'),('schema.config',468,''),('schema.config',469,'  hostgroup_id:                 group_id M'),('schema.config',470,'  subgroup_id:                  group_id M'),('schema.config',471,''),('schema.config',472,'  usergroup_subgroups_pk:       PK (hostgroup_id, subgroup_id)'),('schema.config',473,''),('schema.config',474,''),('schema.config',475,'usergroup_users:                table'),('schema.config',476,''),('schema.config',477,'  group_id:                     group_id M  refers'),('schema.config',478,'  user_id:                      user_id M   refers'),('schema.config',479,''),('schema.config',480,'  usergroup_users_pk:           PK (group_id, user_id)'),('schema.config',481,''),('schema.config',482,''),('schema.config',483,'usergroup_notification_events:  table'),('schema.config',484,''),('schema.config',485,'  id:                           group_notific_rule_id M  serial defines'),('schema.config',486,'  group_id:                     group_id M                      refers'),('schema.config',487,'  notificator_type:             str(20) M'),('schema.config',488,'  events_mask:                  int M'),('schema.config',489,''),('schema.config',490,'  usergroup_notific_evnts_pk:   PK (id)'),('schema.config',491,''),('schema.config',492,'  usergroup_events_notifier:    IE (notificator_type)'),('schema.config',493,'  usergroup_events_group_id:    IE (group_id)'),('schema.config',494,''),('schema.config',495,''),('schema.config',496,'usergroup_watch_type:           table'),('schema.config',497,''),('schema.config',498,'  rule_id:                      group_notific_rule_id M refers'),('schema.config',499,'  group_id:                     group_id M              refers'),('schema.config',500,'  notificator_type:             str(20) M'),('schema.config',501,'  watch_type:                   int M    -- values 1..5; 2 - project, 3 - build type, other - unknown'),('schema.config',502,'  watch_value:                  str(80) M'),('schema.config',503,'  order_num:                    long_int'),('schema.config',504,''),('schema.config',505,'  usergroup_watch_type_pk:      IE (group_id, notificator_type, watch_type, watch_value)'),('schema.config',506,'  group_watch_type_rule_id:     IE (rule_id)'),('schema.config',507,''),('schema.config',508,''),('schema.config',509,'usergroup_notification_data:    table'),('schema.config',510,''),('schema.config',511,'  group_id:                     group_id M               refers'),('schema.config',512,'  rule_id:                      group_notific_rule_id M  refers'),('schema.config',513,'  additional_data:              str(2000)'),('schema.config',514,''),('schema.config',515,'  group_notif_data_pk:          PK (group_id, rule_id)'),('schema.config',516,'  group_notif_data_rule_id:     IE (rule_id)'),('schema.config',517,''),('schema.config',518,''),('schema.config',519,'remember_me:                    table'),('schema.config',520,''),('schema.config',521,'  user_key:                     str(65) M'),('schema.config',522,'  secure:                       long_int M'),('schema.config',523,''),('schema.config',524,''),('schema.config',525,''),('schema.config',526,''),('schema.config',527,'-- COMMON DICTIONARY TABLES'),('schema.config',528,''),('schema.config',529,''),('schema.config',530,'long_file_name:                 dictionary table'),('schema.config',531,''),('schema.config',532,'  hash:                         file_name_hash M       defines'),('schema.config',533,'  file_name:                    long_uni_str(16000) M  defines'),('schema.config',534,''),('schema.config',535,'  long_file_name_pk:            PK (hash) stable'),('schema.config',536,''),('schema.config',537,''),('schema.config',538,'test_names:                     dictionary table'),('schema.config',539,''),('schema.config',540,'  id:                           test_name_hash M       defines'),('schema.config',541,'  test_name:                    uni_str(1024) M         defines'),('schema.config',542,'  order_num:                    long_int'),('schema.config',543,''),('schema.config',544,'  test_names_pk:                PK (id) stable'),('schema.config',545,'  order_num_idx:                IE (order_num)'),('schema.config',546,''),('schema.config',547,''),('schema.config',548,'data_storage_dict:              dictionary table'),('schema.config',549,''),('schema.config',550,'  metric_id:                    metric_hash M          defines'),('schema.config',551,'  value_type_key:               str(200)               defines'),('schema.config',552,''),('schema.config',553,'  metric_id_pk:                 PK (metric_id)         stable'),('schema.config',554,'  value_type_key_index:         AK (value_type_key)    stable'),('schema.config',555,''),('schema.config',556,''),('schema.config',557,'problem:                        dictionary table'),('schema.config',558,''),('schema.config',559,'  problem_id:                   problem_id       M serial defines'),('schema.config',560,'  problem_type:                 problem_type     M'),('schema.config',561,'  problem_identity:             problem_identity M'),('schema.config',562,''),('schema.config',563,'  problem_pk:                   PK (problem_id)'),('schema.config',564,'  problem_ak:                   AK (problem_type, problem_identity) stable'),('schema.config',565,''),('schema.config',566,''),('schema.config',567,'agent_type_bt_access:           table'),('schema.config',568,''),('schema.config',569,'  agent_type_id:                agent_type_id M        refers'),('schema.config',570,'  build_type_id:                bt_int_id M            refers'),('schema.config',571,''),('schema.config',572,'  agent_type_bt_access_pk:      PK (agent_type_id, build_type_id)'),('schema.config',573,'  agent_type_bt_access_bt_i:    IE (build_type_id)'),('schema.config',574,''),('schema.config',575,''),('schema.config',576,'user_projects_visibility:       table'),('schema.config',577,''),('schema.config',578,'  user_id:                      user_id M              refers'),('schema.config',579,'  project_int_id:               project_int_id M       refers'),('schema.config',580,'  visible:                      int M'),('schema.config',581,''),('schema.config',582,'  user_projects_visibility_pk:  PK (user_id, project_int_id)'),('schema.config',583,''),('schema.config',584,''),('schema.config',585,'user_projects_order:            table'),('schema.config',586,''),('schema.config',587,'  user_id:                      user_id M              refers'),('schema.config',588,'  project_int_id:               project_int_id M       refers'),('schema.config',589,'  ordernum:                     int'),('schema.config',590,''),('schema.config',591,'  user_projects_order_pk:       PK (user_id, project_int_id)'),('schema.config',592,''),('schema.config',593,'user_build_types_order:         table'),('schema.config',594,''),('schema.config',595,'  user_id:                      user_id M              refers'),('schema.config',596,'  project_int_id:               project_int_id M       refers'),('schema.config',597,'  bt_int_id:                    bt_int_id M            refers'),('schema.config',598,'  ordernum:                     int M'),('schema.config',599,'  visible:                      int M'),('schema.config',600,''),('schema.config',601,'  user_bt_order_pk:             PK (user_id, project_int_id, bt_int_id)'),('schema.config',602,''),('schema.config',603,'vcs_root_instance:              table'),('schema.config',604,''),('schema.config',605,'  id:                           vcs_root_instance_id M  serial defines'),('schema.config',606,'  parent_id:                    vcs_root_int_id M              refers'),('schema.config',607,'  settings_hash:                long_int M'),('schema.config',608,'  body:                         long_str(16384)'),('schema.config',609,''),('schema.config',610,'  vcs_root_instance_pk:         PK (id)'),('schema.config',611,'  vcs_root_instance_parent_idx: IE (parent_id)'),('schema.config',612,'  vcs_root_instance_hash_idx:   IE (settings_hash)'),('schema.config',613,''),('schema.config',614,''),('schema.config',615,'agent_pool_project:             table'),('schema.config',616,''),('schema.config',617,'  agent_pool_id:                agent_pool_id M         refers'),('schema.config',618,'  project_int_id:               project_int_id M        refers'),('schema.config',619,''),('schema.config',620,'  agent_pool_project_pk:        PK (agent_pool_id, project_int_id)'),('schema.config',621,''),('schema.config',622,''),('schema.config',623,'vcs_history:                    table'),('schema.config',624,''),('schema.config',625,'  modification_id:              modification_id M       serial defines'),('schema.config',626,'  user_name:                    uni_str(255)'),('schema.config',627,'  description:                  uni_str(2000)'),('schema.config',628,'  change_date:                  long_int'),('schema.config',629,'  register_date:                long_int'),('schema.config',630,'  vcs_root_id:                  vcs_root_instance_id           refers'),('schema.config',631,'  changes_count:                int'),('schema.config',632,'  version:                      vcs_revision M'),('schema.config',633,'  display_version:              str(200)'),('schema.config',634,''),('schema.config',635,'  vcs_history_pk:               PK (modification_id)'),('schema.config',636,''),('schema.config',637,'  vcs_history_root_id_mod_id_i: IE (vcs_root_id, modification_id)'),('schema.config',638,'  vcs_history_user:             IE (user_name)'),('schema.config',639,'  vcs_history_date_i:           IE (register_date)'),('schema.config',640,'  vcs_version_in_root_i:        IE (vcs_root_id, version)'),('schema.config',641,''),('schema.config',642,''),('schema.config',643,'vcs_change:                     table'),('schema.config',644,''),('schema.config',645,'  modification_id:              modification_id M   refers'),('schema.config',646,'  file_num:                     int M                           -- number of file in the change'),('schema.config',647,'  vcs_file_name:                uni_str(2000) M                 -- first 2000 characters if the name is long'),('schema.config',648,'  vcs_file_name_hash:           file_name_hash      refers'),('schema.config',649,'  relative_file_name_pos:       int'),('schema.config',650,'  relative_file_name:           uni_str(2000)'),('schema.config',651,'  relative_file_name_hash:      file_name_hash      refers'),('schema.config',652,'  change_type:                  int M'),('schema.config',653,'  change_name:                  str(64)'),('schema.config',654,'  before_revision:              vcs_revision'),('schema.config',655,'  after_revision:               vcs_revision'),('schema.config',656,''),('schema.config',657,'  vcs_change_pk:                PK (modification_id, file_num)'),('schema.config',658,''),('schema.config',659,''),('schema.config',660,'personal_vcs_history:           table'),('schema.config',661,''),('schema.config',662,'  modification_id:              personal_modification_id M serial defines'),('schema.config',663,'  modification_hash:            modification_hash M               defines'),('schema.config',664,'  user_id:                      user_id           M               refers'),('schema.config',665,'  description:                  uni_str(2000)'),('schema.config',666,'  change_date:                  long_int          M'),('schema.config',667,'  changes_count:                int               M'),('schema.config',668,'  commit_changes:               int'),('schema.config',669,'  status:                       int               M default 0'),('schema.config',670,'  scheduled_for_deletion:       boolean           M default 0'),('schema.config',671,''),('schema.config',672,'  personal_vcs_history_pk:      PK (modification_id)'),('schema.config',673,'  personal_vcs_history_ak:      AK (modification_hash)      stable'),('schema.config',674,'  personal_vcs_history_user_i:  IE (user_id)'),('schema.config',675,''),('schema.config',676,''),('schema.config',677,'personal_vcs_change:            table'),('schema.config',678,''),('schema.config',679,'  modification_id:              personal_modification_id M  refers'),('schema.config',680,'  file_num:                     int M                               -- number of file in the change'),('schema.config',681,'  vcs_file_name:                uni_str(2000) M                     -- first 2000 characters if the name is long'),('schema.config',682,'  vcs_file_name_hash:           file_name_hash              refers'),('schema.config',683,'  relative_file_name_pos:       int'),('schema.config',684,'  relative_file_name:           uni_str(2000)'),('schema.config',685,'  relative_file_name_hash:      file_name_hash              refers'),('schema.config',686,'  change_type:                  int M'),('schema.config',687,'  change_name:                  str(64)'),('schema.config',688,'  before_revision:              vcs_revision'),('schema.config',689,'  after_revision:               vcs_revision'),('schema.config',690,''),('schema.config',691,'  personal_vcs_changes_pk:      PK (modification_id, file_num)'),('schema.config',692,''),('schema.config',693,''),('schema.config',694,'vcs_changes_graph:              table'),('schema.config',695,''),('schema.config',696,'  child_modification_id:        modification_id M   refers'),('schema.config',697,'  child_revision:               vcs_revision M'),('schema.config',698,'  parent_num:                   int M'),('schema.config',699,'  parent_modification_id:       modification_id     refers'),('schema.config',700,'  parent_revision:              vcs_revision M'),('schema.config',701,''),('schema.config',702,'  vcs_changes_graph_pk:         PK (child_modification_id, parent_num)'),('schema.config',703,'  vcs_changes_graph_parent_i:   IE (parent_modification_id)'),('schema.config',704,''),('schema.config',705,''),('schema.config',706,'vcs_change_attrs:               table'),('schema.config',707,''),('schema.config',708,'  modification_id:              modification_id M   refers'),('schema.config',709,'  attr_name:                    str(200) M'),('schema.config',710,'  attr_value:                   str(1000)'),('schema.config',711,''),('schema.config',712,'  vcs_change_attrs_pk:          PK (modification_id, attr_name)'),('schema.config',713,''),('schema.config',714,''),('schema.config',715,'vcs_root_first_revision:        table'),('schema.config',716,''),('schema.config',717,'  build_type_id:                bt_int_id M        refers'),('schema.config',718,'  parent_root_id:               vcs_root_int_id M  refers'),('schema.config',719,'  settings_hash:                long_int M'),('schema.config',720,'  vcs_revision:                 vcs_revision M'),('schema.config',721,''),('schema.config',722,'  vcs_root_first_revision_pk:   PK (build_type_id, parent_root_id, settings_hash)'),('schema.config',723,''),('schema.config',724,''),('schema.config',725,'vcs_username:                   table'),('schema.config',726,''),('schema.config',727,'  user_id:                      user_id M refers'),('schema.config',728,'  vcs_name:                     str(60) M'),('schema.config',729,'  parent_vcs_root_id:           vcs_root_int_id M refers'),('schema.config',730,'  order_num:                    int M'),('schema.config',731,'  username:                     uni_str(255) M'),('schema.config',732,''),('schema.config',733,'  vcs_username_pk:              PK (user_id, vcs_name, parent_vcs_root_id, order_num)'),('schema.config',734,'  vcs_username_ak:              AK (user_id, vcs_name, parent_vcs_root_id, username)'),('schema.config',735,'  vcs_username_user_ie:         IE (vcs_name, parent_vcs_root_id, username)'),('schema.config',736,''),('schema.config',737,''),('schema.config',738,'build_state:                    table'),('schema.config',739,''),('schema.config',740,'  id:                           promotion_id M   serial defines'),('schema.config',741,'  build_id:                     build_id         defines'),('schema.config',742,'  build_type_id:                bt_int_id        refers'),('schema.config',743,'  modification_id:              modification_id  refers    -- can be null if changes checking was not performed yet,'),('schema.config',744,'                                                           -- equals -1 if changes collecting is performed but there were no changes'),('schema.config',745,'                                                           -- detected and there were no changes in the build configuration since its creation'),('schema.config',746,'  chain_modification_id:        modification_id  refers    -- see docs for BuildPromotionEx.getChainModificationId()'),('schema.config',747,'  personal_modification_id:     personal_modification_id   -- reference to personal_vcs_history, or null for regular builds'),('schema.config',748,'  personal_user_id:             user_id                    -- owner of the modification'),('schema.config',749,'  is_personal:                  boolean M default 0'),('schema.config',750,'  is_canceled:                  boolean M default 0'),('schema.config',751,'  is_changes_detached:          boolean M default 0'),('schema.config',752,'  is_deleted:                   boolean M default 0'),('schema.config',753,'  branch_name:                  str(255)                   -- null means no branch (master)'),('schema.config',754,'  queued_time:                  long_int'),('schema.config',755,'  remove_from_queue_time:       long_int'),('schema.config',756,''),('schema.config',757,'  build_state_pk:               PK (id)'),('schema.config',758,''),('schema.config',759,'  build_state_build_i:          IE (build_id)'),('schema.config',760,'  build_state_mod_i:            IE (modification_id)'),('schema.config',761,'  build_state_build_type_i:     IE (build_type_id)'),('schema.config',762,'  build_state_puser_i:          IE (personal_user_id)'),('schema.config',763,'  build_state_pmod_i:           IE (personal_modification_id)'),('schema.config',764,'  build_state_rem_queue_time_i: IE (remove_from_queue_time)'),('schema.config',765,''),('schema.config',766,''),('schema.config',767,'running:                        table'),('schema.config',768,''),('schema.config',769,'  build_id:                     build_id M       serial defines'),('schema.config',770,'  agent_id:                     agent_id                refers'),('schema.config',771,'  build_type_id:                bt_int_id               refers'),('schema.config',772,'  build_start_time_agent:       long_int'),('schema.config',773,'  build_start_time_server:      long_int'),('schema.config',774,'  build_finish_time_server:     long_int'),('schema.config',775,'  last_build_activity_time:     long_int'),('schema.config',776,'  is_personal:                  int'),('schema.config',777,'  build_number:                 str(256)'),('schema.config',778,'  build_counter:                long_int'),('schema.config',779,'  requestor:                    str(1024)'),('schema.config',780,'  access_code:                  str(60)'),('schema.config',781,'  queued_ag_restr_type_id:      int                             -- agent restrictor type id'),('schema.config',782,'  queued_ag_restr_id:           int                             -- agent restrictor id'),('schema.config',783,'  build_state_id:               promotion_id            refers'),('schema.config',784,'  agent_type_id:                agent_type_id           refers'),('schema.config',785,'  user_status_text:             uni_str(256)'),('schema.config',786,'  progress_text:                uni_str(1024)'),('schema.config',787,'  current_path_text:            long_uni_str(2048)'),('schema.config',788,''),('schema.config',789,'  running_pk:                   PK (build_id)'),('schema.config',790,''),('schema.config',791,'  running_state_id:             IE (build_state_id)'),('schema.config',792,''),('schema.config',793,'history:                        table'),('schema.config',794,''),('schema.config',795,'  build_id:                     build_id M      serial  defines'),('schema.config',796,'  agent_name:                   str(80)'),('schema.config',797,'  build_type_id:                bt_int_id               refers'),('schema.config',798,'  build_start_time_server:      long_int'),('schema.config',799,'  build_start_time_agent:       long_int'),('schema.config',800,'  build_finish_time_server:     long_int'),('schema.config',801,'  status:                       int'),('schema.config',802,'  status_text:                  uni_str(256)'),('schema.config',803,'  user_status_text:             uni_str(256)'),('schema.config',804,'  pin:                          int'),('schema.config',805,'  is_personal:                  int'),('schema.config',806,'  is_canceled:                  int'),('schema.config',807,'  build_number:                 str(256)'),('schema.config',808,'  requestor:                    str(1024)'),('schema.config',809,'  build_state_id:               promotion_id            refers'),('schema.config',810,'  agent_type_id:                agent_type_id'),('schema.config',811,''),('schema.config',812,'  history_pk:                   PK (build_id)'),('schema.config',813,''),('schema.config',814,'  start_time_index:             IE (build_start_time_server)'),('schema.config',815,'  build_type_id_index:          IE (build_type_id)'),('schema.config',816,'  pinned_index:                 IE (pin)'),('schema.config',817,'  status_index:                 IE (status)'),('schema.config',818,'  history_state_id:             IE (build_state_id)'),('schema.config',819,'  history_agname_bfintimesrv_i: IE (agent_name, build_finish_time_server)'),('schema.config',820,'  history_finish_time_i:        IE (build_finish_time_server)'),('schema.config',821,'  history_build_number:         IE (build_number)'),('schema.config',822,'  history_agt_b_i:              IE (agent_type_id, build_id)'),('schema.config',823,''),('schema.config',824,''),('schema.config',825,'light_history:                  table'),('schema.config',826,''),('schema.config',827,'  build_id:                     build_id M      serial  defines'),('schema.config',828,'  agent_name:                   str(80)'),('schema.config',829,'  build_type_id:                bt_int_id               refers'),('schema.config',830,'  build_start_time_server:      long_int'),('schema.config',831,'  build_start_time_agent:       long_int'),('schema.config',832,'  build_finish_time_server:     long_int'),('schema.config',833,'  status:                       int'),('schema.config',834,'  status_text:                  uni_str(256)'),('schema.config',835,'  user_status_text:             uni_str(256)'),('schema.config',836,'  pin:                          int'),('schema.config',837,'  is_personal:                  int'),('schema.config',838,'  is_canceled:                  int'),('schema.config',839,'  build_number:                 str(256)'),('schema.config',840,'  requestor:                    str(1024)'),('schema.config',841,'  queued_time:                  long_int'),('schema.config',842,'  remove_from_queue_time:       long_int'),('schema.config',843,'  build_state_id:               long_int            -- contains garbage, to drop'),('schema.config',844,'  agent_type_id:                agent_type_id'),('schema.config',845,'  branch_name:                  str(255)            -- null means no branch (master)'),('schema.config',846,''),('schema.config',847,'  light_history_pk:              PK (build_id)'),('schema.config',848,''),('schema.config',849,'  start_time_index_light:        IE (build_start_time_server)'),('schema.config',850,'  build_type_id_index_light:     IE (build_type_id)'),('schema.config',851,'  pinned_index_light:            IE (pin)'),('schema.config',852,'  status_index_light:            IE (status)'),('schema.config',853,'  light_history_agname_bftime_i: IE (agent_name, build_finish_time_server)'),('schema.config',854,'  light_history_finish_time_i:   IE (build_finish_time_server)'),('schema.config',855,'  light_history_agt_b_i:         IE (agent_type_id, build_id)'),('schema.config',856,''),('schema.config',857,''),('schema.config',858,'build_project:                  table'),('schema.config',859,''),('schema.config',860,'  build_id:                     build_id M        refers'),('schema.config',861,'  project_level:                int M'),('schema.config',862,'  project_int_id:               project_int_id M  refers'),('schema.config',863,''),('schema.config',864,'  build_project_pk:             PK (build_id, project_level)'),('schema.config',865,'  build_project_project_idx:    IE (project_int_id)'),('schema.config',866,''),('schema.config',867,''),('schema.config',868,'build_dependency:               table'),('schema.config',869,''),('schema.config',870,'  build_state_id:               promotion_id M    refers'),('schema.config',871,'  depends_on:                   promotion_id M    refers'),('schema.config',872,'  dependency_options:           int'),('schema.config',873,''),('schema.config',874,'  build_dependency_pk:          PK (build_state_id, depends_on)'),('schema.config',875,'  build_dependency_ak:          IE (depends_on, build_state_id)'),('schema.config',876,''),('schema.config',877,''),('schema.config',878,'build_attrs:                    table -- really it\'s promotion attrs'),('schema.config',879,''),('schema.config',880,'  build_state_id:               promotion_id M    refers'),('schema.config',881,'  attr_name:                    str(70) M'),('schema.config',882,'  attr_value:                   uni_str(1000)'),('schema.config',883,'  attr_num_value:               long_int'),('schema.config',884,''),('schema.config',885,'  build_attrs_pk:               PK (build_state_id, attr_name)'),('schema.config',886,'  build_attrs_num_i:            IE (attr_num_value, attr_name, build_state_id)'),('schema.config',887,'  build_attrs_name_idx:         IE (attr_name)'),('schema.config',888,''),('schema.config',889,''),('schema.config',890,'build_data_storage:             table'),('schema.config',891,''),('schema.config',892,'  build_id:                     build_id M              refers'),('schema.config',893,'  metric_id:                    metric_hash M           refers'),('schema.config',894,'  metric_value:                 decimal(19,6) M'),('schema.config',895,''),('schema.config',896,'  build_data_storage_pk:        PK (build_id, metric_id)'),('schema.config',897,''),('schema.config',898,''),('schema.config',899,'canceled_info:                  table'),('schema.config',900,''),('schema.config',901,'  build_id:                     build_id M              refers'),('schema.config',902,'  user_id:                      user_id                 refers'),('schema.config',903,'  description:                  str(256)'),('schema.config',904,''),('schema.config',905,'  canceled_info_pk:             PK (build_id)'),('schema.config',906,''),('schema.config',907,''),('schema.config',908,'test_info:                      table'),('schema.config',909,''),('schema.config',910,'  build_id:                     build_id M       refers'),('schema.config',911,'  test_id:                      int M'),('schema.config',912,'  test_name_id:                 test_name_hash   refers'),('schema.config',913,'  status:                       int'),('schema.config',914,'  duration:                     int M default 0'),('schema.config',915,''),('schema.config',916,'  test_info_pk:                 PK (build_id, test_id)'),('schema.config',917,'  test_name_id_idx:             IE (test_name_id)'),('schema.config',918,''),('schema.config',919,''),('schema.config',920,'build_problem:                  table'),('schema.config',921,''),('schema.config',922,'  build_state_id:               promotion_id M    refers'),('schema.config',923,'  problem_id:                   problem_id M      refers'),('schema.config',924,'  problem_description:          long_str(4000)'),('schema.config',925,''),('schema.config',926,'  build_problem_pk:             PK (build_state_id, problem_id)'),('schema.config',927,''),('schema.config',928,''),('schema.config',929,'build_problem_attribute:        table'),('schema.config',930,''),('schema.config',931,'  build_state_id:               promotion_id M    refers'),('schema.config',932,'  problem_id:                   problem_id M      refers'),('schema.config',933,'  attr_name:                    str(60) M'),('schema.config',934,'  attr_value:                   str(2000) M'),('schema.config',935,''),('schema.config',936,'  build_problem_attribute_pk:   PK (build_state_id, problem_id, attr_name)'),('schema.config',937,''),('schema.config',938,''),('schema.config',939,'build_artifact_dependency:      table'),('schema.config',940,''),('schema.config',941,'  artif_dep_id:                 dependency_id M'),('schema.config',942,'  build_state_id:               promotion_id      refers'),('schema.config',943,'  source_build_type_id:         bt_int_id         refers'),('schema.config',944,'  revision_rule:                str(80)'),('schema.config',945,'  branch:                       str(255)'),('schema.config',946,'  src_paths:                    long_str(40960)'),('schema.config',947,''),('schema.config',948,'  build_artif_dep_state_id:     IE (build_state_id)'),('schema.config',949,''),('schema.config',950,''),('schema.config',951,'final_artifact_dependency:      table'),('schema.config',952,''),('schema.config',953,'  artif_dep_id:                 dependency_id M'),('schema.config',954,'  build_state_id:               promotion_id      refers'),('schema.config',955,'  source_build_type_id:         bt_int_id         refers'),('schema.config',956,'  revision_rule:                str(80)'),('schema.config',957,'  branch:                       str(255)'),('schema.config',958,'  src_paths:                    long_str(40960)'),('schema.config',959,''),('schema.config',960,'  final_artif_dep_state_id:     IE (build_state_id)'),('schema.config',961,''),('schema.config',962,''),('schema.config',963,'build_type_vcs_change:          table'),('schema.config',964,''),('schema.config',965,'  modification_id:              modification_id M   refers'),('schema.config',966,'  build_type_id:                bt_int_id M         refers'),('schema.config',967,'  change_type:                  int'),('schema.config',968,''),('schema.config',969,'  build_type_vcs_change_ui:     AK (modification_id, build_type_id)'),('schema.config',970,'  build_type_vcs_change_btid:   IE (build_type_id)'),('schema.config',971,''),('schema.config',972,''),('schema.config',973,'build_type_edge_relation:       table'),('schema.config',974,''),('schema.config',975,'  child_modification_id:        modification_id M   refers'),('schema.config',976,'  build_type_id:                bt_int_id M         refers'),('schema.config',977,'  parent_num:                   int M'),('schema.config',978,'  change_type:                  int'),('schema.config',979,''),('schema.config',980,'  build_type_edge_relation_pk:  PK (child_modification_id, build_type_id, parent_num)'),('schema.config',981,'  bt_edge_relation_btid:        IE (build_type_id)'),('schema.config',982,''),('schema.config',983,''),('schema.config',984,'build_checkout_rules:           table'),('schema.config',985,''),('schema.config',986,'  build_state_id:               promotion_id M           refers'),('schema.config',987,'  build_type_id:                bt_int_id M              refers'),('schema.config',988,'  vcs_root_id:                  vcs_root_instance_id M   refers'),('schema.config',989,'  checkout_rules:               long_str(2096)'),('schema.config',990,''),('schema.config',991,'  build_checkout_rules_pk:      PK (build_state_id, build_type_id, vcs_root_id)'),('schema.config',992,'  build_checkout_rules_vcs_r_i: IE (vcs_root_id)'),('schema.config',993,''),('schema.config',994,''),('schema.config',995,'mute_info:                      table'),('schema.config',996,''),('schema.config',997,'  -- invariant records (they\'re expected never been modified)'),('schema.config',998,'  mute_id:                      mute_id M         serial defines'),('schema.config',999,'  muting_user_id:               user_id M         refers'),('schema.config',1000,'  muting_time:                  timestamp M'),('schema.config',1001,'  muting_comment:               uni_str(2000)'),('schema.config',1002,'  scope:                        char M                       -- possible values: B (build), C (configuration), P (project)'),('schema.config',1003,'  project_int_id:               project_int_id M  refers'),('schema.config',1004,'  build_id:                     build_id          refers'),('schema.config',1005,'  unmute_when_fixed:            boolean'),('schema.config',1006,'  unmute_by_time:               timestamp'),('schema.config',1007,''),('schema.config',1008,'  mute_info_pk:                 PK (mute_id)'),('schema.config',1009,'  mute_info_ak:                 AK (project_int_id, mute_id)'),('schema.config',1010,''),('schema.config',1011,''),('schema.config',1012,'mute_info_bt:                   table'),('schema.config',1013,''),('schema.config',1014,'  -- build type was muted (a detail of the mute_info), not currently muted'),('schema.config',1015,'  mute_id:                      mute_id M         refers'),('schema.config',1016,'  build_type_id:                bt_int_id M       refers'),('schema.config',1017,''),('schema.config',1018,'  mute_info_bt_pk:              PK (mute_id, build_type_id)'),('schema.config',1019,''),('schema.config',1020,''),('schema.config',1021,'mute_info_test:                 table'),('schema.config',1022,''),('schema.config',1023,'  -- test was muted (a detail of the mute_info), not currently muted'),('schema.config',1024,'  mute_id:                      mute_id M         refers'),('schema.config',1025,'  test_name_id:                 test_name_hash M  refers'),('schema.config',1026,''),('schema.config',1027,'  mute_info_test_pk:            PK (mute_id, test_name_id)'),('schema.config',1028,''),('schema.config',1029,''),('schema.config',1030,'mute_test_in_proj:              table'),('schema.config',1031,''),('schema.config',1032,'  -- currently muted test in project'),('schema.config',1033,'  mute_id:                      mute_id M         refers   -- records can be reassigned from one muting to another'),('schema.config',1034,'  project_int_id:               project_int_id M  refers'),('schema.config',1035,'  test_name_id:                 test_name_hash M  refers'),('schema.config',1036,''),('schema.config',1037,'  mute_test_in_proj_pk:         PK (mute_id, project_int_id, test_name_id)'),('schema.config',1038,'  mute_test_in_proj_ie:         IE (project_int_id, test_name_id, mute_id)'),('schema.config',1039,''),('schema.config',1040,''),('schema.config',1041,'mute_test_in_bt:                table'),('schema.config',1042,''),('schema.config',1043,'  -- currently muted test in build configuration'),('schema.config',1044,'  mute_id:                      mute_id M         refers   -- records can be reassigned from one muting to another'),('schema.config',1045,'  build_type_id:                bt_int_id M       refers'),('schema.config',1046,'  test_name_id:                 test_name_hash M  refers'),('schema.config',1047,''),('schema.config',1048,'  mute_test_in_bt_pk:           PK (mute_id, build_type_id, test_name_id)'),('schema.config',1049,'  mute_test_in_bt_ie:           IE (build_type_id, test_name_id, mute_id)'),('schema.config',1050,''),('schema.config',1051,''),('schema.config',1052,'mute_info_problem:              table'),('schema.config',1053,''),('schema.config',1054,'  mute_id:                      mute_id M         refers'),('schema.config',1055,'  problem_id:                   problem_id M      refers'),('schema.config',1056,''),('schema.config',1057,'  mute_info_problem_pk:         PK (mute_id, problem_id)'),('schema.config',1058,''),('schema.config',1059,''),('schema.config',1060,'mute_problem_in_proj:           table'),('schema.config',1061,''),('schema.config',1062,'  -- currently muted build problem in project'),('schema.config',1063,'  mute_id:                      mute_id M         refers'),('schema.config',1064,'  project_int_id:               project_int_id M  refers'),('schema.config',1065,'  problem_id:                   problem_id M      refers'),('schema.config',1066,''),('schema.config',1067,'  mute_problem_in_proj_pk:      PK (mute_id, project_int_id, problem_id)'),('schema.config',1068,'  mute_problem_in_proj_ie:      IE (project_int_id, problem_id, mute_id)'),('schema.config',1069,''),('schema.config',1070,''),('schema.config',1071,'mute_problem_in_bt:             table'),('schema.config',1072,''),('schema.config',1073,'  -- currently muted build problem in build configuration'),('schema.config',1074,'  mute_id:                      mute_id M         refers'),('schema.config',1075,'  build_type_id:                bt_int_id M       refers'),('schema.config',1076,'  problem_id:                   problem_id M      refers'),('schema.config',1077,''),('schema.config',1078,'  mute_problem_in_bt_pk:        PK (mute_id, build_type_id, problem_id)'),('schema.config',1079,'  mute_problem_in_bt_ie:        IE (build_type_id, problem_id, mute_id)'),('schema.config',1080,''),('schema.config',1081,''),('schema.config',1082,'build_problem_muted:            table'),('schema.config',1083,''),('schema.config',1084,'  build_state_id:               promotion_id M    refers'),('schema.config',1085,'  problem_id:                   problem_id M      refers'),('schema.config',1086,'  mute_id:                      mute_id           refers   -- may be null if problem internally muted during the build'),('schema.config',1087,''),('schema.config',1088,'  build_problem_muted_pk:       PK (build_state_id, problem_id)'),('schema.config',1089,'  build_problem_mute_id:        IE (mute_id)'),('schema.config',1090,''),('schema.config',1091,''),('schema.config',1092,'test_muted:                     table'),('schema.config',1093,''),('schema.config',1094,'  build_id:                     build_id M         refers'),('schema.config',1095,'  test_name_id:                 test_name_hash M   refers'),('schema.config',1096,'  mute_id:                      mute_id M          refers'),('schema.config',1097,''),('schema.config',1098,'  test_muted_pk:                PK (build_id, test_name_id, mute_id)'),('schema.config',1099,'  test_muted_mute_id:           IE (mute_id)'),('schema.config',1100,''),('schema.config',1101,''),('schema.config',1102,'test_failure_rate:              table'),('schema.config',1103,''),('schema.config',1104,'  build_type_id:                bt_int_id M        refers'),('schema.config',1105,'  test_name_id:                 test_name_hash M   refers'),('schema.config',1106,'  success_count:                int'),('schema.config',1107,'  failure_count:                int'),('schema.config',1108,'  last_failure_time:            long_int'),('schema.config',1109,''),('schema.config',1110,'  test_failure_rate_pk:         PK (build_type_id, test_name_id)'),('schema.config',1111,'  test_failure_rate_tn_idx:     IE (test_name_id)'),('schema.config',1112,''),('schema.config',1113,''),('schema.config',1114,'build_queue:                    table'),('schema.config',1115,''),('schema.config',1116,'  build_type_id:                bt_int_id          refers'),('schema.config',1117,'  agent_restrictor_type_id:     int'),('schema.config',1118,'  agent_restrictor_id:          int'),('schema.config',1119,'  requestor:                    str(1024)'),('schema.config',1120,'  pos:                          int'),('schema.config',1121,'  build_state_id:               promotion_id       refers'),('schema.config',1122,''),('schema.config',1123,'  build_queue_build_state_id:   IE (build_state_id)'),('schema.config',1124,''),('schema.config',1125,''),('schema.config',1126,'stats:                          table'),('schema.config',1127,''),('schema.config',1128,'  build_id:                     build_id M         refers'),('schema.config',1129,'  test_count:                   int'),('schema.config',1130,'  -- a record per build'),('schema.config',1131,''),('schema.config',1132,'  stats_pk:                     PK (build_id)'),('schema.config',1133,''),('schema.config',1134,''),('schema.config',1135,'failed_tests_output:            table'),('schema.config',1136,''),('schema.config',1137,'  build_id:                     build_id M         refers'),('schema.config',1138,'  test_id:                      int M'),('schema.config',1139,'  problem_description:          long_str(256)'),('schema.config',1140,'  std_output:                   long_str(40960)'),('schema.config',1141,'  error_output:                 long_str(40960)'),('schema.config',1142,'  stacktrace:                   long_str(40960)'),('schema.config',1143,'  expected:                     long_str(40960)'),('schema.config',1144,'  actual:                       long_str(40960)'),('schema.config',1145,''),('schema.config',1146,'  failed_tests_output_pk:       PK (build_id, test_id)'),('schema.config',1147,''),('schema.config',1148,''),('schema.config',1149,'compiler_output:                table'),('schema.config',1150,''),('schema.config',1151,'  build_id:                     build_id           refers'),('schema.config',1152,'  message_order:                int'),('schema.config',1153,'  message:                      long_str(40960)'),('schema.config',1154,''),('schema.config',1155,'  co_build_id_index:            IE (build_id)'),('schema.config',1156,''),('schema.config',1157,''),('schema.config',1158,'ignored_tests:                  table'),('schema.config',1159,''),('schema.config',1160,'  build_id:                     build_id           refers'),('schema.config',1161,'  test_id:                      int'),('schema.config',1162,'  ignore_reason:                uni_str(2000)'),('schema.config',1163,''),('schema.config',1164,'  ignored_tests_build_id:       IE (build_id)'),('schema.config',1165,''),('schema.config',1166,''),('schema.config',1167,'downloaded_artifacts:           table'),('schema.config',1168,''),('schema.config',1169,'  target_build_id:              build_id           refers   -- artifact was downloaded to'),('schema.config',1170,'  source_build_id:              build_id           refers   -- artifact was downloaded from'),('schema.config',1171,'  download_timestamp:           long_int'),('schema.config',1172,'  artifact_path:                long_str(8192)'),('schema.config',1173,''),('schema.config',1174,'  downloaded_artifacts_source_id: IE (source_build_id)'),('schema.config',1175,'  downloaded_artifacts_ts_id: IE (target_build_id,source_build_id)'),('schema.config',1176,''),('schema.config',1177,''),('schema.config',1178,'build_revisions:                table'),('schema.config',1179,''),('schema.config',1180,'  build_state_id:               promotion_id M          refers'),('schema.config',1181,'  vcs_root_id:                  vcs_root_instance_id M  refers'),('schema.config',1182,'  vcs_revision:                 vcs_revision M'),('schema.config',1183,'  vcs_revision_display_name:    str(200)'),('schema.config',1184,'  vcs_branch_name:              str(255)'),('schema.config',1185,'  modification_id:              modification_id         refers'),('schema.config',1186,'  vcs_root_type:                int'),('schema.config',1187,'  checkout_mode:                int  -- null means the default checkout mode from a buildType, see BuildRevisionCheckoutMode'),('schema.config',1188,''),('schema.config',1189,'  build_revisions_pk:           PK (build_state_id, vcs_root_id)'),('schema.config',1190,'  build_revisions_vcs_root_i:   IE (vcs_root_id)'),('schema.config',1191,'  build_revisions_mod_id_i:     IE (modification_id)    -- see TW-47662'),('schema.config',1192,''),('schema.config',1193,''),('schema.config',1194,'default_build_parameters:       table'),('schema.config',1195,''),('schema.config',1196,'  build_state_id:               promotion_id       refers'),('schema.config',1197,'  param_name:                   str(2000)'),('schema.config',1198,'  param_value:                  long_uni_str(16000)'),('schema.config',1199,''),('schema.config',1200,'  def_build_params_state_id:    IE (build_state_id)'),('schema.config',1201,''),('schema.config',1202,''),('schema.config',1203,'user_build_parameters:          table'),('schema.config',1204,''),('schema.config',1205,'  build_state_id:               promotion_id       refers'),('schema.config',1206,'  param_name:                   str(2000)'),('schema.config',1207,'  param_value:                  long_uni_str(16000)'),('schema.config',1208,''),('schema.config',1209,'  user_build_params_state_id:   IE (build_state_id)'),('schema.config',1210,''),('schema.config',1211,''),('schema.config',1212,'build_labels:                   table'),('schema.config',1213,''),('schema.config',1214,'  build_id:                     build_id M              refers'),('schema.config',1215,'  vcs_root_id:                  vcs_root_instance_id M  refers'),('schema.config',1216,'  label:                        str(80)'),('schema.config',1217,'  status:                       int default 0'),('schema.config',1218,'  error_message:                str(256)'),('schema.config',1219,''),('schema.config',1220,'  build_labels_pk:              PK (build_id, vcs_root_id)'),('schema.config',1221,'  build_labels_vcs_root_i:      IE (vcs_root_id)'),('schema.config',1222,''),('schema.config',1223,''),('schema.config',1224,'personal_build_relative_path:   table'),('schema.config',1225,''),('schema.config',1226,'  build_id:                     build_id           refers'),('schema.config',1227,'  original_path_hash:           long_int'),('schema.config',1228,'  relative_path:                long_str(16000)'),('schema.config',1229,''),('schema.config',1230,'  personal_build_relative_p_ak: AK (build_id, original_path_hash)'),('schema.config',1231,''),('schema.config',1232,''),('schema.config',1233,'responsibilities:               table'),('schema.config',1234,''),('schema.config',1235,'  problem_id:                   str(80) M          -- it\'s not our problem_id, it\'s something else'),('schema.config',1236,'  state:                        int M'),('schema.config',1237,'  responsible_user_id:          user_id M          refers'),('schema.config',1238,'  reporter_user_id:             user_id            refers'),('schema.config',1239,'  timestmp:                     long_int'),('schema.config',1240,'  remove_method:                int M default 0'),('schema.config',1241,'  comments:                     long_uni_str(4096)'),('schema.config',1242,''),('schema.config',1243,'  responsibilities_pk:          PK (problem_id)'),('schema.config',1244,''),('schema.config',1245,'  responsibilities_reporter:    IE (reporter_user_id)'),('schema.config',1246,'  responsibilities_assignee:    IE (responsible_user_id)'),('schema.config',1247,''),('schema.config',1248,''),('schema.config',1249,'build_state_tag:                table'),('schema.config',1250,''),('schema.config',1251,'  build_state_id:               promotion_id M     refers'),('schema.config',1252,'  tag:                          tag_phrase M'),('schema.config',1253,''),('schema.config',1254,'  build_state_tag_pk:           PK (build_state_id, tag)'),('schema.config',1255,'  build_state_tag_ie1:          IE (tag, build_state_id)'),('schema.config',1256,''),('schema.config',1257,''),('schema.config',1258,'build_state_private_tag:        table'),('schema.config',1259,''),('schema.config',1260,'  build_state_id:               promotion_id M     refers'),('schema.config',1261,'  owner:                        user_id M          refers'),('schema.config',1262,'  tag:                          tag_phrase M'),('schema.config',1263,''),('schema.config',1264,'  build_state_private_tag_pk:   PK (build_state_id, owner, tag)'),('schema.config',1265,'  build_state_private_tag_ie1:  IE (owner, build_state_id)'),('schema.config',1266,''),('schema.config',1267,''),('schema.config',1268,'build_overriden_roots:          table'),('schema.config',1269,''),('schema.config',1270,'  build_state_id:               promotion_id                refers'),('schema.config',1271,'  original_vcs_root_id:         vcs_root_instance_id M      refers'),('schema.config',1272,'  substitution_vcs_root_id:     vcs_root_instance_id M      refers'),('schema.config',1273,''),('schema.config',1274,'  build_overriden_roots_pk:     PK (build_state_id, original_vcs_root_id)'),('schema.config',1275,'  build_subst_root_index:       IE (substitution_vcs_root_id)'),('schema.config',1276,'  build_orig_root_index:        IE (original_vcs_root_id)'),('schema.config',1277,''),('schema.config',1278,''),('schema.config',1279,'user_roles:                     table'),('schema.config',1280,''),('schema.config',1281,'  user_id:                      user_id M       refers'),('schema.config',1282,'  role_id:                      user_role_id M  -- we need a dictionary of roles'),('schema.config',1283,'  project_int_id:               project_int_id  refers'),('schema.config',1284,''),('schema.config',1285,'  user_roles_ui:                AK (user_id, role_id, project_int_id)'),('schema.config',1286,''),('schema.config',1287,''),('schema.config',1288,'usergroup_roles:                table'),('schema.config',1289,''),('schema.config',1290,'  group_id:                     group_id M      refers'),('schema.config',1291,'  role_id:                      user_role_id M  -- we need a dictionary of roles'),('schema.config',1292,'  project_int_id:               project_int_id  refers'),('schema.config',1293,''),('schema.config',1294,'  usergroup_roles_ui:           AK (group_id, role_id, project_int_id)'),('schema.config',1295,''),('schema.config',1296,''),('schema.config',1297,''),('schema.config',1298,'-- INSPECTIONS AND DUPLICATES'),('schema.config',1299,''),('schema.config',1300,'inspection_info:                dictionary table'),('schema.config',1301,''),('schema.config',1302,'  id:                           inspection_id_hash M     defines'),('schema.config',1303,'  inspection_id:                inspection_id_str        defines'),('schema.config',1304,'  inspection_name:              str(255)'),('schema.config',1305,'  inspection_desc:              long_str(4000)'),('schema.config',1306,'  group_name:                   str(255)'),('schema.config',1307,''),('schema.config',1308,'  inspection_info_pk:           PK (id)                  stable'),('schema.config',1309,'  inspection_info_ak:           AK (inspection_id)       stable'),('schema.config',1310,''),('schema.config',1311,''),('schema.config',1312,'inspection_data:                dictionary table'),('schema.config',1313,''),('schema.config',1314,'  hash:                         inspection_data_hash M   defines'),('schema.config',1315,'  result:                       long_str(4000)'),('schema.config',1316,'  severity:                     int'),('schema.config',1317,'  type_pattern:                 int'),('schema.config',1318,'  fqname:                       long_str(4000)'),('schema.config',1319,'  file_name:                    str(255)'),('schema.config',1320,'  parent_fqnames:               long_str(4000)'),('schema.config',1321,'  parent_type_patterns:         str(20)'),('schema.config',1322,'  module_name:                  str(40)'),('schema.config',1323,'  inspection_id:                inspection_id_hash       refers'),('schema.config',1324,'  is_local:                     int'),('schema.config',1325,'  used:                         int M default 1'),('schema.config',1326,''),('schema.config',1327,'  inspection_data_pk:           PK (hash)                stable'),('schema.config',1328,''),('schema.config',1329,'  inspection_data_file_index:   IE (file_name)'),('schema.config',1330,'  inspection_data_insp_index:   IE (inspection_id)'),('schema.config',1331,''),('schema.config',1332,''),('schema.config',1333,'inspection_fixes:               table'),('schema.config',1334,''),('schema.config',1335,'  hash:                         inspection_data_hash M   refers'),('schema.config',1336,'  hint:                         str(255)'),('schema.config',1337,''),('schema.config',1338,'  inspection_fixes_hash_index:  IE (hash)'),('schema.config',1339,''),('schema.config',1340,''),('schema.config',1341,'inspection_results:             table'),('schema.config',1342,''),('schema.config',1343,'  build_id:                     build_id M               refers'),('schema.config',1344,'  hash:                         inspection_data_hash M   refers'),('schema.config',1345,'  line:                         int M'),('schema.config',1346,''),('schema.config',1347,'  inspection_results_hash_index:   IE (hash)'),('schema.config',1348,'  inspection_results_buildhash_i:  IE (build_id, hash)'),('schema.config',1349,''),('schema.config',1350,''),('schema.config',1351,'inspection_stats:               table'),('schema.config',1352,''),('schema.config',1353,'  build_id:                     build_id M               refers'),('schema.config',1354,'  total:                        int'),('schema.config',1355,'  new_total:                    int'),('schema.config',1356,'  old_total:                    int'),('schema.config',1357,'  errors:                       int'),('schema.config',1358,'  new_errors:                   int'),('schema.config',1359,'  old_errors:                   int'),('schema.config',1360,''),('schema.config',1361,'  inspection_stats_pk:          PK (build_id)'),('schema.config',1362,''),('schema.config',1363,''),('schema.config',1364,'inspection_diff:                table'),('schema.config',1365,''),('schema.config',1366,'  build_id:                     build_id M               refers'),('schema.config',1367,'  hash:                         inspection_data_hash M   refers'),('schema.config',1368,''),('schema.config',1369,'  inspection_diff_ak:           AK (build_id, hash)'),('schema.config',1370,''),('schema.config',1371,'  inspection_diff_hash_index:   IE (hash)'),('schema.config',1372,''),('schema.config',1373,''),('schema.config',1374,'project_files:                  dictionary table'),('schema.config',1375,''),('schema.config',1376,'  file_id:                      duplicate_file_id M serial defines'),('schema.config',1377,'  file_name:                    duplicate_file_name M'),('schema.config',1378,''),('schema.config',1379,'  project_files_pk:             PK (file_id)'),('schema.config',1380,'  project_files_ak:             AK (file_name) stable'),('schema.config',1381,''),('schema.config',1382,''),('schema.config',1383,'duplicate_results:              table'),('schema.config',1384,''),('schema.config',1385,'  id:                           duplicate_result_id M serial defines'),('schema.config',1386,'  build_id:                     build_id M refers'),('schema.config',1387,'  hash:                         duplicate_result_hash M defines'),('schema.config',1388,'  cost:                         int'),('schema.config',1389,''),('schema.config',1390,'  duplicate_results_pk:         PK (id)'),('schema.config',1391,'  duplicate_results_build_i:    IE (build_id)'),('schema.config',1392,''),('schema.config',1393,''),('schema.config',1394,'duplicate_diff:                 table'),('schema.config',1395,''),('schema.config',1396,'  build_id:                     build_id M refers'),('schema.config',1397,'  hash:                         long_int M'),('schema.config',1398,''),('schema.config',1399,'  duplicate_diff_pk:            PK (build_id, hash)'),('schema.config',1400,''),('schema.config',1401,''),('schema.config',1402,'duplicate_fragments:            table'),('schema.config',1403,''),('schema.config',1404,'  id:                           duplicate_result_id M  refers'),('schema.config',1405,'  file_id:                      duplicate_file_id   M  refers'),('schema.config',1406,'  line:                         int                 M'),('schema.config',1407,'  offset_info:                  str(100)            M'),('schema.config',1408,''),('schema.config',1409,'  duplicate_fragments_pk:       PK (id, file_id, line, offset_info)'),('schema.config',1410,'  duplicate_fragments_file_i:   IE (file_id)'),('schema.config',1411,''),('schema.config',1412,''),('schema.config',1413,'duplicate_stats:                table'),('schema.config',1414,''),('schema.config',1415,'  build_id:                     build_id M refers'),('schema.config',1416,'  total:                        int'),('schema.config',1417,'  new_total:                    int'),('schema.config',1418,'  old_total:                    int'),('schema.config',1419,''),('schema.config',1420,'  duplicate_stats_pk:           PK (build_id)'),('schema.config',1421,''),('schema.config',1422,''),('schema.config',1423,''),('schema.config',1424,''),('schema.config',1425,'-- OTHER TABLES'),('schema.config',1426,''),('schema.config',1427,'stats_publisher_state:          table'),('schema.config',1428,''),('schema.config',1429,'  metric_id:                    long_int M'),('schema.config',1430,'  value:                        long_int M'),('schema.config',1431,''),('schema.config',1432,'  stats_publisher_state_pk:     PK (metric_id)'),('schema.config',1433,''),('schema.config',1434,''),('schema.config',1435,'comments:                       table'),('schema.config',1436,''),('schema.config',1437,'  id:                           audit_comment_id M  serial defines'),('schema.config',1438,'  author_id:                    user_id             refers'),('schema.config',1439,'  when_changed:                 long_int  M'),('schema.config',1440,'  commentary:                   long_uni_str(4096)'),('schema.config',1441,''),('schema.config',1442,'  comments_pk:                  PK (id)'),('schema.config',1443,'  comments_when_changed_i:      IE (when_changed)'),('schema.config',1444,''),('schema.config',1445,''),('schema.config',1446,'action_history:                 table'),('schema.config',1447,''),('schema.config',1448,'  object_id:                    str(80)'),('schema.config',1449,'  comment_id:                   audit_comment_id    refers'),('schema.config',1450,'  action:                       int'),('schema.config',1451,'  additional_data:              str(80)'),('schema.config',1452,''),('schema.config',1453,'  action_history_comment:          IE (comment_id)'),('schema.config',1454,'  action_history_object:           IE (object_id)'),('schema.config',1455,'  action_history_action_object_i:  IE (action, object_id)'),('schema.config',1456,''),('schema.config',1457,''),('schema.config',1458,'audit_additional_object:        table'),('schema.config',1459,''),('schema.config',1460,'  comment_id:                   audit_comment_id    refers'),('schema.config',1461,'  object_index:                 int'),('schema.config',1462,'  object_id:                    str(80)'),('schema.config',1463,'  object_name:                  long_str(2500) -- is used only for deleted objects'),('schema.config',1464,''),('schema.config',1465,'  audit_a_o_comment:            IE (comment_id)'),('schema.config',1466,'  audit_a_o_object_index:       IE (object_index)'),('schema.config',1467,''),('schema.config',1468,''),('schema.config',1469,'build_set_tmp:                  table'),('schema.config',1470,''),('schema.config',1471,'  build_id:                     build_id M'),('schema.config',1472,''),('schema.config',1473,'  build_set_pk:                 PK (build_id)'),('schema.config',1474,''),('schema.config',1475,''),('schema.config',1476,'clean_checkout_enforcement:     table'),('schema.config',1477,''),('schema.config',1478,'  build_type_id:                bt_int_id M'),('schema.config',1479,'  agent_id:                     agent_id M'),('schema.config',1480,'  current_build_id:             build_id M'),('schema.config',1481,'  request_time:                 timestamp M'),('schema.config',1482,''),('schema.config',1483,'  clean_checkout_enforcement_pk: PK (build_type_id, agent_id)'),('schema.config',1484,''),('schema.config',1485,'server_statistics:              table'),('schema.config',1486,'  metric_key:                   long_int M'),('schema.config',1487,'  metric_value:                 long_int M'),('schema.config',1488,'  metric_timestamp:             long_int M'),('schema.config',1489,''),('schema.config',1490,'  metric_key_index:             IE (metric_key, metric_timestamp)'),('schema.config',1491,''),('schema.config',1492,'node_events:                    table'),('schema.config',1493,'  id:                           int M serial defines'),('schema.config',1494,'  name:                         str(64)'),('schema.config',1495,'  long_arg1:                    long_int'),('schema.config',1496,'  long_arg2:                    long_int'),('schema.config',1497,'  str_arg:                      str(255)'),('schema.config',1498,'  node_id:                      str(80)'),('schema.config',1499,'  created:                      timestamp'),('schema.config',1500,''),('schema.config',1501,'  node_events_pk:               PK (id)'),('schema.config',1502,''),('schema.config',1503,'-- SERVER HEALTH TABLES --'),('schema.config',1504,''),('schema.config',1505,'server_health_items:            table'),('schema.config',1506,''),('schema.config',1507,'  id:                           server_health_item_id M serial defines'),('schema.config',1508,'  report_id:                    str(80) M'),('schema.config',1509,'  category_id:                  str(80) M'),('schema.config',1510,'  item_id:                      str(255) M'),('schema.config',1511,''),('schema.config',1512,'  server_health_items_pk:       PK (id)'),('schema.config',1513,'  server_health_items_ie:       IE (report_id, category_id)'),('schema.config',1514,''),('schema.config',1515,'hidden_health_item:             table'),('schema.config',1516,''),('schema.config',1517,'  item_id:                      server_health_item_id M    refers'),('schema.config',1518,'  user_id:                      user_id                    refers    -- null if item is invisible for everyone'),('schema.config',1519,'  health_item_id_ie:            IE (item_id)'),('schema.config',1520,''),('schema.config',1521,''),('schema.config',1522,'-- DEPRECATED TABLES (will not be populated anymore)'),('schema.config',1523,''),('schema.config',1524,''),('schema.config',1525,'vcs_changes:                    deprecated table'),('schema.config',1526,''),('schema.config',1527,'  modification_id:              modification_id'),('schema.config',1528,'  change_name:                  str(64)'),('schema.config',1529,'  change_type:                  int'),('schema.config',1530,'  before_revision:              long_str(2048)'),('schema.config',1531,'  after_revision:               long_str(2048)'),('schema.config',1532,'  vcs_file_name:                long_str(16000)'),('schema.config',1533,'  relative_file_name:           long_str(16000)'),('schema.config',1534,''),('schema.config',1535,'  vcs_changes_index:            IE (modification_id)'),('schema.config',1536,''),('schema.config',1537,''),('schema.config',1538,'personal_vcs_changes:           deprecated table'),('schema.config',1539,''),('schema.config',1540,'  modification_id:              modification_id'),('schema.config',1541,'  change_name:                  str(64)'),('schema.config',1542,'  change_type:                  int'),('schema.config',1543,'  before_revision:              str(2048)'),('schema.config',1544,'  after_revision:               str(2048)'),('schema.config',1545,'  vcs_file_name:                long_str(16000)'),('schema.config',1546,'  relative_file_name:           long_str(16000)'),('schema.config',1547,''),('schema.config',1548,'  vcs_personal_changes_index:   IE (modification_id)'),('schema.config',1549,''),('schema.config',1550,''),('schema.config',1551,'-- TEMPORARY TABLES'),('schema.config',1552,''),('schema.config',1553,''),('schema.config',1554,'agent_pool$:                    temporary table'),('schema.config',1555,''),('schema.config',1556,'  agent_pool_id:                agent_pool_id M'),('schema.config',1557,''),('schema.config',1558,''),('schema.config',1559,'agent_type$:                    temporary table'),('schema.config',1560,''),('schema.config',1561,'  agent_type_id:                agent_type_id M'),('schema.config',1562,''),('schema.config',1563,''),('schema.config',1564,'project$:                       temporary table'),('schema.config',1565,''),('schema.config',1566,'  int_id:                       project_int_id M'),('schema.config',1567,''),('schema.config',1568,''),('schema.config',1569,'build_type$:                    temporary table'),('schema.config',1570,''),('schema.config',1571,'  build_type_id:                bt_int_id M'),('schema.config',1572,''),('schema.config',1573,''),('schema.config',1574,'vcs_root_instance$:            temporary table'),('schema.config',1575,''),('schema.config',1576,'  id:                           vcs_root_instance_id M'),('schema.config',1577,''),('schema.config',1578,''),('schema.config',1579,'modification$:                  temporary table'),('schema.config',1580,''),('schema.config',1581,'  modification_id:              modification_id M'),('schema.config',1582,''),('schema.config',1583,''),('schema.config',1584,'promotion$:                     temporary table'),('schema.config',1585,''),('schema.config',1586,'  id:                           promotion_id M   -- build_state_id in other tables'),('schema.config',1587,''),('schema.config',1588,''),('schema.config',1589,'build$:                         temporary table'),('schema.config',1590,''),('schema.config',1591,'  build_id:                     build_id M'),('schema.config',1592,''),('schema.config',1593,''),('schema.config',1594,'test$:                          temporary table'),('schema.config',1595,''),('schema.config',1596,'  test_name_id:                 test_name_hash M'),('schema.config',1597,''),('schema.config',1598,''),('schema.config',1599,'test_key$:                      temporary table'),('schema.config',1600,''),('schema.config',1601,'  test_name_id:                 test_name_hash M'),('schema.config',1602,'  test_key_pk:                  PK (test_name_id)'),('schema.config',1603,''),('schema.config',1604,''),('schema.config',1605,'problem$:                       temporary table'),('schema.config',1606,''),('schema.config',1607,'  problem_id:                   problem_id M'),('schema.config',1608,''),('schema.config',1609,''),('schema.config',1610,'branch$:                        temporary table'),('schema.config',1611,''),('schema.config',1612,'  branch_name:                  str(255) M'),('schema.config',1613,''),('schema.config',1614,''),('schema.config',1615,'audit_object_ids_to_cleanup$:   temporary table'),('schema.config',1616,''),('schema.config',1617,'  object_id:                    str(80) M'),('schema.config',1618,''),('schema.config',1619,''),('schema.config',1620,'audit_comment_ids_to_cleanup$:  temporary table'),('schema.config',1621,''),('schema.config',1622,'  comment_id:                   audit_comment_id M'),('schema.config',1623,''),('schema.config',1624,''),('schema.config',1625,'user$:                          temporary table'),('schema.config',1626,''),('schema.config',1627,'  user_id:                      user_id M'),('schema.config',1628,''),('schema.config',1629,''),('schema.config',1630,''),('schema.config',1631,'-- THE LAST TABLE'),('schema.config',1632,''),('schema.config',1633,'server:                         table'),('schema.config',1634,''),('schema.config',1635,'  server_id:                    long_int');
/*!40000 ALTER TABLE `meta_file_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_info`
--

DROP TABLE IF EXISTS `mute_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_info` (
  `mute_id` int(11) NOT NULL,
  `muting_user_id` bigint(20) NOT NULL,
  `muting_time` datetime NOT NULL,
  `muting_comment` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `scope` char(1) COLLATE utf8_bin NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `build_id` bigint(20) DEFAULT NULL,
  `unmute_when_fixed` tinyint(1) DEFAULT NULL,
  `unmute_by_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mute_id`),
  UNIQUE KEY `mute_info_ak` (`project_int_id`,`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_info`
--

LOCK TABLES `mute_info` WRITE;
/*!40000 ALTER TABLE `mute_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_info_bt`
--

DROP TABLE IF EXISTS `mute_info_bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_info_bt` (
  `mute_id` int(11) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mute_id`,`build_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_info_bt`
--

LOCK TABLES `mute_info_bt` WRITE;
/*!40000 ALTER TABLE `mute_info_bt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_info_bt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_info_problem`
--

DROP TABLE IF EXISTS `mute_info_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_info_problem` (
  `mute_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  PRIMARY KEY (`mute_id`,`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_info_problem`
--

LOCK TABLES `mute_info_problem` WRITE;
/*!40000 ALTER TABLE `mute_info_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_info_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_info_test`
--

DROP TABLE IF EXISTS `mute_info_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_info_test` (
  `mute_id` int(11) NOT NULL,
  `test_name_id` bigint(20) NOT NULL,
  PRIMARY KEY (`mute_id`,`test_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_info_test`
--

LOCK TABLES `mute_info_test` WRITE;
/*!40000 ALTER TABLE `mute_info_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_info_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_problem_in_bt`
--

DROP TABLE IF EXISTS `mute_problem_in_bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_problem_in_bt` (
  `mute_id` int(11) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `problem_id` int(11) NOT NULL,
  PRIMARY KEY (`mute_id`,`build_type_id`,`problem_id`),
  KEY `mute_problem_in_bt_ie` (`build_type_id`,`problem_id`,`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_problem_in_bt`
--

LOCK TABLES `mute_problem_in_bt` WRITE;
/*!40000 ALTER TABLE `mute_problem_in_bt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_problem_in_bt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_problem_in_proj`
--

DROP TABLE IF EXISTS `mute_problem_in_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_problem_in_proj` (
  `mute_id` int(11) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `problem_id` int(11) NOT NULL,
  PRIMARY KEY (`mute_id`,`project_int_id`,`problem_id`),
  KEY `mute_problem_in_proj_ie` (`project_int_id`,`problem_id`,`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_problem_in_proj`
--

LOCK TABLES `mute_problem_in_proj` WRITE;
/*!40000 ALTER TABLE `mute_problem_in_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_problem_in_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_test_in_bt`
--

DROP TABLE IF EXISTS `mute_test_in_bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_test_in_bt` (
  `mute_id` int(11) NOT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `test_name_id` bigint(20) NOT NULL,
  PRIMARY KEY (`mute_id`,`build_type_id`,`test_name_id`),
  KEY `mute_test_in_bt_ie` (`build_type_id`,`test_name_id`,`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_test_in_bt`
--

LOCK TABLES `mute_test_in_bt` WRITE;
/*!40000 ALTER TABLE `mute_test_in_bt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_test_in_bt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mute_test_in_proj`
--

DROP TABLE IF EXISTS `mute_test_in_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mute_test_in_proj` (
  `mute_id` int(11) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `test_name_id` bigint(20) NOT NULL,
  PRIMARY KEY (`mute_id`,`project_int_id`,`test_name_id`),
  KEY `mute_test_in_proj_ie` (`project_int_id`,`test_name_id`,`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mute_test_in_proj`
--

LOCK TABLES `mute_test_in_proj` WRITE;
/*!40000 ALTER TABLE `mute_test_in_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `mute_test_in_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_events`
--

DROP TABLE IF EXISTS `node_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_events` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `long_arg1` bigint(20) DEFAULT NULL,
  `long_arg2` bigint(20) DEFAULT NULL,
  `str_arg` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `node_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_events`
--

LOCK TABLES `node_events` WRITE;
/*!40000 ALTER TABLE `node_events` DISABLE KEYS */;
INSERT INTO `node_events` VALUES (1,'agentUnregistered',NULL,NULL,NULL,'MAIN_SERVER','2018-12-31 15:41:37'),(2,'projectConfigChanged',NULL,1,'_Root','MAIN_SERVER','2018-12-31 15:43:54'),(3,'agentUpdated',1,NULL,'51047:58658:NA:58658-md5-976ae2401a61d4cfcf6e41c041264320','MAIN_SERVER','2018-12-31 15:44:12'),(4,'agentRegistered',1,NULL,'51047:58658:NA:58658-md5-976ae2401a61d4cfcf6e41c041264320','MAIN_SERVER','2018-12-31 15:44:12'),(5,'agentUnregistered',1,NULL,NULL,'MAIN_SERVER','2018-12-31 15:44:13'),(6,'rememberMeUpdated',NULL,NULL,NULL,'MAIN_SERVER','2018-12-31 15:44:21'),(7,'agentDescriptionUpdated',1,1,NULL,'MAIN_SERVER','2018-12-31 15:49:13'),(8,'agentUpdated',1,NULL,'58658:58658:58658-md5-976ae2401a61d4cfcf6e41c041264320:58658-md5-976ae2401a61d4cfcf6e41c041264320','MAIN_SERVER','2018-12-31 15:49:13'),(9,'agentRegistered',1,NULL,'58658:58658:58658-md5-976ae2401a61d4cfcf6e41c041264320:58658-md5-976ae2401a61d4cfcf6e41c041264320','MAIN_SERVER','2018-12-31 15:49:13'),(10,'agentDescriptionUpdated',1,1,NULL,'MAIN_SERVER','2018-12-31 15:49:16');
/*!40000 ALTER TABLE `node_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_build_relative_path`
--

DROP TABLE IF EXISTS `personal_build_relative_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_build_relative_path` (
  `build_id` bigint(20) DEFAULT NULL,
  `original_path_hash` bigint(20) DEFAULT NULL,
  `relative_path` text COLLATE utf8_bin,
  UNIQUE KEY `personal_build_relative_p_ak` (`build_id`,`original_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_build_relative_path`
--

LOCK TABLES `personal_build_relative_path` WRITE;
/*!40000 ALTER TABLE `personal_build_relative_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_build_relative_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_vcs_change`
--

DROP TABLE IF EXISTS `personal_vcs_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_vcs_change` (
  `modification_id` bigint(20) NOT NULL,
  `file_num` int(11) NOT NULL,
  `vcs_file_name` varchar(2000) COLLATE utf8_bin NOT NULL,
  `vcs_file_name_hash` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `relative_file_name_pos` int(11) DEFAULT NULL,
  `relative_file_name` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `relative_file_name_hash` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `change_type` int(11) NOT NULL,
  `change_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `before_revision` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `after_revision` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`modification_id`,`file_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_vcs_change`
--

LOCK TABLES `personal_vcs_change` WRITE;
/*!40000 ALTER TABLE `personal_vcs_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_vcs_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_vcs_changes`
--

DROP TABLE IF EXISTS `personal_vcs_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_vcs_changes` (
  `modification_id` bigint(20) DEFAULT NULL,
  `change_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `change_type` int(11) DEFAULT NULL,
  `before_revision` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `after_revision` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `vcs_file_name` text COLLATE utf8_bin,
  `relative_file_name` text COLLATE utf8_bin,
  KEY `vcs_personal_changes_index` (`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_vcs_changes`
--

LOCK TABLES `personal_vcs_changes` WRITE;
/*!40000 ALTER TABLE `personal_vcs_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_vcs_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_vcs_history`
--

DROP TABLE IF EXISTS `personal_vcs_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_vcs_history` (
  `modification_id` bigint(20) NOT NULL,
  `modification_hash` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `change_date` bigint(20) NOT NULL,
  `changes_count` int(11) NOT NULL,
  `commit_changes` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `scheduled_for_deletion` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`modification_id`),
  UNIQUE KEY `personal_vcs_history_ak` (`modification_hash`),
  KEY `personal_vcs_history_user_i` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_vcs_history`
--

LOCK TABLES `personal_vcs_history` WRITE;
/*!40000 ALTER TABLE `personal_vcs_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_vcs_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `problem_id` int(11) NOT NULL,
  `problem_type` varchar(80) COLLATE utf8_bin NOT NULL,
  `problem_identity` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`problem_id`),
  UNIQUE KEY `problem_ak` (`problem_type`,`problem_identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `config_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `origin_project_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `delete_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `project_ak` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('_Root','11b985ad-2d69-4b01-a875-76f87ab7d529',NULL,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_files` (
  `file_id` bigint(20) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `project_files_ak` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_mapping`
--

DROP TABLE IF EXISTS `project_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_mapping` (
  `int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `ext_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`int_id`,`ext_id`),
  UNIQUE KEY `project_mapping_ak` (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_mapping`
--

LOCK TABLES `project_mapping` WRITE;
/*!40000 ALTER TABLE `project_mapping` DISABLE KEYS */;
INSERT INTO `project_mapping` VALUES ('_Root','_Root',1);
/*!40000 ALTER TABLE `project_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remember_me`
--

DROP TABLE IF EXISTS `remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remember_me` (
  `user_key` varchar(65) COLLATE utf8_bin NOT NULL,
  `secure` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remember_me`
--

LOCK TABLES `remember_me` WRITE;
/*!40000 ALTER TABLE `remember_me` DISABLE KEYS */;
INSERT INTO `remember_me` VALUES ('0^-42',-5839083078721326016);
/*!40000 ALTER TABLE `remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsibilities`
--

DROP TABLE IF EXISTS `responsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsibilities` (
  `problem_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `responsible_user_id` bigint(20) NOT NULL,
  `reporter_user_id` bigint(20) DEFAULT NULL,
  `timestmp` bigint(20) DEFAULT NULL,
  `remove_method` int(11) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_bin,
  PRIMARY KEY (`problem_id`),
  KEY `responsibilities_reporter` (`reporter_user_id`),
  KEY `responsibilities_assignee` (`responsible_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsibilities`
--

LOCK TABLES `responsibilities` WRITE;
/*!40000 ALTER TABLE `responsibilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running`
--

DROP TABLE IF EXISTS `running`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `running` (
  `build_id` bigint(20) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `build_type_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `build_start_time_agent` bigint(20) DEFAULT NULL,
  `build_start_time_server` bigint(20) DEFAULT NULL,
  `build_finish_time_server` bigint(20) DEFAULT NULL,
  `last_build_activity_time` bigint(20) DEFAULT NULL,
  `is_personal` int(11) DEFAULT NULL,
  `build_number` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `build_counter` bigint(20) DEFAULT NULL,
  `requestor` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `access_code` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `queued_ag_restr_type_id` int(11) DEFAULT NULL,
  `queued_ag_restr_id` int(11) DEFAULT NULL,
  `build_state_id` bigint(20) DEFAULT NULL,
  `agent_type_id` int(11) DEFAULT NULL,
  `user_status_text` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `progress_text` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `current_path_text` text COLLATE utf8_bin,
  PRIMARY KEY (`build_id`),
  KEY `running_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running`
--

LOCK TABLES `running` WRITE;
/*!40000 ALTER TABLE `running` DISABLE KEYS */;
/*!40000 ALTER TABLE `running` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `server_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1524230770480);
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_health_items`
--

DROP TABLE IF EXISTS `server_health_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_health_items` (
  `id` bigint(20) NOT NULL,
  `report_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `category_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `item_id` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_health_items_ie` (`report_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_health_items`
--

LOCK TABLES `server_health_items` WRITE;
/*!40000 ALTER TABLE `server_health_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_health_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_property`
--

DROP TABLE IF EXISTS `server_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_property` (
  `prop_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `prop_value` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`prop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_property`
--

LOCK TABLES `server_property` WRITE;
/*!40000 ALTER TABLE `server_property` DISABLE KEYS */;
INSERT INTO `server_property` VALUES ('***','8f80140d1868578ad3b346d06d25f6c10000'),('LICENSE_AGREEMENT','true');
/*!40000 ALTER TABLE `server_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_statistics`
--

DROP TABLE IF EXISTS `server_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_statistics` (
  `metric_key` bigint(20) NOT NULL,
  `metric_value` bigint(20) NOT NULL,
  `metric_timestamp` bigint(20) NOT NULL,
  KEY `metric_key_index` (`metric_key`,`metric_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_statistics`
--

LOCK TABLES `server_statistics` WRITE;
/*!40000 ALTER TABLE `server_statistics` DISABLE KEYS */;
INSERT INTO `server_statistics` VALUES (1,0,1524230959129),(2,0,1524230959129),(1,0,1546271094748),(3,3,1546271094748),(2,0,1546271094748);
/*!40000 ALTER TABLE `server_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_row`
--

DROP TABLE IF EXISTS `single_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_row` (
  `dummy_field` char(1) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_row`
--

LOCK TABLES `single_row` WRITE;
/*!40000 ALTER TABLE `single_row` DISABLE KEYS */;
INSERT INTO `single_row` VALUES ('X');
/*!40000 ALTER TABLE `single_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `build_id` bigint(20) NOT NULL,
  `test_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`build_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_publisher_state`
--

DROP TABLE IF EXISTS `stats_publisher_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_publisher_state` (
  `metric_id` bigint(20) NOT NULL,
  `value` bigint(20) NOT NULL,
  PRIMARY KEY (`metric_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_publisher_state`
--

LOCK TABLES `stats_publisher_state` WRITE;
/*!40000 ALTER TABLE `stats_publisher_state` DISABLE KEYS */;
INSERT INTO `stats_publisher_state` VALUES (-6912521911911837242,0),(-6826520637656720981,0),(-6371738409877395985,0),(-6022911269954286022,0),(-4539345364261023841,0),(-3896958621569208557,0),(-1749670243861784615,0),(-959614572394077983,0),(3014510524022395756,0),(5744866293795496522,0),(6662056484837638591,0),(8170543957031342021,0),(8605895206854366408,0),(9018439616396414058,0);
/*!40000 ALTER TABLE `stats_publisher_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_failure_rate`
--

DROP TABLE IF EXISTS `test_failure_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_failure_rate` (
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `test_name_id` bigint(20) NOT NULL,
  `success_count` int(11) DEFAULT NULL,
  `failure_count` int(11) DEFAULT NULL,
  `last_failure_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`build_type_id`,`test_name_id`),
  KEY `test_failure_rate_tn_idx` (`test_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_failure_rate`
--

LOCK TABLES `test_failure_rate` WRITE;
/*!40000 ALTER TABLE `test_failure_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_failure_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_info`
--

DROP TABLE IF EXISTS `test_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_info` (
  `build_id` bigint(20) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_name_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`build_id`,`test_id`),
  KEY `test_name_id_idx` (`test_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_info`
--

LOCK TABLES `test_info` WRITE;
/*!40000 ALTER TABLE `test_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_muted`
--

DROP TABLE IF EXISTS `test_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_muted` (
  `build_id` bigint(20) NOT NULL,
  `test_name_id` bigint(20) NOT NULL,
  `mute_id` int(11) NOT NULL,
  PRIMARY KEY (`build_id`,`test_name_id`,`mute_id`),
  KEY `test_muted_mute_id` (`mute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_muted`
--

LOCK TABLES `test_muted` WRITE;
/*!40000 ALTER TABLE `test_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_names`
--

DROP TABLE IF EXISTS `test_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_names` (
  `id` bigint(20) NOT NULL,
  `test_name` varchar(1024) COLLATE utf8_bin NOT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_num_idx` (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_names`
--

LOCK TABLES `test_names` WRITE;
/*!40000 ALTER TABLE `test_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_blocks`
--

DROP TABLE IF EXISTS `user_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_blocks` (
  `user_id` bigint(20) NOT NULL,
  `block_type` varchar(80) COLLATE utf8_bin NOT NULL,
  `state` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`,`block_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_blocks`
--

LOCK TABLES `user_blocks` WRITE;
/*!40000 ALTER TABLE `user_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_build_parameters`
--

DROP TABLE IF EXISTS `user_build_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_build_parameters` (
  `build_state_id` bigint(20) DEFAULT NULL,
  `param_name` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `param_value` text COLLATE utf8_bin,
  KEY `user_build_params_state_id` (`build_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_build_parameters`
--

LOCK TABLES `user_build_parameters` WRITE;
/*!40000 ALTER TABLE `user_build_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_build_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_build_types_order`
--

DROP TABLE IF EXISTS `user_build_types_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_build_types_order` (
  `user_id` bigint(20) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `bt_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `ordernum` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`project_int_id`,`bt_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_build_types_order`
--

LOCK TABLES `user_build_types_order` WRITE;
/*!40000 ALTER TABLE `user_build_types_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_build_types_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_data`
--

DROP TABLE IF EXISTS `user_notification_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification_data` (
  `user_id` bigint(20) NOT NULL,
  `rule_id` bigint(20) NOT NULL,
  `additional_data` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`,`rule_id`),
  KEY `user_notif_data_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_data`
--

LOCK TABLES `user_notification_data` WRITE;
/*!40000 ALTER TABLE `user_notification_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_events`
--

DROP TABLE IF EXISTS `user_notification_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification_events` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `notificator_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `events_mask` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_events_notifier` (`notificator_type`),
  KEY `notification_events_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_events`
--

LOCK TABLES `user_notification_events` WRITE;
/*!40000 ALTER TABLE `user_notification_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_projects_order`
--

DROP TABLE IF EXISTS `user_projects_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_projects_order` (
  `user_id` bigint(20) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `ordernum` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_projects_order`
--

LOCK TABLES `user_projects_order` WRITE;
/*!40000 ALTER TABLE `user_projects_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_projects_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_projects_visibility`
--

DROP TABLE IF EXISTS `user_projects_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_projects_visibility` (
  `user_id` bigint(20) NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_projects_visibility`
--

LOCK TABLES `user_projects_visibility` WRITE;
/*!40000 ALTER TABLE `user_projects_visibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_projects_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_id` bigint(20) NOT NULL,
  `prop_key` varchar(80) COLLATE utf8_bin NOT NULL,
  `prop_value` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`,`prop_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `user_roles_ui` (`user_id`,`role_id`,`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (-1000,'PROJECT_VIEWER',NULL),(1,'SYSTEM_ADMIN',NULL);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_watch_type`
--

DROP TABLE IF EXISTS `user_watch_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_watch_type` (
  `rule_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `notificator_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `watch_type` int(11) NOT NULL,
  `watch_value` varchar(80) COLLATE utf8_bin NOT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  KEY `user_watch_type_pk` (`user_id`,`notificator_type`,`watch_type`,`watch_value`),
  KEY `watch_type_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_watch_type`
--

LOCK TABLES `user_watch_type` WRITE;
/*!40000 ALTER TABLE `user_watch_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_watch_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_notification_data`
--

DROP TABLE IF EXISTS `usergroup_notification_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_notification_data` (
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `rule_id` bigint(20) NOT NULL,
  `additional_data` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`group_id`,`rule_id`),
  KEY `group_notif_data_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_notification_data`
--

LOCK TABLES `usergroup_notification_data` WRITE;
/*!40000 ALTER TABLE `usergroup_notification_data` DISABLE KEYS */;
INSERT INTO `usergroup_notification_data` VALUES ('ALL_USERS_GROUP',1,'userChangesOnly=\'true\''),('ALL_USERS_GROUP',2,'userChangesOnly=\'true\'');
/*!40000 ALTER TABLE `usergroup_notification_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_notification_events`
--

DROP TABLE IF EXISTS `usergroup_notification_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_notification_events` (
  `id` bigint(20) NOT NULL,
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `notificator_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `events_mask` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usergroup_events_notifier` (`notificator_type`),
  KEY `usergroup_events_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_notification_events`
--

LOCK TABLES `usergroup_notification_events` WRITE;
/*!40000 ALTER TABLE `usergroup_notification_events` DISABLE KEYS */;
INSERT INTO `usergroup_notification_events` VALUES (1,'ALL_USERS_GROUP','email',68),(2,'ALL_USERS_GROUP','IDE_Notificator',76),(3,'ALL_USERS_GROUP','email',512),(4,'ALL_USERS_GROUP','IDE_Notificator',512),(5,'ALL_USERS_GROUP','WindowsTray',512),(6,'ALL_USERS_GROUP','jabber',512);
/*!40000 ALTER TABLE `usergroup_notification_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_property`
--

DROP TABLE IF EXISTS `usergroup_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_property` (
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `prop_key` varchar(80) COLLATE utf8_bin NOT NULL,
  `prop_value` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`group_id`,`prop_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_property`
--

LOCK TABLES `usergroup_property` WRITE;
/*!40000 ALTER TABLE `usergroup_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_roles`
--

DROP TABLE IF EXISTS `usergroup_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_roles` (
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `role_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `project_int_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  UNIQUE KEY `usergroup_roles_ui` (`group_id`,`role_id`,`project_int_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_roles`
--

LOCK TABLES `usergroup_roles` WRITE;
/*!40000 ALTER TABLE `usergroup_roles` DISABLE KEYS */;
INSERT INTO `usergroup_roles` VALUES ('ALL_USERS_GROUP','PROJECT_DEVELOPER',NULL);
/*!40000 ALTER TABLE `usergroup_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_subgroups`
--

DROP TABLE IF EXISTS `usergroup_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_subgroups` (
  `hostgroup_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `subgroup_id` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`hostgroup_id`,`subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_subgroups`
--

LOCK TABLES `usergroup_subgroups` WRITE;
/*!40000 ALTER TABLE `usergroup_subgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_users`
--

DROP TABLE IF EXISTS `usergroup_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_users` (
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_users`
--

LOCK TABLES `usergroup_users` WRITE;
/*!40000 ALTER TABLE `usergroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_watch_type`
--

DROP TABLE IF EXISTS `usergroup_watch_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_watch_type` (
  `rule_id` bigint(20) NOT NULL,
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `notificator_type` varchar(20) COLLATE utf8_bin NOT NULL,
  `watch_type` int(11) NOT NULL,
  `watch_value` varchar(80) COLLATE utf8_bin NOT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  KEY `usergroup_watch_type_pk` (`group_id`,`notificator_type`,`watch_type`,`watch_value`),
  KEY `group_watch_type_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_watch_type`
--

LOCK TABLES `usergroup_watch_type` WRITE;
/*!40000 ALTER TABLE `usergroup_watch_type` DISABLE KEYS */;
INSERT INTO `usergroup_watch_type` VALUES (1,'ALL_USERS_GROUP','email',2,'_Root',1),(2,'ALL_USERS_GROUP','IDE_Notificator',2,'_Root',1),(3,'ALL_USERS_GROUP','email',5,'__SYSTEM_WIDE__',2),(4,'ALL_USERS_GROUP','IDE_Notificator',5,'__SYSTEM_WIDE__',2),(5,'ALL_USERS_GROUP','WindowsTray',5,'__SYSTEM_WIDE__',1),(6,'ALL_USERS_GROUP','jabber',5,'__SYSTEM_WIDE__',1);
/*!40000 ALTER TABLE `usergroup_watch_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `usergroups_ak` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES ('ALL_USERS_GROUP','All Users','Contains all TeamCity users');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(60) COLLATE utf8_bin NOT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `last_login_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_ak` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','TmQFqFQ7J07gtNWz:9f317b609647e94570c46719077bca0d',NULL,NULL,1524485540816);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_change`
--

DROP TABLE IF EXISTS `vcs_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_change` (
  `modification_id` bigint(20) NOT NULL,
  `file_num` int(11) NOT NULL,
  `vcs_file_name` varchar(2000) COLLATE utf8_bin NOT NULL,
  `vcs_file_name_hash` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `relative_file_name_pos` int(11) DEFAULT NULL,
  `relative_file_name` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `relative_file_name_hash` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `change_type` int(11) NOT NULL,
  `change_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `before_revision` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `after_revision` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`modification_id`,`file_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_change`
--

LOCK TABLES `vcs_change` WRITE;
/*!40000 ALTER TABLE `vcs_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_change_attrs`
--

DROP TABLE IF EXISTS `vcs_change_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_change_attrs` (
  `modification_id` bigint(20) NOT NULL,
  `attr_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `attr_value` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`modification_id`,`attr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_change_attrs`
--

LOCK TABLES `vcs_change_attrs` WRITE;
/*!40000 ALTER TABLE `vcs_change_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_change_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_changes`
--

DROP TABLE IF EXISTS `vcs_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_changes` (
  `modification_id` bigint(20) DEFAULT NULL,
  `change_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `change_type` int(11) DEFAULT NULL,
  `before_revision` text COLLATE utf8_bin,
  `after_revision` text COLLATE utf8_bin,
  `vcs_file_name` text COLLATE utf8_bin,
  `relative_file_name` text COLLATE utf8_bin,
  KEY `vcs_changes_index` (`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_changes`
--

LOCK TABLES `vcs_changes` WRITE;
/*!40000 ALTER TABLE `vcs_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_changes_graph`
--

DROP TABLE IF EXISTS `vcs_changes_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_changes_graph` (
  `child_modification_id` bigint(20) NOT NULL,
  `child_revision` varchar(200) COLLATE utf8_bin NOT NULL,
  `parent_num` int(11) NOT NULL,
  `parent_modification_id` bigint(20) DEFAULT NULL,
  `parent_revision` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`child_modification_id`,`parent_num`),
  KEY `vcs_changes_graph_parent_i` (`parent_modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_changes_graph`
--

LOCK TABLES `vcs_changes_graph` WRITE;
/*!40000 ALTER TABLE `vcs_changes_graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_changes_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_history`
--

DROP TABLE IF EXISTS `vcs_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_history` (
  `modification_id` bigint(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `change_date` bigint(20) DEFAULT NULL,
  `register_date` bigint(20) DEFAULT NULL,
  `vcs_root_id` int(11) DEFAULT NULL,
  `changes_count` int(11) DEFAULT NULL,
  `version` varchar(200) COLLATE utf8_bin NOT NULL,
  `display_version` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`modification_id`),
  KEY `vcs_history_user` (`user_name`),
  KEY `vcs_history_date_i` (`register_date`),
  KEY `vcs_version_in_root_i` (`vcs_root_id`,`version`),
  KEY `vcs_history_root_id_mod_id_i` (`vcs_root_id`,`modification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_history`
--

LOCK TABLES `vcs_history` WRITE;
/*!40000 ALTER TABLE `vcs_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_root`
--

DROP TABLE IF EXISTS `vcs_root`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_root` (
  `int_id` int(11) NOT NULL,
  `config_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `origin_project_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `delete_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`int_id`),
  UNIQUE KEY `vcs_root_ak` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_root`
--

LOCK TABLES `vcs_root` WRITE;
/*!40000 ALTER TABLE `vcs_root` DISABLE KEYS */;
INSERT INTO `vcs_root` VALUES (-1,'00000000-0000-4000-8000-000000000000',NULL,NULL);
/*!40000 ALTER TABLE `vcs_root` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_root_first_revision`
--

DROP TABLE IF EXISTS `vcs_root_first_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_root_first_revision` (
  `build_type_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `parent_root_id` int(11) NOT NULL,
  `settings_hash` bigint(20) NOT NULL,
  `vcs_revision` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`build_type_id`,`parent_root_id`,`settings_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_root_first_revision`
--

LOCK TABLES `vcs_root_first_revision` WRITE;
/*!40000 ALTER TABLE `vcs_root_first_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_root_first_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_root_instance`
--

DROP TABLE IF EXISTS `vcs_root_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_root_instance` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `settings_hash` bigint(20) NOT NULL,
  `body` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `vcs_root_instance_parent_idx` (`parent_id`),
  KEY `vcs_root_instance_hash_idx` (`settings_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_root_instance`
--

LOCK TABLES `vcs_root_instance` WRITE;
/*!40000 ALTER TABLE `vcs_root_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcs_root_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_root_mapping`
--

DROP TABLE IF EXISTS `vcs_root_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_root_mapping` (
  `int_id` int(11) NOT NULL,
  `ext_id` varchar(80) COLLATE utf8_bin NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`int_id`,`ext_id`),
  UNIQUE KEY `vcs_root_mapping_ak` (`ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_root_mapping`
--

LOCK TABLES `vcs_root_mapping` WRITE;
/*!40000 ALTER TABLE `vcs_root_mapping` DISABLE KEYS */;
INSERT INTO `vcs_root_mapping` VALUES (-1,'_deleted_vcs_root',1);
/*!40000 ALTER TABLE `vcs_root_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcs_username`
--

DROP TABLE IF EXISTS `vcs_username`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcs_username` (
  `user_id` bigint(20) NOT NULL,
  `vcs_name` varchar(60) COLLATE utf8_bin NOT NULL,
  `parent_vcs_root_id` int(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`,`vcs_name`,`parent_vcs_root_id`,`order_num`),
  UNIQUE KEY `vcs_username_ak` (`user_id`,`vcs_name`,`parent_vcs_root_id`,`username`),
  KEY `vcs_username_user_ie` (`vcs_name`,`parent_vcs_root_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcs_username`
--

LOCK TABLES `vcs_username` WRITE;
/*!40000 ALTER TABLE `vcs_username` DISABLE KEYS */;
INSERT INTO `vcs_username` VALUES (1,'anyVcs',-1,0,'admin');
/*!40000 ALTER TABLE `vcs_username` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-31 15:54:21
