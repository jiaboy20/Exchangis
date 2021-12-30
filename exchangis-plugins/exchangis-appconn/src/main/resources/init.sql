
delete from  `dss_application`  WHERE `name` ='exchangis';
INSERT  INTO  `dss_application`(`name`,`url`,`is_user_need_init`,`level`,`user_init_url`,`exists_project_service`,`project_url`,`enhance_json`,`if_iframe`,`homepage_url`,`redirect_url`) VALUES ('exchangis','',0,1,NULL,0,'','{\"watermark\":false,\"rsDownload\":true}',1,'',NULL);

UPDATE `dss_application` SET url = 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT' WHERE `name` ='exchangis';
UPDATE `dss_application` SET project_url = 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/dss/exchangis/',homepage_url = 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/dss/exchangis/' WHERE `name` in('exchangis');

select @dss_exchangis_applicationId:=id from `dss_application` WHERE `name` ='exchangis';

delete from  `dss_menu` WHERE `name` ='exchangis';
INSERT  INTO `dss_menu`(`name`,`level`,`upper_menu_id`,`front_name`,`comment`,`description`,`is_active`,`is_component`,`icon`,`application_id`) values ('exchangis','2',4,'数据交换(exchangis)',NULL,NULL,1,1,NULL,@dss_exchangis_applicationId);

delete from  `dss_onestop_menu_application`  WHERE  title_en='exchangis';
INSERT INTO  `dss_onestop_menu_application` (`application_id`, `onestop_menu_id`, `title_en`, `title_cn`, `desc_en`, `desc_cn`, `labels_en`, `labels_cn`, `is_active`, `access_button_en`, `access_button_cn`, `manual_button_en`, `manual_button_cn`, `manual_button_url`, `icon`, `order`, `create_by`, `create_time`, `last_update_time`, `last_update_user`, `image`) VALUES(@dss_exchangis_applicationId,'6','exchangis','exchangis','Exchangis','Exchangis是一个轻量级的、高扩展性的数据交换平台，支持对结构化及无结构化的异构数据源之间的数据传输，在应用层上具有数据权限管控、节点服务高可用和多租户资源隔离等业务特性，而在数据层上又具有传输架构多样化、模块插件化和组件低耦合等架构特点。','user manual','生产,运维','1','enter Exchangis','进入Exchangis','user manual','用户手册','http://127.0.0.1:8088/wiki/scriptis/manual/workspace_cn.html','shujujiaohuan-logo',NULL,NULL,NULL,NULL,NULL,'shujujiaohuan-icon');


delete from  `dss_appconn` where `appconn_name`='exchangis';
INSERT INTO `dss_appconn` (`appconn_name`, `is_user_need_init`, `level`, `if_iframe`, `is_external`, `reference`, `class_name`, `appconn_class_path`, `resource`) VALUES ('exchangis', 0, 1, NULL, 0, NULL, 'com.webank.wedatasphere.exchangis.appconn.ExchangisAppConn', 'DSS_INSTALL_HOME_VAL/dss-appconns/exchangis/lib', '');

select @dss_appconn_exchangisId:=id from `dss_appconn` where `appconn_name` = 'exchangis';

delete from `dss_appconn_instance` where `homepage_url` like '%exchangis%';
INSERT INTO `dss_appconn_instance` (`appconn_id`, `label`, `url`, `enhance_json`, `homepage_url`, `redirect_url`) VALUES (@dss_appconn_exchangisId, 'DEV', 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/', '', 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/dss/exchangis/', 'http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/');


delete from `dss_workflow_node`  where `node_type` like '%exchangis%';
insert into `dss_workflow_node` (`name`, `appconn_name`, `node_type`, `jump_url`, `support_jump`, `submit_to_scheduler`, `enable_copy`, `should_creation_before_node`, `icon`) values('sqoop','exchangis','wds.dss.appconn.exchangis.sqoop','http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/dss/exchangis/#/childJobManagement','1','1','0','1','<?xml version="1.0" encoding="UTF-8"?><svg width="22" height="22" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="a"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="c"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="e"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="g"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="i"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="k"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="m"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="o"/><path id="q" d="M0,0H16.9V7.5H0z"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="s"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="u"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="w"/><path d="M16.9,0V2.4c0,2.1-3.8,3.8-8.5,3.8C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8" id="y"/><path id="A" d="M0,0H8.9V11.9H0z"/><path d="M0.3,0.1V1.3c0,0,0-0.1,0-0.1V0c0,0,0,0.1,0,0.1" id="C"/></defs><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><path d="M0,0H22V22H0z"/><g transform="translate(1,0)"><g transform="translate(0,9.65)"><path d="M8.4,0c4.7,0,8.5,1.7,8.5,3.8S13.1,7.6,8.4,7.6C3.8,7.6,0,5.9,0,3.8S3.8,0,8.4,0" fill="#8DA4B7"/><g transform="translate(0,3.78)"><mask id="b" fill="#fff"><use xlink:href="#a"/></mask><path d="M16.9,0V2.4c0,0.1-0.1,0.2-0.1,0.4V0.4C16.8,0.3,16.9,0.1,16.9,0" fill="#B5C4D1" mask="url(#b)"/><mask id="d" fill="#fff"><use xlink:href="#c"/></mask><path d="M16.8,0.4V2.8c0,0.1-0.1,0.2-0.1,0.4V0.8c0-0.2,0.1-0.3,0.1-0.4" fill="#B8C6D2" mask="url(#d)"/><mask id="f" fill="#fff"><use xlink:href="#e"/></mask><path d="M16.7,0.8V3.2C16.6,3.3,16.5,3.5,16.4,3.7V1.3C16.5,1.1,16.6,0.9,16.7,0.8" fill="#BAC8D4" mask="url(#f)"/><mask id="h" fill="#fff"><use xlink:href="#g"/></mask><path d="M16.4,1.3V3.7c-1.2,1.4-4.3,2.5-8,2.5C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8c3.7,0,6.8-1.1,8-2.5" fill="#BDCAD5" mask="url(#h)"/></g></g><g transform="translate(0,4.83)"><path d="M8.4,0c4.7,0,8.5,1.7,8.5,3.8S13.1,7.5,8.4,7.5C3.8,7.5,0,5.9,0,3.8S3.8,0,8.4,0" fill="#8DA4B7"/><g transform="translate(0,3.77)"><mask id="j" fill="#fff"><use xlink:href="#i"/></mask><path d="M16.9,0V2.4c0,0.1-0.1,0.2-0.1,0.4V0.4C16.8,0.3,16.9,0.1,16.9,0" fill="#B5C4D1" mask="url(#j)"/><mask id="l" fill="#fff"><use xlink:href="#k"/></mask><path d="M16.8,0.4V2.8c0,0.1-0.1,0.2-0.1,0.4V0.8c0-0.2,0.1-0.3,0.1-0.4" fill="#B8C6D2" mask="url(#l)"/><mask id="n" fill="#fff"><use xlink:href="#m"/></mask><path d="M16.7,0.8V3.2C16.6,3.3,16.5,3.5,16.4,3.7V1.3C16.5,1.1,16.6,0.9,16.7,0.8" fill="#BAC8D4" mask="url(#n)"/><mask id="p" fill="#fff"><use xlink:href="#o"/></mask><path d="M16.4,1.3V3.7c-1.2,1.4-4.3,2.5-8,2.5C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8c3.7,0,6.8-1.1,8-2.5" fill="#BDCAD5" mask="url(#p)"/></g></g><g><mask id="r" fill="#fff"><use xlink:href="#q"/></mask><path d="M8.4,0c4.7,0,8.5,1.7,8.5,3.8S13.1,7.5,8.4,7.5C3.8,7.5,0,5.9,0,3.8S3.8,0,8.4,0" fill="#8DA4B7" mask="url(#r)"/></g><g transform="translate(0,3.77)"><mask id="t" fill="#fff"><use xlink:href="#s"/></mask><path d="M16.9,0V2.4c0,0.1-0.1,0.2-0.1,0.4V0.4C16.8,0.3,16.9,0.1,16.9,0" fill="#B5C4D1" mask="url(#t)"/><mask id="v" fill="#fff"><use xlink:href="#u"/></mask><path d="M16.8,0.4V2.8c0,0.1-0.1,0.2-0.1,0.4V0.8c0-0.2,0.1-0.3,0.1-0.4" fill="#B8C6D2" mask="url(#v)"/><mask id="x" fill="#fff"><use xlink:href="#w"/></mask><path d="M16.7,0.8V3.2C16.6,3.3,16.5,3.5,16.4,3.7V1.3C16.5,1.1,16.6,0.9,16.7,0.8" fill="#BAC8D4" mask="url(#x)"/><mask id="z" fill="#fff"><use xlink:href="#y"/></mask><path d="M16.4,1.3V3.7c-1.2,1.4-4.3,2.5-8,2.5C3.8,6.2,0,4.5,0,2.4V0C0,2.1,3.8,3.8,8.4,3.8c3.7,0,6.8-1.1,8-2.5" fill="#BDCAD5" mask="url(#z)"/></g><path d="M19.3,17.4c0,0,0,0,0,0c0-0.1,0-0.2,0-0.3c0,0,0,0,0,0c0-0.1,0-0.1,0-0.1c-0.1,0-0.1-0.1-0.1-0.1c0-0.1,0-0.1,0-0.2c0,0,0,0,0,0c0-0.1-0.1-0.1-0.1-0.1s0-0.1,0-0.1C19.1,16.4,19,16.4,19,16.4c0-0.1,0-0.1-0.1-0.2c0,0,0,0,0,0c0-0.1-0.1-0.1-0.1-0.1C18.8,16,18.7,16,18.7,16C18.6,15.9,18.6,15.8,18.5,15.7c0,0-0.1,0-0.1,0C18.3,15.6,18.2,15.6,18.1,15.5c0,0-0.1-0.1-0.1-0.1c-0.1,0-0.1,0-0.2-0.1c0,0-0.1,0-0.1,0C17.5,15.2,17.3,15.1,17.1,15.1C17,15,16.9,15,16.8,15S16.7,14.9,16.7,14.9s0,0,0,0c-0.1,0-0.2,0-0.3,0C16.3,14.8,16.3,14.8,16.2,14.8S15.9,14.7,15.8,14.7c-0.2,0-0.4-0.1-0.6-0.1C15.1,14.5,15.1,14.5,15,14.5s-0.1,0-0.2-0.1c-0.1,0-0.1,0-0.2-0.1c0,0-0.1,0-0.1,0c-0.1,0-0.1,0-0.1,0C14.3,14.2,14.2,14.2,14.1,14.1c0,0,0,0-0.1-0.1c0,0-0.1-0.1-0.1-0.1c0.3-0.4,0.8-0.7,1.6-0.7c1.3,0,2,0.6,2.2,1.7l1.4-0.3V13.3C19,13.3,19,13.3,19,13.2s0-0.3-0.1-0.4c0,0,0,0,0,0c0-0.1,0-0.1,0-0.1C18.8,12.6,18.8,12.5,18.8,12.4c-0.1,0-0.1,0-0.1-0.1c0,0-0.1-0.1-0.1-0.1c0-0.1-0.1-0.1-0.1-0.2c0,0-0.1,0-0.1,0C18.3,11.9,18.3,11.8,18.2,11.7S18.1,11.6,18,11.5c-0.1,0-0.2-0.1-0.4-0.2c0,0,0,0-0.1-0.1c0,0,0,0,0,0c-0.1,0-0.2,0-0.3-0.1C17.1,11.1,17,11.1,17,11c-0.1,0-0.1,0-0.1,0c-0.1,0-0.1,0-0.2,0S16.5,10.9,16.4,10.9c0,0-0.1,0-0.1,0c-0.1,0-0.2,0-0.3,0s-0.2,0-0.3,0c0,0-0.1,0-0.2,0c0,0,0,0-0.1,0c0,0-0.1,0-0.2,0s-0.2,0-0.3,0s-0.2,0-0.3,0c0,0,0,0-0.1,0C14.4,11,14.3,11,14.2,11c0,0-0.1,0-0.1,0.1c0,0,0,0,0,0c-0.2,0-0.3,0-0.4,0.1c-0.1,0-0.1,0-0.1,0s-0.1,0.1-0.1,0.1c-0.1,0-0.2,0.1-0.2,0.1s-0.1,0-0.1,0C13.1,11.5,13,11.6,13,11.6c-0.1,0.1-0.1,0.1-0.2,0.2S12.7,11.9,12.6,12c0,0.1-0.1,0.1-0.1,0.2s-0.1,0.2-0.1,0.3s-0.1,0.1-0.1,0.2S12.2,13,12.2,13.2c0,0.1,0,0.2,0,0.3v1.2c0-0.1,0-0.2,0-0.2c-0.1,1.2,0.8,2,2.8,2.5c0,0,0.1,0,0.2,0c0.4,0.1,0.7,0.2,0.8,0.2c0.8,0.3,1.4,0.6,1.6,0.9c0,0.1,0,0.1,0,0.1c0,0.1,0,0.1-0.1,0.1c0,0.1,0,0.1-0.1,0.2c0,0,0,0-0.1,0.1c0,0-0.1,0.1-0.1,0.1c-0.1,0-0.2,0.1-0.2,0.1s-0.1,0-0.1,0c-0.1,0.1-0.2,0.1-0.3,0.1c0,0,0,0-0.1,0.1c0,0-0.1,0-0.2,0s-0.1,0-0.2,0s-0.2,0-0.4,0c-0.1,0-0.3,0-0.4,0s-0.1,0-0.1,0c-0.1,0-0.3,0-0.4-0.1c-0.1,0-0.1,0-0.2,0c0-0.1-0.1-0.1-0.2-0.1C14.3,18.7,14.2,18.7,14.2,18.6c-0.1,0-0.1,0-0.2-0.1S13.8,18.3,13.8,18.2c-0.1,0-0.1,0-0.1,0s0,0,0,0C13.6,18.1,13.6,18,13.5,17.9c0-0.1,0-0.1,0-0.1C13.4,17.7,13.4,17.6,13.4,17.5S13.3,17.4,13.3,17.3s0-0.2-0.1-0.4l-1.4,0.3v1.2c0.4,1.9,1.7,2.9,3.8,2.9c0.1,0,0.1,0,0.2,0c2.3-0.1,3.4-0.9,3.5-2.6c0-0.1,0-0.1,0-0.2c0,0,0,0.1,0,0.2V17.4z" fill="#FFF"/><g transform="translate(11.11,10.15)"><mask id="B" fill="#fff"><use xlink:href="#A"/></mask><path d="M3.9,8.1c0.1,0,0.2,0,0.3,0.1c0.2,0,0.3,0,0.4,0s0.2,0,0.3,0H5.1C5.1,8.1,5.2,8.1,5.3,8.1c0,0,0.1,0,0.2,0C5.3,8,5,7.9,4.7,7.8L4.6,7.7c0,0-0.2,0-0.6-0.1C3.9,7.6,3.9,7.5,3.8,7.5H3.7C3.5,7.5,3.2,7.4,3,7.4C3.1,7.5,3.1,7.5,3.2,7.6S3.3,7.8,3.4,7.8L3.5,7.9C3.5,7.9,3.6,8,3.6,8C3.7,8,3.7,8,3.8,8L3.9,8.1zM1.4,8.2c0.3,1.5,1.3,2.2,3.1,2.2H4.6c2.5,0,2.8-1,2.9-1.8c0-0.1,0-0.1,0-0.1V7.3c0-0.1,0-0.2,0-0.2L8.1,6.9,7.4,7c0-0.1,0-0.2,0-0.2V6.7C7.3,6.7,7.3,6.7,7.3,6.6c0,0,0-0.1-0.1-0.1L7.1,6.3C7,6.3,7,6.2,6.9,6.2C6.8,6.1,6.7,6,6.6,6L6.5,5.9C6.4,5.9,6.4,5.8,6.4,5.8s-0.1,0-0.1,0C6.1,5.7,6,5.6,5.8,5.6L5.1,5.4V4.7L5,5.4,4.5,5.2C4.3,5.2,4.1,5.2,3.9,5.1C3.8,5.1,3.7,5.1,3.6,5H3.5C3.4,4.9,3.3,4.9,3.2,4.9L3.4,4.2,3.2,4.8c-0.1,0-0.1,0-0.2,0C2.8,4.7,2.7,4.6,2.6,4.5c0,0-0.1,0-0.1-0.1C2.4,4.4,2.3,4.3,2.2,4.2L1.9,3.8,2.2,3.3C2.6,2.7,3.3,2.4,4.4,2.4c1.3,0,2.2,0.5,2.7,1.5L7.2,3.8V3.2C7.2,3.1,7.2,3,7.1,2.9V2.7C7,2.7,7,2.7,7,2.6V2.5C6.9,2.5,6.9,2.5,6.9,2.4L6.8,2.3c0,0,0,0,0,0C6.7,2.2,6.6,2.1,6.6,2.1C6.5,2,6.5,2,6.5,2C6.4,1.9,6.3,1.9,6.2,1.8L6.1,1.7C6,1.7,6,1.7,5.9,1.7L5.3,1.5c0,0-0.1,0-0.1,0s-0.1,0-0.1,0C5,1.5,5,1.5,4.9,1.5L4.7,1.4c0,0-0.1,0-0.1,0c-0.1,0-0.1,0-0.2,0s-0.2,0-0.3,0c0,0,0,0-0.1,0.1H3.9c-0.1,0-0.2,0-0.3,0S3.4,1.6,3.3,1.6H3.2L3,0.9,3.1,1.6C3,1.6,2.9,1.7,2.8,1.7L2.6,1.8C2.5,1.9,2.5,1.9,2.5,1.9C2.4,1.9,2.4,2,2.3,2C2.3,2.1,2.2,2.1,2.2,2.1C2.2,2.2,2.1,2.2,2.1,2.3V2.4C2,2.5,2,2.5,1.9,2.6V2.7C1.8,2.9,1.8,3,1.8,3.1s0,0.2,0,0.2V4.4c0,0,0,0.1,0,0.1C1.8,4.9,2,5.7,4,6.1c0.1,0,0.2,0,0.3,0.1C4.8,6.3,5,6.4,5.1,6.4c1,0.3,1.7,0.7,2,1.2L7.3,7.9,7.2,8.3c0,0-0.1,0.1-0.1,0.1c0,0.1,0,0.1-0.1,0.2C7,8.7,6.9,8.7,6.8,8.8C6.8,8.9,6.7,8.9,6.7,9C6.6,9,6.5,9.1,6.4,9.1C6.4,9.2,6.3,9.2,6.2,9.3H6.1C6,9.4,5.8,9.4,5.7,9.5H5.6c-0.1,0-0.2,0-0.3,0.1c-0.1,0-0.2,0-0.2,0c-0.2,0-0.3,0-0.5,0S4.2,9.6,4,9.6C3.8,9.5,3.6,9.5,3.5,9.5C3.4,9.4,3.4,9.4,3.3,9.4C3.2,9.3,3.1,9.3,3,9.3C2.9,9.2,2.7,9.1,2.6,9C2.6,9,2.5,9,2.5,8.9C2.3,8.8,2.2,8.7,2.1,8.6L2,8.4C1.9,8.3,1.8,8.2,1.8,8L1.7,7.9C1.7,7.8,1.6,7.7,1.6,7.6H1.4V8.2zM2.1,0.5c0,0,0.1,0,0.1-0.1H2.3C2.4,0.3,2.6,0.3,2.7,0.2c0.1,0,0.2,0,0.2,0C3,0.2,3.2,0.1,3.3,0.1H3.4c0.1,0,0.2,0,0.3,0L3.8,0C3.9,0,4,0,4,0C4.1,0,4.2,0,4.3,0C4.5,0,4.6,0,4.6,0C4.7,0,4.8,0,4.9,0C5.1,0,5.2,0,5.3,0.1c0,0,0,0,0.1,0s0.2,0,0.2,0H5.7C5.8,0.2,5.9,0.2,6,0.2S6.2,0.3,6.2,0.3H6.4C6.5,0.4,6.6,0.4,6.7,0.4C6.8,0.5,6.8,0.5,6.9,0.6C7,0.6,7.2,0.7,7.3,0.8S7.4,0.9,7.5,1S7.8,1.2,7.9,1.4c0,0,0,0,0.1,0.1c0,0,0,0.1,0,0.1C8.1,1.7,8.2,1.8,8.2,1.8C8.2,1.9,8.3,1.9,8.3,2c0,0,0,0.1,0.1,0.2V2.3c0,0,0,0,0.1,0.1c0,0.2,0.1,0.3,0.1,0.5L8.7,3.2V5L7.9,5.1C8,5.2,8.1,5.3,8.1,5.3c0,0.1,0.1,0.1,0.1,0.1C8.3,5.5,8.3,5.5,8.3,5.6L8.4,5.7C8.5,5.8,8.5,5.8,8.5,5.9c0,0,0.1,0,0.1,0.1c0,0,0.1,0.1,0.1,0.2V6.3C8.8,6.4,8.8,6.5,8.8,6.6L8.9,6.9c0,0.1,0,0.2,0,0.3V8.5c0,0.1,0,0.1,0,0.1C8.8,10.1,8.1,11.8,4.7,11.9H4.5C1.3,11.9,0.3,10,0,8.4V6.5L1,6.2C0.5,5.7,0.4,5.1,0.4,4.5V3.3c0-0.1,0-0.2,0-0.3c0-0.2,0-0.4,0.1-0.7c0,0,0.1-0.1,0.1-0.2S0.7,1.8,0.8,1.7C0.8,1.6,0.9,1.6,0.9,1.5C1,1.4,1.1,1.3,1.2,1.1C1.2,1.1,1.3,1,1.4,1C1.5,0.9,1.6,0.8,1.7,0.7c0,0,0.1,0,0.1-0.1c0.1,0,0.1,0,0.2-0.1H2.1z" fill="#FFF" mask="url(#B)"/></g><path d="M17.7,17.4v1.2c0,0,0,0,0,0.1V17.5c0-0.1,0-0.1,0-0.1" fill="#BDCAD5"/><g transform="translate(17.38,17.36)"><mask id="D" fill="#fff"><use xlink:href="#C"/></mask><path d="M0.3,1.3V0.1c0,0,0-0.1,0-0.1V1.2c0,0,0,0.1,0,0.1" fill="#BDCAD5" mask="url(#D)"/></g><g transform="translate(11.95,11.03)"><path d="M5.7,6.9C5.6,7,5.6,7,5.6,7.1c0,0-0.1,0.1-0.1,0.1C5.5,7.3,5.4,7.3,5.4,7.4c0,0-0.1,0-0.1,0.1c0,0-0.1,0-0.1,0.1C5.1,7.6,5.1,7.6,5,7.7c0,0-0.1,0-0.1,0C4.8,7.7,4.7,7.8,4.6,7.8c0,0,0,0,0,0C4.5,7.8,4.4,7.9,4.3,7.9s-0.1,0-0.2,0s-0.2,0-0.3,0c-0.2,0-0.3,0-0.5,0c0,0,0,0,0,0C3.1,7.9,3,7.8,2.9,7.8S2.8,7.8,2.7,7.7C2.6,7.7,2.6,7.7,2.5,7.6C2.4,7.6,2.3,7.5,2.3,7.5C2.2,7.5,2.2,7.4,2.1,7.4C2,7.3,1.9,7.2,1.9,7.1c0,0-0.1,0-0.1,0s0,0,0,0C1.8,7,1.7,6.9,1.6,6.8c0-0.1,0-0.1,0-0.1C1.6,6.6,1.5,6.5,1.5,6.4s0-0.1,0-0.1C1.4,6.1,1.4,6,1.4,5.8L0,6.1V7.3L1.4,7c0,0.2,0,0.3,0,0.4c0,0,0,0,0.1,0.1c0,0,0,0,0,0.1c0,0,0,0.1,0,0.1c0,0.1,0.1,0.1,0.1,0.2c0,0,0,0,0,0.1c0,0,0,0,0,0C1.7,8.1,1.8,8.2,1.8,8.3c0,0,0,0,0,0s0,0,0,0s0.1,0,0.1,0C1.9,8.4,2,8.5,2.1,8.6c0.1,0,0.1,0.1,0.2,0.1c0,0,0.1,0.1,0.2,0.1c0,0,0,0.1,0,0.1c0.1,0,0.2,0,0.2,0C2.8,8.9,2.8,9,2.9,9c0,0,0,0,0,0C3,9,3.1,9.1,3.3,9.1c0,0,0,0,0,0s0,0,0,0c0.1,0,0.3,0,0.4,0c0,0,0.1,0,0.1,0c0.1,0,0.1,0,0.2,0s0.1,0,0.1,0c0.1,0,0.1,0,0.2,0c0,0,0.1,0,0.1,0S4.5,9,4.6,9c0,0,0,0,0,0S4.7,9,4.7,9S4.8,8.9,4.9,8.9c0,0,0,0,0,0S5,8.9,5,8.9C5,8.8,5.1,8.8,5.1,8.8s0,0,0.1,0C5.2,8.7,5.3,8.7,5.3,8.7C5.3,8.6,5.4,8.6,5.4,8.6C5.4,8.5,5.5,8.5,5.5,8.4c0,0,0.1-0.1,0.1-0.1c0-0.1,0-0.1,0.1-0.2c0,0,0-0.1,0-0.1C5.7,7.9,5.8,7.8,5.8,7.7V6.5C5.8,6.6,5.7,6.7,5.7,6.8c0,0,0,0.1,0,0.1" fill="#BDCAD5"/><path d="M7.2,6.3c0-0.1,0-0.2,0-0.2C7.2,6,7.2,6,7.2,6s0-0.1,0-0.1s0,0,0-0.1C7.1,5.8,7.1,5.7,7.1,5.6c0,0,0,0,0,0s0,0,0,0C7.1,5.5,7,5.5,7,5.4c0,0,0,0,0-0.1C6.9,5.3,6.9,5.2,6.9,5.2S6.8,5.1,6.8,5.1S6.8,5.1,6.7,5c0,0,0,0,0-0.1C6.6,4.9,6.5,4.8,6.4,4.7c0,0,0,0,0,0C6.3,4.6,6.2,4.5,6.1,4.5C6,4.4,6,4.4,5.9,4.4C5.9,4.4,5.8,4.3,5.8,4.3c-0.1,0-0.1,0-0.1,0C5.5,4.2,5.3,4.1,5.1,4.1C5,4,4.9,4,4.8,4C4.8,4,4.7,4,4.7,3.9c0,0,0,0,0,0c-0.1,0-0.2,0-0.3,0C4.4,3.8,4.3,3.8,4.3,3.8C4.1,3.8,4,3.7,3.8,3.7S3.4,3.6,3.3,3.6S3.1,3.5,3,3.5c0,0-0.1,0-0.1,0C2.8,3.4,2.7,3.4,2.7,3.4C2.6,3.4,2.6,3.3,2.6,3.3c-0.1,0-0.1,0-0.1,0C2.4,3.2,2.3,3.2,2.2,3.1c0,0,0,0-0.1,0C2.1,3,2,3,2,2.9c0,0-0.1,0-0.1-0.1c0,0,0,0,0,0C1.9,2.7,1.8,2.7,1.8,2.6c0,0,0,0,0,0s0-0.1,0-0.2V3.6c0,0,0,0.1,0,0.1s0,0.1,0,0.1s0,0,0,0s0,0,0,0s0,0,0,0.1c0,0,0,0,0,0C1.9,4,1.9,4,1.9,4s0,0,0,0s0,0.1,0,0.1S2,4.1,2,4.1C2,4.2,2.1,4.2,2.1,4.3c0.1,0,0.1,0,0.1,0C2.3,4.4,2.4,4.4,2.5,4.5c0,0,0,0,0,0s0,0,0.1,0c0,0,0,0.1,0.1,0.1c0,0,0.1,0,0.2,0.1c0,0,0.1,0,0.1,0c0.1,0,0.2,0,0.2,0.1c0,0,0.1,0,0.1,0c0.1,0,0.3,0.1,0.5,0.1S4.1,5,4.3,5c0,0,0.1,0,0.1,0.1c0.1,0,0.2,0,0.3,0c0,0,0,0,0.1,0.1c0.1,0,0.2,0,0.3,0.1c0.2,0,0.4,0.1,0.6,0.2c0.1,0,0.2,0.1,0.2,0.1C6,5.6,6,5.6,6.1,5.7c0.1,0,0.2,0.1,0.3,0.2c0,0,0,0,0,0C6.5,6,6.6,6.1,6.7,6.1c0,0.1,0,0.1,0,0.1C6.8,6.3,6.8,6.3,6.9,6.4c0,0,0,0.1,0.1,0.1C7,6.6,7,6.7,7.1,6.8c0,0,0,0,0,0C7.1,6.9,7.2,7,7.2,7.1c0,0,0,0.1,0,0.1c0,0.1,0,0.2,0,0.3V6.3c0,0,0,0,0,0" fill="#BDCAD5"/><path d="M0.5,3c0-0.1,0-0.2,0-0.2C0.6,2.7,0.6,2.6,0.7,2.5c0-0.1,0-0.1,0.1-0.2C0.8,2.2,0.9,2.2,1,2.1C1,2,1.1,2,1.1,2C1.2,1.9,1.3,1.8,1.3,1.8C1.4,1.7,1.5,1.7,1.6,1.6c0,0,0.1,0,0.1,0C1.9,1.5,2,1.4,2.2,1.4c0,0,0.1,0,0.1,0C2.4,1.3,2.6,1.3,2.7,1.3S2.9,1.3,3,1.2c0.2,0,0.3,0,0.5,0s0.4,0,0.5,0s0.2,0,0.3,0C4.5,1.3,4.6,1.3,4.7,1.3s0.1,0,0.2,0.1c0.1,0,0.2,0,0.3,0.1c0.1,0,0.2,0,0.3,0.1c0,0,0.1,0,0.1,0C5.7,1.7,5.9,1.8,6,1.9C6,1.9,6.1,2,6.1,2C6.2,2.1,6.3,2.2,6.4,2.3c0,0,0.1,0.1,0.1,0.2c0.1,0,0.1,0.1,0.1,0.1C6.7,2.7,6.7,2.8,6.8,3c0,0,0,0,0,0C6.9,3.2,7,3.4,7,3.6V2.4C7,2.3,7,2.3,7,2.3C6.9,2.1,6.9,2,6.9,1.9c0,0-0.1,0-0.1,0c0-0.1,0-0.1,0-0.1C6.8,1.7,6.7,1.6,6.7,1.5c0,0,0,0-0.1-0.1c0,0,0-0.1-0.1-0.1c0-0.1,0-0.1,0-0.2c-0.1,0-0.1,0-0.1,0C6.3,1,6.2,0.9,6.1,0.8C6.1,0.8,6,0.7,6,0.7C5.9,0.6,5.7,0.5,5.6,0.4c0,0-0.1,0-0.1,0s0,0,0,0C5.4,0.3,5.3,0.3,5.2,0.3C5.1,0.2,5,0.2,5,0.2c-0.1,0-0.1,0-0.1,0C4.8,0.1,4.8,0.1,4.7,0.1s-0.2,0-0.3,0c0,0,0,0-0.1,0C4.2,0,4.1,0,4,0C4,0,3.9,0,3.8,0S3.6,0,3.5,0c0,0,0,0,0,0C3.4,0,3.3,0,3.3,0C3.2,0,3.1,0,3,0C2.9,0.1,2.8,0.1,2.7,0.1c0,0,0,0-0.1,0S2.4,0.1,2.3,0.2c0,0-0.1,0-0.1,0s0,0,0,0C2,0.2,1.9,0.3,1.8,0.3c0,0-0.1,0.1-0.1,0.1s-0.1,0-0.1,0C1.5,0.5,1.5,0.5,1.4,0.5c0,0,0,0.1-0.1,0.1c0,0-0.1,0.1-0.2,0.2C1.1,0.8,1,0.8,1,0.9C0.9,1,0.8,1,0.8,1.1C0.7,1.2,0.7,1.2,0.7,1.3C0.6,1.4,0.6,1.5,0.5,1.6c0,0.1,0,0.1,0,0.2C0.4,1.9,0.4,2.1,0.4,2.3c0,0.1,0,0.1,0,0.2V3.7c0-0.1,0-0.1,0-0.2C0.4,3.3,0.4,3.1,0.5,3" fill="#BDCAD5"/><path d="M3.5,1.2C5.5,1.2,6.7,2,7,3.6L5.7,3.9C5.5,2.8,4.8,2.3,3.6,2.3C2.5,2.3,1.9,2.7,1.8,3.5c-0.1,0.6,0.6,1.1,2,1.4c0.6,0.2,1,0.3,1.3,0.4C6.6,5.7,7.3,6.5,7.2,7.6C7.2,9.2,6,10,3.8,10.1c0,0-0.1,0-0.1,0C1.6,10.1,0.3,9.2,0,7.3L1.4,7c0.2,1.4,1,2.1,2.4,2.1C5,9.1,5.7,8.6,5.8,7.7C5.9,7,5.3,6.5,4,6.2C3.9,6.1,3.7,6,3.3,6C3.2,5.9,3.1,5.9,3,5.9C1.1,5.5,0.2,4.7,0.4,3.5C0.5,2,1.5,1.3,3.5,1.2z" fill="#8DA4B7"/></g></g></g></svg>');
insert into `dss_workflow_node` (`name`, `appconn_name`, `node_type`, `jump_url`, `support_jump`, `submit_to_scheduler`, `enable_copy`, `should_creation_before_node`, `icon`) values('datax','exchangis','wds.dss.appconn.exchangis.datax','http://APPCONN_INSTALL_IP:APPCONN_INSTALL_PORT/dss/exchangis/#/childJobManagement','1','1','0','1','<?xml version="1.0" encoding="UTF-8"?><svg width="22" height="22" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><path d="M0.8,0V2.4C0.8,2.7,0.6,3.1,0.2,3.3V1" id="a"/><path d="M0.8,0V2.4C0.8,2.7,0.6,3.1,0.2,3.3V1" id="c"/><path d="M0.8,0V2.4C0.8,2.7,0.6,3.1,0.2,3.3V1" id="e"/><path d="M0.8,0V2.4C0.8,2.7,0.6,3.1,0.2,3.3V1" id="g"/><path d="M0.1,0c0,0.3,0.2,0.7,0.4,1V3.3C0.3,3.1,0.1,2.7,0.1,2.4" id="i"/><path d="M0,0C0,0.3,0.1,0.7,0.4,1C0.7,1.2,1,1.4,1.4,1.4C1.7,1.4,2.1,1.2,2.3,1V3.3C2.1,3.6,1.7,3.7,1.4,3.7C1,3.7,0.7,3.6,0.4,3.3C0.1,3.1,0,2.7,0,2.4" id="k"/><path id="m" d="M0,0H17.9V17.6H0z"/><path d="M2.3,0V2.4C2.3,2.7,2.2,3.1,1.9,3.3C1.7,3.6,1.3,3.7,1,3.7C0.6,3.7,0.3,3.6,0,3.3V1C0.3,1.2,0.6,1.4,1,1.4C1.3,1.4,1.7,1.2,1.9,1" id="o"/><path d="M2.3,0V2.4C2.3,2.7,2.2,3.1,1.9,3.3C1.7,3.6,1.3,3.7,1,3.7C0.6,3.7,0.3,3.6,0,3.3V1C0.3,1.2,0.6,1.4,1,1.4C1.3,1.4,1.7,1.2,1.9,1" id="q"/><path d="M2.3,0V2.4C2.3,2.7,2.2,3.1,1.9,3.3C1.7,3.6,1.3,3.7,1,3.7C0.6,3.7,0.3,3.6,0,3.3V1C0.3,1.2,0.6,1.4,1,1.4C1.3,1.4,1.7,1.2,1.9,1" id="s"/><path d="M2.3,0V2.4C2.3,2.7,2.2,3.1,1.9,3.3C1.7,3.6,1.3,3.7,1,3.7C0.6,3.7,0.3,3.6,0,3.3V1C0.3,1.2,0.6,1.4,1,1.4C1.3,1.4,1.7,1.2,1.9,1" id="u"/></defs><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><path d="M0,0H22V22H0z"/><g transform="translate(2,1)"><g transform="translate(17.48,1.35)"><mask id="b" fill="#fff"><use xlink:href="#a"/></mask><path d="M0.8,0V2.4c0,0.1,0,0.2-0.1,0.3V0.3C0.8,0.2,0.8,0.1,0.8,0" fill="#46C5C0" mask="url(#b)"/><mask id="d" fill="#fff"><use xlink:href="#c"/></mask><path d="M0.7,0.3V2.7c0,0.1,0,0.2-0.1,0.3V0.6C0.7,0.5,0.7,0.4,0.7,0.3" fill="#47C7BE" mask="url(#d)"/><mask id="f" fill="#fff"><use xlink:href="#e"/></mask><path d="M0.6,0.6V3C0.5,3,0.5,3.1,0.4,3.2V0.8C0.5,0.8,0.5,0.7,0.6,0.6" fill="#48C8BD" mask="url(#f)"/><mask id="h" fill="#fff"><use xlink:href="#g"/></mask><path d="M0.4,0.8V3.2C0.3,3.3,0.3,3.3,0.2,3.3V1C0.3,0.9,0.3,0.9,0.4,0.8" fill="#49CABB" mask="url(#h)"/></g><g transform="translate(0,1.35)"><mask id="j" fill="#fff"><use xlink:href="#i"/></mask><path d="M0.5,1V3.3C0.3,3.1,0.1,2.7,0.1,2.4V0c0,0.3,0.2,0.7,0.4,1" fill="#49CABB" mask="url(#j)"/></g><path fill="#4ACCBA" d="M7.1,8.8v2.4L0.5,4.7V2.3z"/><path fill="#49CABB" d="M17.6,2.3V4.7L11,11.2V8.8z"/><path fill="#4ACCBA" d="M15.7,17.2v2.4L9.1,13.1V10.7z"/><path fill="#49CABB" d="M9.1,10.7v2.4L2.5,19.6V17.2z"/><g transform="translate(.14,16.26)"><mask id="l" fill="#fff"><use xlink:href="#k"/></mask><path d="M2.3,1V3.3C2.1,3.6,1.7,3.7,1.4,3.7C1,3.7,0.7,3.6,0.4,3.3C0.1,3.1,0,2.7,0,2.4V0C0,0.3,0.1,0.7,0.4,1C0.7,1.2,1,1.4,1.4,1.4C1.7,1.4,2.1,1.2,2.3,1" fill="#49CABB" mask="url(#l)"/></g><g transform="translate(.14,0)"><mask id="n" fill="#fff"><use xlink:href="#m"/></mask><path d="M16.5,0c0.4,0,0.7,0.1,1,0.4c0.5,0.5,0.5,1.4,0,1.9l-6.6,6.5,6.6,6.5c0.5,0.5,0.5,1.4,0,1.9c-0.3,0.3-0.6,0.4-1,0.4c-0.3,0-0.7-0.1-1-0.4L8.9,10.7,2.3,17.2C2.1,17.5,1.7,17.6,1.4,17.6C1,17.6,0.7,17.5,0.4,17.2c-0.5-0.5-0.5-1.4,0-1.9L7,8.8,0.4,2.3C-0.1,1.8-0.1,0.9,0.4,0.4C0.7,0.1,1,0,1.4,0C1.7,0,2.1,0.1,2.3,0.4L8.9,6.9,15.5,0.4C15.8,0.1,16.2,0,16.5,0" fill="#35A8DA" mask="url(#n)"/></g><g transform="translate(15.68,16.26)"><mask id="p" fill="#fff"><use xlink:href="#o"/></mask><path d="M2.3,0V2.4c0,0.1,0,0.2,0,0.3V0.3c0-0.1,0-0.2,0-0.3" fill="#46C5C0" mask="url(#p)"/><mask id="r" fill="#fff"><use xlink:href="#q"/></mask><path d="M2.3,0.3V2.7c0,0.1,0,0.2-0.1,0.3V0.6C2.3,0.5,2.3,0.4,2.3,0.3" fill="#47C7BE" mask="url(#r)"/><mask id="t" fill="#fff"><use xlink:href="#s"/></mask><path d="M2.2,0.6V3C2.2,3,2.1,3.1,2.1,3.2V0.8C2.1,0.7,2.2,0.7,2.2,0.6" fill="#48C8BD" mask="url(#t)"/><mask id="v" fill="#fff"><use xlink:href="#u"/></mask><path d="M2.1,0.8V3.2C2,3.3,2,3.3,1.9,3.3C1.7,3.6,1.3,3.7,1,3.7C0.6,3.7,0.3,3.6,0,3.3V1C0.3,1.2,0.6,1.4,1,1.4C1.3,1.4,1.7,1.2,1.9,1C2,0.9,2,0.9,2.1,0.8" fill="#49CABB" mask="url(#v)"/></g></g></g></svg>');



select @dss_exchangis_sqoopId:=id from `dss_workflow_node` where `node_type` = 'wds.dss.appconn.exchangis.sqoop';
select @dss_exchangis_dataxId:=id from `dss_workflow_node` where `node_type` = 'wds.dss.appconn.exchangis.datax';


delete from `dss_workflow_node_to_group` where `node_id`=@dss_exchangis_sqoopId;
delete from `dss_workflow_node_to_group` where `node_id`=@dss_exchangis_dataxId;


delete from `dss_workflow_node_to_ui` where `workflow_node_id`=@dss_exchangis_sqoopId;
delete from `dss_workflow_node_to_ui` where `workflow_node_id`=@dss_exchangis_dataxId;


select @dss_exchangis_sqoopId:=id from `dss_workflow_node` where `node_type` = 'wds.dss.appconn.exchangis.sqoop';
select @dss_exchangis_dataxId:=id from `dss_workflow_node` where `node_type` = 'wds.dss.appconn.exchangis.datax';

INSERT INTO `dss_workflow_node_to_group`(`node_id`,`group_id`) values (@dss_exchangis_sqoopId,1);
INSERT INTO `dss_workflow_node_to_group`(`node_id`,`group_id`) values (@dss_exchangis_dataxId,1);


INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId,1);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId,2);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId,3);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId,4);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_sqoopId,5);


INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_dataxId,1);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_dataxId,2);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_dataxId,3);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_dataxId,4);
INSERT INTO `dss_workflow_node_to_ui`(`workflow_node_id`,`ui_id`) values (@dss_exchangis_dataxId,5);



