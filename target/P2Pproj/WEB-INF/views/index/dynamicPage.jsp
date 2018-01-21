<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>媒体报道</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/mediaPage.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<!--关于我们-->
<div class="bg">
    <div class="contain" id="tabs" style="margin:0 auto;">
        <%@include file="../common/aboutLeft.jsp"%>
        <div class="text-box">
            <%--<!--描述：右侧内容开始 -->--%>
            <div class="a_rcon">
                <div class="a_rcontext reports clearfix">
                    <div class="a_rcontext1">
                        <div class="gg_con">
                            <div class="gg_news">
                                <div class="gg_newstitle"><p>${dynamic.title}</p><b> 创建时间: ${dynamic.date}</b></div>
                                <div><p>${dynamic.content}</p></div>
                                <div class="fanhui">
                                    <b><span style="margin-left: 330px;font-size:16px;"><a href="javascript:;" onclick="javascript:history.back(-1)">返回上一页</a></span></b>
                                    <b><span style="margin-left: 50px;font-size:16px;"><a href="<%=path%>/">返回首页</a></span></b>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  <!--描述：右侧内容结束 -->
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
