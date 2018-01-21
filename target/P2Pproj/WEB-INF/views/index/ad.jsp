<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站公告</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--关于我们-->
<div class="bg">
    <div class="contain" id="tabs" style="margin:0 auto;">

        <%@include file="../common/aboutLeft.jsp"%>

        <div class="text-box">
            <div class="text-content" id="text-content">
                <h1 class="title">网站公告</h1>
                <ul class="clearfix mt20 new-list">

                    <c:if test="${requestScope.noticeList!=null}">
                        <c:forEach var="a" items="${noticeList}" >
                            <li class="clearfix list-item"><a href="<%=path%>/notice/initNotice/${a.nid}" title="${a.title}">${a.title}</a><span class="date"><fmt:formatDate value="${a.date}" pattern="yyyy-MM-dd"/></span></li>
                        </c:forEach>
                    </c:if>
                  	</ul>

                <div class="page">
                    <c:if test="${noticePager.total==0}"><li><div align="center">没有找到匹配的记录</div></li></c:if>
                    <c:if test="${noticePager.total>0}">

                            <div align="center">
                                <font size="5">页码${noticePager.pageNo}/${noticePager.pages} </font>
                                <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">首页</a>
                                <c:choose>
                                    <c:when test="${noticePager.pageNo - 1 > 0}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pageNo - 1}')">上一页</a>
                                    </c:when>
                                    <c:when test="${noticePager.pageNo - 1 <= 0}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">上一页</a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${noticePager.pages==0}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pageNo}')">下一页</a>
                                    </c:when>
                                    <c:when test="${noticePager.pageNo + 1 < noticePager.pages}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pageNo + 1}')">下一页</a>
                                    </c:when>
                                    <c:when test="${noticePager.pageNo + 1 >= noticePager.pages}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pages}')">下一页</a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${noticePager.pages==0}">
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pageNo}')">尾页</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a style="font-size:25px;text-decoration:none;" href="javascript:void(0);" onclick="page('${noticePager.pages}')">尾页</a>
                                    </c:otherwise>
                                </c:choose>
                                <font size="5">共${noticePager.total}条</font>
                            </div>

                    </c:if>



        </div>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</div>
</body>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script>

    function page(str){
        if(str==${noticePager.pageNo}&&str==1){
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if(str==${noticePager.pageNo}&&str==${noticePager.pages}){
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        $.post("/page/ad/"+str,
            function(data){
                window.location.href="/page/ad/"+str;
            });
    }
</script>
</html>
