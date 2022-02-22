package com.webank.wedatasphere.exchangis.datasource.server.restful.api;

import com.webank.wedatasphere.exchangis.datasource.core.exception.ExchangisDataSourceException;
import com.webank.wedatasphere.exchangis.datasource.core.ui.ElementUI;
import com.webank.wedatasphere.exchangis.datasource.service.ExchangisDataSourceService;
import com.webank.wedatasphere.exchangis.datasource.vo.DataSourceQueryVO;
import com.webank.wedatasphere.exchangis.datasource.vo.FieldMappingVO;
import org.apache.linkis.server.Message;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.QueryParam;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "exchangis", produces = {"application/json;charset=utf-8"})
public class ExchangisDataSourceRestfulApi {
    private static final Logger LOG = LoggerFactory.getLogger(ExchangisDataSourceRestfulApi.class);


    private final ExchangisDataSourceService exchangisDataSourceService;

    @Autowired
    public ExchangisDataSourceRestfulApi(ExchangisDataSourceService exchangisDataSourceService) {
        this.exchangisDataSourceService = exchangisDataSourceService;
    }

    // list all datasource types
    @RequestMapping( value = "datasources/type", method = RequestMethod.GET)
    public Message listDataSourceTypes(HttpServletRequest request) throws Exception {
        return this.exchangisDataSourceService.listDataSources(request);
    }

    // query paged datasource
    @RequestMapping( value = "datasources/query", method = {RequestMethod.GET,RequestMethod.POST})
    public Message create(HttpServletRequest request, @RequestBody DataSourceQueryVO vo) throws Exception {
        return this.exchangisDataSourceService.queryDataSources(request, vo);
    }

    // list all datasources
    @RequestMapping( value = "datasources", method = RequestMethod.GET)
    @Deprecated
    public Message listAllDataSources(
            HttpServletRequest request,
            @RequestParam(value = "typeId", required = false) Long typeId,
            @RequestParam(value = "typeName", required = false) String typeName,
            @RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "size", required = false) Integer size
    ) throws Exception {
        return this.exchangisDataSourceService.listAllDataSources(request, typeName, typeId, page, size);
    }

    // get datasource key define
    @RequestMapping( value = "datasources/types/{dataSourceTypeId}/keydefines", method = RequestMethod.GET)
    public Message getDataSourceKeyDefine(
            HttpServletRequest request,
            @PathVariable("dataSourceTypeId") Long dataSourceTypeId
    ) throws Exception {
        return this.exchangisDataSourceService.getDataSourceKeyDefine(request, dataSourceTypeId);
    }


    // get datasource version list
    @RequestMapping( value = "datasources/{id}/versions", method = RequestMethod.GET)
    public Message getDataSourceVersionsById(HttpServletRequest request, @PathVariable("id") Long id) throws Exception {
        return this.exchangisDataSourceService.getDataSourceVersionsById(request, id);
    }

    // create datasource
    @RequestMapping( value = "datasources", method = RequestMethod.POST)
    public Message create(HttpServletRequest request, /*@PathParam("type") String type, */@RequestBody Map<String, Object> json) throws Exception {
        Message message = null;
        try{
            message = exchangisDataSourceService.create(request, json);
        } catch (ExchangisDataSourceException e) {
            String errorMessage = "Error occur while create datasource";
            LOG.error(errorMessage, e);
            message = Message.error("已存在同名任务");
        }
        return message;
        //return this.exchangisDataSourceService.create(request,/* type, */json);
    }

    // get datasource details
    @RequestMapping( value = "datasources/{id}", method = RequestMethod.GET)
    public Message getDataSourceInfoById(HttpServletRequest request, @PathVariable("id") Long id, @QueryParam(value = "versionId") String versionId) throws Exception {
        return this.exchangisDataSourceService.getDataSource(request, id, versionId);
    }

    @RequestMapping( value = "datasources/{id}/connect_params", method = RequestMethod.GET)
    public Message getDataSourceConnectParamsById(HttpServletRequest request, @PathVariable("id") Long id) throws Exception {
        return this.exchangisDataSourceService.getDataSourceConnectParamsById(request, id);
    }

    // update datasource and parameters (insert new record in datasource_version table)
    @RequestMapping( value = "datasources/{id}", method = RequestMethod.PUT)
    public Message update(HttpServletRequest request,/* @PathParam("type") String type, */@PathVariable("id") Long id, @RequestBody Map<String, Object> json) throws Exception {
        return this.exchangisDataSourceService.updateDataSource(request, /*type, */id, json);
    }

    // publish datasource
    @RequestMapping( value = "datasources/{id}/{version}/publish", method = RequestMethod.PUT)
    public Message publishDataSource(HttpServletRequest request,/* @PathParam("type") String type, */@PathVariable("id") Long id,
                                     @PathVariable("version") Long version) throws Exception {
        return this.exchangisDataSourceService.publishDataSource(request, /*type, */id, version);
    }

    // expire datasource
    @RequestMapping( value = "datasources/{id}/expire", method = RequestMethod.PUT)
    public Message expireDataSource(HttpServletRequest request,/* @PathParam("type") String type, */@PathVariable("id") Long id) throws Exception {
        return this.exchangisDataSourceService.expireDataSource(request, /*type, */id);
    }

    // test datasource connect
    @RequestMapping( value = "datasources/{id}/{version}/connect", method = RequestMethod.PUT)
    public Message testConnect(HttpServletRequest request,/* @PathParam("type") String type, */@PathVariable("id") Long id,
                               @PathVariable("version") Long version) throws Exception {
        Message message = null;
        try{
            message = exchangisDataSourceService.testConnect(request, /*type, */id, version);
        } catch (ExchangisDataSourceException e) {
            String errorMessage = "Error occur while connect datasource";
            LOG.error(errorMessage, e);
            message = Message.error("数据源连接失效，请检查配置");
        }
        return message;
        //return this.exchangisDataSourceService.testConnect(request, /*type, */id, version);
    }

    // delete datasource (physical)
    @RequestMapping( value = "datasources/{id}", method = RequestMethod.DELETE)
    public Message delete(HttpServletRequest request, /*@PathParam("type") String type, */@PathVariable("id") Long id) throws Exception {
        Message message = null;
        try{
            message = exchangisDataSourceService.deleteDataSource(request, /*type, */id);
        } catch (ExchangisDataSourceException e) {
            String errorMessage = "Error occur while delete datasource";
            LOG.error(errorMessage, e);
            message = Message.error("删除数据源失败，存在引用依赖");
        }
        return message;
        //return this.exchangisDataSourceService.deleteDataSource(request, /*type, */id);
    }

    @RequestMapping( value = "datasources/{type}/{id}/dbs", method = RequestMethod.GET)
    public Message queryDataSourceDBs(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("id") Long id) throws Exception {
        Message message = null;
        try{
            message = exchangisDataSourceService.queryDataSourceDBs(request, type, id);
        } catch (ExchangisDataSourceException e) {
            String errorMessage = "Error occur while query datasource";
            LOG.error(errorMessage, e);
            message = Message.error("数据源未发布或参数为空");
        }
        return message;
        //return this.exchangisDataSourceService.queryDataSourceDBs(request, type, id);
    }

    @RequestMapping( value = "datasources/{type}/{id}/dbs/{dbName}/tables", method = RequestMethod.GET)
    public Message queryDataSourceDBTables(HttpServletRequest request, @PathVariable("type") String type,
                                           @PathVariable("id") Long id, @PathVariable("dbName") String dbName) throws Exception {
        return this.exchangisDataSourceService.queryDataSourceDBTables(request, type, id, dbName);
    }

    @RequestMapping( value = "datasources/{type}/{id}/dbs/{dbName}/tables/{tableName}/fields", method = RequestMethod.GET)
    public Message queryDataSourceDBTableFields(HttpServletRequest request, @PathVariable("type") String type,
                                                @PathVariable("id") Long id, @PathVariable("dbName") String dbName,
                                                @PathVariable("tableName") String tableName) throws Exception {
        return this.exchangisDataSourceService.queryDataSourceDBTableFields(request, type, id, dbName, tableName);
    }

    @RequestMapping( value = "datasources/fieldsmapping", method = RequestMethod.POST)
    public Message queryDataSourceDBTableFieldsMapping(HttpServletRequest request, @RequestBody FieldMappingVO vo) throws Exception {
        return this.exchangisDataSourceService.queryDataSourceDBTableFieldsMapping(request, vo);
    }

    @RequestMapping( value = "datasources/{engine}/{type}/params/ui", method = RequestMethod.GET)
    public Message getParamsUI(
            HttpServletRequest request,
            @PathVariable("engine") String engine,
            @PathVariable("type") String type,
            @RequestParam(value = "dir", required = false) String dir
    ) {
        List<ElementUI<?>> uis = this.exchangisDataSourceService.getDataSourceParamsUI(type, String.format("%s-%s", engine, dir));
        return Message.ok().data("uis", uis);
    }

}
