<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/16
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>最新公告</title>
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/><script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <!--上传文件及图片-->
</head>
<body>
<h5><a href="<%=path%>/notice/notice">返回列表</a></h5>

<h2 align="center" style="font-size: 30px">${notice.title}</h2>
${notice.content}

</body>
<jsp:include page="../common/bootstraptablejs.jsp"/>
</html>
