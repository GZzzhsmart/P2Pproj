<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>投资记录</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <div class="personal-main">
            <div class="personal-money">
                <h3><i>投资记录</i></h3>


                    <input type="hidden" id="juid" name="juid"  value="${juid}">



                    <table id="mytab" name="mytab" class="table table-hover"></table>
                    <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">

                        <button id="sh" type="button"  class="btn btn-default" style="display: block; border-radius: 0" data-target="#exampleModal">
                            <span class="glyphicon glyphicon-screenshot" aria-hidden="true" ></span>确认收款
                        </button>
                    </div>
                </div>


            </div>
    <div class="clear"></div>
</div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script src="<%=path%>/static/js/lyj/shoukuanList.js"></script>



</html>
