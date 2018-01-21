<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>借款详情信息</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox-title">
        <a class="J_menuItem" href="<%=path%>/page/users"><h5>返回列表</h5></a>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#">选项1</a>
                </li>
                <li><a href="#">选项2</a>
                </li>
            </ul>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">
        <form method="get" class="form-horizontal">
            <div class="form-group">
                <label class="col-lg-2 control-label">用户名</label>
                ${borrowDetailVO.rname}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">产品名称</label>
                ${borrowDetailVO.cpname}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">法人身份证照</label>
                <img src="<%=path%>/static/uploads/${borrowDetailVO.fpic}" style="width: 120px;height: 120px">
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">营业执照副本</label>
                <img src="<%=path%>/static/uploads/${borrowDetailVO.ypic}" style="width: 120px;height: 120px">
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">企业银行账户</label>
                <img src="<%=path%>/static/uploads/${borrowDetailVO.qpic}" style="width: 120px;height: 120px">
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">其他资料照片</label>
                <img src="<%=path%>/static/uploads/${borrowDetailVO.tpic}" style="width: 120px;height: 120px">
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">资金用途</label>
                ${borrowDetailVO.mpurpose}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">还款来源</label>
                ${borrowDetailVO.hksource}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">还款人介绍</label>
               ${borrowDetailVO.suggest}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">年化收益</label>
                ${borrowDetailVO.nprofit}
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
                <label class="col-lg-2 control-label">收益方式</label>
                ${borrowDetailVO.way}
            </div>
            <div class="hr-line-dashed"></div>


        </form>
    </div>


</div>



</body>
</html>
