<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
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
            <div class="registerTitle">用户登录</div>
            <div class="registerCont">
                <ul>

                    <li>
                        <span class="dis">用户名：</span><input class="input" type="text" name="name" id="name" maxlength="24" tabindex="1" autocomplete="off">
                        <a id="sssdfasdfas" href="<%=path%>/page/register" class="blue">注册用户</a>
                    </li>

                    <li>
                        <span class="dis">密码：</span><input class="input" type="password" name="password" id="password" maxlength="24" tabindex="1" autocomplete="off">
                        <a href="<%=path%>/luser/forgetPasswordView" id="pawHide" class="blue">忘记密码</a>
                    </li>
                    <li>
                        <span class="dis">验证码：</span><input type="text" onkeyup="verify(this)" id="jpgVerify" style="width:166px;" class="input" name="code" data-msg="验证码" maxlength="5" tabindex="1" autocomplete="off"/>
                        <img src="<%=path%>/code" style="cursor:pointer;" class="valign" title="点击更换验证码"  onclick="this.src='<%=path%>/code?r=' + Math.random();"/>
                        <%--<img src="<%=path%>/static/images/code.jpg" id="yanzheng" alt="点击更换验证码" title="点击更换验证码" style="cursor:pointer;" class="valign">--%>
                        <a href="javascript:void(0);" onclick="changge();" class="blue">看不清？换一张</a>
                    </li>
                    <li class="btn">
                        <input type="button" class="radius1" value="立即登录" id="submitBtn" onclick="login()">
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
<script type="text/javascript" src="<%=path%>/static/js/lyj/userlogin.js"></script>
</html>
