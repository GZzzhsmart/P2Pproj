<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/14
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>亿人宝理财平台</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
       <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/mediaPage.css" rel="stylesheet" type="text/css">
    <style>
        /*上下滚动*/
        #scrollDiv {
            width: 400px;
            height: 30px;
            line-height: 30px;
            overflow: hidden;
        }
        #scrollDiv li {
            height: 30px;
            padding-left: 10px;
        }
    </style>
    <script type="text/javascript">
        // 上下滚动
        function AutoScroll(obj) {
            $(obj).find("ul:first").animate({
                    marginTop: "-25px"
                },
                500,
                function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                });
        }
        $(document).ready(function() {
            var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
            $("#scrollDiv").hover(function() {
                    clearInterval(myar);
                },
                function() {
                    myar = setInterval('AutoScroll("#scrollDiv")', 3000)
                }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始
        });

    </script>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
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
                                <div class="gg_newstitle"><p>${notice.title}</p><b> &nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate value="${notice.date}" pattern="yyyy-MM-dd"/></b></div>
                                <div><p> ${notice.content}</p></div>
                                <div class="fanhui">
                                    <b><span style="margin-left: 330px;font-size:16px;"><a href="<%=path%>/page/ad/1">返回上一页</a></span></b>
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
<%@include file="../common/footer.jsp" %>
</body>
</html>
