<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <title>后台管理员注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=path%>/static/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="<%=path%>/static/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="<%=path%>/static/css/custom.css" rel="stylesheet">
    <link href="<%=path%>/static/css/animate.css" rel="stylesheet">
    <link href="<%=path%>/static/css/style.css?v=2.2.0" rel="stylesheet">

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">HT</h1>
        </div>
        <h3>欢迎注册 亿人宝</h3>
        <p>创建一个亿人宝新账户</p>
        <form id="registerForm" name="registerForm"  class="m-t" role="form" action="">
            <div class="form-group">
                <input type="text" class="form-control" id="huname" name="huname" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="phone" name="phone" onblur="checkPhone()" placeholder="请输入手机号码" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="hpwd" name="hpwd" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control"  id="pwd" name="pwd"  placeholder="请再次输入密码" required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding">
                        <input type="checkbox"><i></i> 我同意注册协议</label>
                </div>
            </div>
            <button type="button" onclick="register()" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small><a href="<%=path%>/Huser/login">点此登录</a>
            </p>

        </form>
    </div>
</div>
<script src="<%=path%>/static/js/jquery-2.1.1.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js?v=3.4.0"></script>
<script src="<%=path%>/static/js/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
</body>
<!--引用登录js-->
<script type="text/javascript" src="<%=path%>/static/js/lyj/huserregister.js"></script>

</html>
