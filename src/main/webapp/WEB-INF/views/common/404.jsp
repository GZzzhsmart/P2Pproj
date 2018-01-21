<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>404</title>
    <link href="<%=path%>/static/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet" />
    <link href='<%=path%>/static/css/404.css' rel='stylesheet' type='text/css'>
    <link href="<%=path%>/static/css/style.css" rel="stylesheet" />
</head>
<body>


<div class="container">

    <div class="row pad-top text-center">
        <div class="col-md-6 col-md-offset-3 text-center">
            <h1>  未找到页面 </h1>
            <span id="error-link"></span>
            <h2>! 错误，找不到 !</h2>
        </div>
    </div>

    <div class="row text-center">
        <div class="col-md-8 col-md-offset-2">

            <h3> <i  class="fa fa-lightbulb-o fa-5x"></i> </h3>
            <a href="#" class="btn btn-primary">返回上一页</a>
        </div>
    </div>

</div>


<script src="<%=path%>/static/js/jquery-1.10.2.js"></script>
<script src="<%=path%>/static/js/bootstrap.js"></script>
<script src="<%=path%>/static/js/countUp.js"></script>
<script src="<%=path%>/static/js/custom.js"></script>
</body>
</html>

