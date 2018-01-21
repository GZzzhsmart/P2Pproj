<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户收款详情信息</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox-title">
        <a class="J_menuItem" href="<%=path%>/tz/page"><h5>返回列表</h5></a>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#">选项1</a>
                </li>
                <li><a href="#">选项2</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="ibox-content">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>应收本息</th>
                <th>已收本息</th>
                <th>应收利息</th>
                <th>已收利息</th>
                <th>应收本金</th>
                <th>已收本金</th>
                <th>已还期数</th>
                <th>总期数</th>
                <th>奖励金额</th>
                <th>第几期</th>
                <th>收款状态</th>
            </tr>
            </thead>
            <c:forEach items="${obj}" var="d">
                <tbody>
                <tr>
                    <td>${d.ybx}</td>
                    <td>${d.rbx}</td>
                    <td>${d.ylx}</td>
                    <td>${d.rlx}</td>
                    <td>${d.ybj}</td>
                    <td>${d.rbj}</td>
                    <td>${d.rnum}</td>
                    <td>${d.tnum}</td>
                    <td>${d.djq}</td>
                    <td>${d.fmoney}</td>
                    <td>${d.djq}</td>
                    <td>
                        <c:if test="${d.state==1}"><a style="color: red;">未收款</a></c:if>
                        <c:if test="${d.state==2}"><a style="color: green;">已收款</a></c:if>
                        <c:if test="${d.state==3}"><a style="color: cyan;">确认收款</a></c:if>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
            <%--<c:if test="${page.total==0}"><li><div align="center">没有找到匹配的记录</div></li></c:if>--%>
            <%--<c:if test="${page.total>0}">--%>
                <%--<ul class="pagination">--%>
                    <%--<li>--%>
                        <%--<div align="center">--%>
                            <%--<font size="2">页码${page.pageNo}/${page.pages} </font>--%>
                            <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">首页</a>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${page.pageNo - 1 > 0}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo - 1}')">上一页</a>--%>
                                <%--</c:when>--%>
                                <%--<c:when test="${page.pageNo - 1 <= 0}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">上一页</a>--%>
                                <%--</c:when>--%>
                            <%--</c:choose>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${page.pages==0}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo}')">下一页</a>--%>
                                <%--</c:when>--%>
                                <%--<c:when test="${page.pageNo + 1 < page.pages}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo + 1}')">下一页</a>--%>
                                <%--</c:when>--%>
                                <%--<c:when test="${page.pageNo + 1 >= page.pages}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pages}')">下一页</a>--%>
                                <%--</c:when>--%>
                            <%--</c:choose>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${page.pages==0}">--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo}')">尾页</a>--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                    <%--<a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pages}')">尾页</a>--%>
                                <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                            <%--<font size="2">共${page.total}条</font>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</c:if>--%>
        </table>
    </div>
</div>

<script>
    function page(str){
        if(str==${page.pageNo}&&str==1){
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if(str==${page.pageNo}&&str==${page.pages}){
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        $.post("/sk/skDetail", {
                pageNo: str},
            function(data){
                window.location.href="/sk/skDetail?pageNo="+str;
            });
    }
</script>

</body>
</html>
