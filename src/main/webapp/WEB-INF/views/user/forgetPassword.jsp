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

    <!--验证码框-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/zzsc.css"/>

</head>
<body>
<%@include file="../common/header.jsp"%>
<!--注册-->
<div class="wrap">
    <form id="loginForm" name="loginForm" action="" method="post">
        <div class="tdbModule loginPage">
            <div class="registerTitle">用手机验证码登录</div>
            <div class="registerCont">
                <ul>
                    <li class="error">
                        <span id="prrintInfo" data-info=""><span>请输入正确手机号</span></span>
                    </li>
                    <li>
                        <span class="dis">手机号码：</span><input class="input" type="text" name="phone" id="phone" onblur="checkPhone();" maxlength="11" tabindex="1" autocomplete="off">
                        <a id="sssdfasdfas" href="<%=path%>/page/register" class="blue">注册用户</a>
                    </li>

                    <li>
                        <span class="dis">验证码：</span><input type="text" onblur="checkyzm()" onkeyup="verify(this)" id="code" style="width:166px;" class="input" name="code" data-msg="验证码" maxlength="6" tabindex="1" autocomplete="off"/>

                        <input type="button" value="获取手机验证码" id="vcode" onclick="getPhoneCode()"  style="width: 120px;height: 28px; color:black" >

                    </li>
                    <li class="btn">
                        <input type="button" class="radius1" value="立即登录" id="submitBtn" onclick="login()">
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
<%@ include file="../common/footer.jsp"%>
</body>

<!--引用登录js-->
<%--<script type="text/javascript" src="<%=path%>/static/js/lyj/userlogin.js"></script>--%>

<!--手机验证码-->
<script type="text/javascript" src="<%=path%>/static/js/lyj/sms.js"></script>

</html>
