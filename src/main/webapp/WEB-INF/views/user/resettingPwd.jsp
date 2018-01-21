<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>重新设置密码</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/register.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/login.js" type="text/javascript"></script>

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>


<!--注册-->
<div class="wrap">
    <form id="longinForm" name="longinForm" action="" method="post">
        <div class="tdbModule loginPage">
            <div class="registerTitle">用户重置密码</div>
            <div class="registerCont">

                <input type="hidden" id="phone" name="phone" value="${phone}">

                <ul>

                    <li>
                        <span class="dis">新密码：</span><input class="input" type="password" name="password" id="password" maxlength="24" tabindex="1" autocomplete="off">

                    </li>

                    <li>
                        <span class="dis">确认密码：</span><input class="input" type="password" name="xpassword" id="xpassword" maxlength="24" tabindex="1" autocomplete="off">

                    </li>
                    <li class="btn">
                        <input type="button" class="radius1" value="确认修改" id="submitBtn" onclick="update()">
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>

<!--引用登录js-->
<script type="text/javascript" src="<%=path%>/static/js/lyj/resettingPwd.js"></script>
</html>
