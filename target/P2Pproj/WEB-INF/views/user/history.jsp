<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>红包兑换历史</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <label id="typeValue" style="display:none;"> </label>
        <div class="personal-main">
            <div class="personal-zqzr personal-xtxx" style="min-height: 500px;">
                <h3> <i>兑换历史</i> </h3>
                <div class="wdhb-title wdhb-dhls"> <span class="wdhb-yzm">验证码</span><span class="wdhb-con">兑换红包名称</span><span class="wdhb-deadline">兑换日期</span> </div>
                <form id="form" name="form" method="post" action="">
                    <div class="zqzr-list">
                        <ul>
                            <li><span class="wdhb-yzm">12345678</span><span class="wdhb-con">现金红包50元</span><span class="wdhb-deadline">2015-10-1</span></li>
                            <li><span class="wdhb-yzm">12345678</span><span class="wdhb-con">现金红包50元</span><span class="wdhb-deadline">2015-10-1</span></li>
                            <li><span class="wdhb-yzm">12345678</span><span class="wdhb-con">现金红包50元</span><span class="wdhb-deadline">2015-10-1</span></li>
                            <li><span class="wdhb-yzm">12345678</span><span class="wdhb-con">现金红包50元</span><span class="wdhb-deadline">2015-10-1</span></li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
</body>
</html>
