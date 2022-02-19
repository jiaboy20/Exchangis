package com.webank.wedatasphere.exchangis.dss.appconn.operation.project;

import com.webank.wedatasphere.dss.standard.app.sso.builder.SSOUrlBuilderOperation;
import com.fasterxml.jackson.core.type.TypeReference;
import com.google.common.collect.Maps;
import com.webank.wedatasphere.dss.standard.app.sso.request.SSORequestOperation;
import com.webank.wedatasphere.dss.standard.app.structure.StructureService;
import com.webank.wedatasphere.dss.standard.app.structure.project.ProjectCreationOperation;
import com.webank.wedatasphere.dss.standard.app.structure.project.ProjectRequestRef;
import com.webank.wedatasphere.dss.standard.app.structure.project.ProjectResponseRef;
import com.webank.wedatasphere.dss.standard.common.exception.operation.ExternalOperationFailedException;

import com.webank.wedatasphere.exchangis.dss.appconn.config.ExchangisConfig;
import com.webank.wedatasphere.exchangis.dss.appconn.request.action.ExchangisEntityPostAction;
import com.webank.wedatasphere.exchangis.dss.appconn.request.action.ExchangisPostAction;
import com.webank.wedatasphere.exchangis.dss.appconn.operation.AbstractExchangisOperation;
import com.webank.wedatasphere.exchangis.dss.appconn.ref.ExchangisProjectResponseRef;
import com.webank.wedatasphere.exchangis.dss.appconn.request.entity.ProjectReqEntity;
import com.webank.wedatasphere.exchangis.dss.appconn.utils.AppConnUtils;
import org.apache.http.HttpRequest;
import org.apache.linkis.httpclient.request.HttpAction;
import org.apache.linkis.httpclient.response.HttpResult;
import org.apache.linkis.server.BDPJettyServerHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

/**
 * Project create operation
 */
public class ExchangisProjectCreationOperation extends AbstractExchangisOperation implements ProjectCreationOperation {
    private final static Logger LOG = LoggerFactory.getLogger(ExchangisProjectCreationOperation.class);

    private StructureService structureService;

    public ExchangisProjectCreationOperation(StructureService structureService) {
        super(new String[]{"createProject"});
        setStructureService(structureService);
    }

    @Override
    public ProjectResponseRef createProject(ProjectRequestRef projectRequestRef) throws ExternalOperationFailedException {
        LOG.info("create project=> dss_projectId:{}, name:{}, createUser:{}, parameters:{}, workspaceName:{}",
                projectRequestRef.getId(), projectRequestRef.getName(), projectRequestRef.getCreateBy(), projectRequestRef.getParameters().toString(),
                projectRequestRef.getWorkspace().getWorkspaceName());
        // Build project post(add) action
        ProjectReqEntity projectReqEntity = new ProjectReqEntity();
        ExchangisEntityPostAction<ProjectReqEntity> projectAction = new ExchangisEntityPostAction<>();
        ExchangisPostAction exchangisPostAction = new ExchangisPostAction();
        exchangisPostAction.setUser(projectRequestRef.getCreateBy());
        exchangisPostAction.addRequestPayload(ExchangisConfig.WORKSPACE_NAME,projectRequestRef.getWorkspace().getWorkspaceName());
        exchangisPostAction.addRequestPayload(ExchangisConfig.PROJECT_NAME,projectRequestRef.getName());
        exchangisPostAction.addRequestPayload(ExchangisConfig.DSS_PROJECT_NAME,projectRequestRef.getName());
        exchangisPostAction.addRequestPayload(ExchangisConfig.DESCRIPTION,projectRequestRef.getDescription());
        exchangisPostAction.addRequestPayload(ExchangisConfig.EDIT_USERS,projectRequestRef.getCreateBy());
        exchangisPostAction.addRequestPayload(ExchangisConfig.EXEC_USERS,projectRequestRef.getCreateBy());
        exchangisPostAction.addRequestPayload(ExchangisConfig.VIEW_USERS,projectRequestRef.getCreateBy());
        exchangisPostAction.addRequestPayload(ExchangisConfig.TAGS, AppConnUtils.changeDssLabelName(projectRequestRef.getDSSLabels()));

        SSOUrlBuilderOperation ssoUrlBuilderOperation = projectRequestRef.getWorkspace().getSSOUrlBuilderOperation().copy();
        ssoUrlBuilderOperation.setAppName(getAppName());
        ssoUrlBuilderOperation.setReqUrl(requestURL());
        ssoUrlBuilderOperation.setWorkspace(projectRequestRef.getWorkspace().getWorkspaceName());

        String response = "";
        Map<String, Object>  resMap = Maps.newHashMap();
        HttpResult httpResult = null;
        try {
            exchangisPostAction.setUrl(ssoUrlBuilderOperation.getBuiltUrl());
            SSORequestOperation<HttpAction, HttpResult> ssoRequestOperation = getOrCreateSSORequestOperation(getAppName());
            httpResult = ssoRequestOperation.requestWithSSO(ssoUrlBuilderOperation, exchangisPostAction);
            response = httpResult.getResponseBody();
            resMap = BDPJettyServerHelper.jacksonJson().readValue(response, new TypeReference<Map<String, Object>>() {});
        }catch (Exception e){
            LOG.error("Create Exchangis Project Exception", e);
            throw new ExternalOperationFailedException(31020,e.getMessage());
        }

        LOG.info("create project=> status {},response {},resMap {}",httpResult.getStatusCode(),response,resMap.toString());
        Map<String, Object> header = (Map<String, Object>) resMap.get("header");
        int code = (int) header.get("code");
        String errorMsg = "";
        if (code != 200) {
            errorMsg = header.toString();
            throw new ExternalOperationFailedException(31020, errorMsg, null);
        }
        Integer projectId = (Integer) ((Map<String, Object>) resMap.get("payload")).get("projectId");
        ExchangisProjectResponseRef exchangisProjectResponseRef = null;
        try {
            exchangisProjectResponseRef = new ExchangisProjectResponseRef(response, code);
        } catch (Exception e) {
            throw new ExternalOperationFailedException(31020, "failed to parse response json", e);
        }
        exchangisProjectResponseRef.setAppInstance(structureService.getAppInstance());
        exchangisProjectResponseRef.setProjectRefId(projectId.longValue());
        exchangisProjectResponseRef.setErrorMsg(errorMsg);
        return exchangisProjectResponseRef;
    }

    @Override
    public void init() {

    }

    @Override
    public void setStructureService(StructureService structureService) {
        this.structureService = structureService;
        setSSORequestService(this.structureService);
    }
}
