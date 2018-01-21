<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>详情信息</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">




                    <div class="ibox-title">
                        <a href="/rzvip/rzvipList"><h5>返回认证审核</h5></a>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
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

                                ${rzvipDetails.uname}

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">头像</label>

                               <img src="<%=path%>/${rzvipDetails.face}" style="width: 120px;height: 120px">

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">是否为vip用户</label>


                                <c:if test="${rzvipDetails.isvip==0}">是</c:if>
                                <c:if test="${rzvipDetails.isvip==1}">否</c:if>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">手机号</label>

                                    ${rzvipDetails.phone}

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">身份证号</label>

                                ${rzvipDetails.idno}

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">电子邮箱</label>

                                ${rzvipDetails.email}

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">真实姓名</label>

                               ${rzvipDetails.rname}
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">性别</label>
                                <c:if test="${rzvipDetails.sex==0}">男</c:if>
                                <c:if test="${rzvipDetails.sex==1}">女</c:if>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">状态</label>
                                <c:if test="${rzvipDetails.state==0}">冻结</c:if>
                                <c:if test="${rzvipDetails.state==1}">激活</c:if>

                            </div>
                            <div class="hr-line-dashed"></div>

                        </form>
                    </div>


</div>



</body>
</html>
