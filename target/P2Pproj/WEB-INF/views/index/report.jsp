<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>媒体报道</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
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
                <ul class="r-list">
                    <c:forEach items="${mediaPager.rows}" var="s">
                        <li class="clearfix">
                            <a href="">
                                <img src="<%=path%>/${s.pic}" width="300" height="171">
                            </a>
                            <div class="record">
                                <h5>
                                    <a href="<%=path%>/media/initMedia/${s.mid}">${s.title}</a>
                                </h5>
                                <p class="text" id="contentToSub">
                                    <c:if test="${s.content.toString().length()>170}">
                                        ${s.content.toString().substring(0,170)}......
                                    </c:if>
                                    <c:if test="${s.content.toString().length()<=170}">
                                        ${s.content}
                                    </c:if>
                                </p>
                                <p class="time">报道时间:${s.date}</p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%--分页条开始--%>
                <c:if test="${mediaPager.total==0}">
                    <div align="center"><h5>没有找到匹配的记录</h5></div>
                </c:if>
                <c:if test="${mediaPager.total>0}">
                <div class="pagination clearfix mrt30">
                   <span class="page" style="font-size: 19px;">
                     <font size="4" style="margin-left: 10px">页码${mediaPager.pageNo}/${mediaPager.pages}&nbsp;&nbsp;&nbsp;&nbsp;</font>
                     <a href="javascript:void(0);" onclick="page(1)">首页</a>
                     <c:choose>
                         <c:when test="${mediaPager.pageNo - 1 >0}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pageNo -1}')">上一页</a>&nbsp;
                         </c:when>
                         <c:when test="${mediaPager.pageNo -1 <=0}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page(1)">上一页</a>&nbsp;
                         </c:when>
                     </c:choose>
                      <c:if test="${mediaPager.pages > 0}">
                          <a class="curr" style="margin-left: 10px" href="javascript:void(0);" onclick="page(1)">1</a>
                      </c:if>
                      <c:if test="${mediaPager.pages > 1}">
                          <a class="curr" style="margin-left: 10px" href="javascript:void(0);" onclick="page(2)">2</a>
                      </c:if>
                      <c:if test="${mediaPager.pages > 2}">
                          <a class="curr" style="margin-left: 10px" href="javascript:void(0);" onclick="page(3)">3</a>
                      </c:if>
                      <c:if test="${mediaPager.pages > 3}">
                          <a class="curr" style="margin-left: 10px" href="javascript:void(0);" onclick="page(4)">4</a>
                      </c:if>
                      <c:if test="${mediaPager.pages > 4}">
                          <a class="curr" style="margin-left: 10px" href="javascript:void(0);" onclick="page(5)">5</a>
                      </c:if>
                       <c:choose>
                         <c:when test="${mediaPager.pages == 0}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pageNo}')">下一页</a>
                         </c:when>
                         <c:when test="${mediaPager.pageNo + 1 < mediaPager.pages}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pageNo + 1}')">下一页</a>
                         </c:when>
                         <c:when test="${mediaPager.pageNo + 1 >= mediaPager.pages}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pages}')">下一页</a>
                         </c:when>
                     </c:choose>
                     <c:choose>
                         <c:when test="${mediaPager.pages == 0}">
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pageNo}')">尾页</a>&nbsp;
                         </c:when>
                         <c:otherwise>
                             <a href="javascript:void(0);" style="margin-left: 10px" onclick="page('${mediaPager.pages}')">尾页</a>&nbsp;
                         </c:otherwise>
                     </c:choose>
                         <em style="margin-left: 10px">共${mediaPager.total}条&nbsp;</em></span>
                    </div>
                </c:if>
                <%--分页条结束--%>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
<jsp:include page="../common/bootstraptablejs.jsp"/>

<script>
    function page(str){
        if(str==${mediaPager.pageNo}&&str==1){
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if(str==${mediaPager.pageNo}&&str==${mediaPager.pages}){
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        $.post("/page/report/"+str,
            function(data){
                window.location.href="/page/report/"+str;
            });
    }
</script>

</body>
</html>
