<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <title>后台用户登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=path%>/static/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="<%=path%>/static/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="<%=path%>/static/css/animate.css" rel="stylesheet">
    <link href="<%=path%>/static/css/style.css?v=2.2.0" rel="stylesheet">

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">HT</h1>
        </div>

        <form id="longinForm" name="longinForm" class="m-t" role="form" action="">
            <div class="form-group">
                <input type="text" name="phone" id="phone" onblur="husercheckPhone()" class="form-control" placeholder="手机号" required="">
            </div>
            <div class="form-group">

                <input type="password" name="code" id="code"  onblur="checkyzm()" style="width: 170px;height: 32px;float: left" placeholder="验证码" required="">

                <input type="button" value="获取手机验证码" id="vcode" onclick="getPhoneCode()"   class="form-control"  style="width: 128px;height: 28px; color:black;" >
                <br>
            </div>
            <br>
            <button type="button" onclick="huserlogin();" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-muted text-center"> <a href="<%=path%>/Huser/forgerView"><small>忘记密码了？</small></a> | <a href="<%=path%>/Huser/register">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>
<script src="<%=path%>/static/js/jquery-2.1.1.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js?v=3.4.0"></script>
</body>


<!--手机验证码-->
<script type="text/javascript" src="<%=path%>/static/js/lyj/husersms.js"></script>
</html>
