<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户还款详情信息</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox-title">
        <a class="J_menuItem" href="<%=path%>/page/users"><h5>返回列表</h5></a>
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
            <table class="table">
                <thead>
                <tr>
                    <th>还款人</th>
                    <th>产品名称</th>
                    <th>标种名称</th>
                    <th>已还期数</th>
                    <th>总期数</th>
                    <th>应还本息</th>
                    <th>已还本息</th>
                    <th>应还利息</th>
                    <th>已还利息</th>
                    <th>应还本金</th>
                    <th>已还本金</th>
                    <th>应还罚息</th>
                    <th>已还罚息</th>
                    <th>逾期次数</th>
                    <th>第几期</th>
                    <th>还款状态</th>
                </tr>
                </thead>
                <c:forEach items="${obj}" var="d">
                    <tbody>
                    <tr>
                        <td>${d.rname}</td>
                        <td>${d.cpname}</td>
                        <td>${d.bzname}</td>
                        <td>${d.rnum}</td>
                        <td>${d.tnum}</td>
                        <td>${d.ybx}</td>
                        <td>${d.rbx}</td>
                        <td>${d.ylx}</td>
                        <td>${d.rlx}</td>
                        <td>${d.ybj}</td>
                        <td>${d.rbj}</td>
                        <td>${d.yfx}</td>
                        <td>${d.rfx}</td>
                        <td>${d.yucount}</td>
                        <td>${d.djq}</td>
                        <td>
                            <c:if test="${d.state==0}"><a style="color: red;">未还款</a></c:if>
                            <c:if test="${d.state==1}"><a style="color: green;">已还款</a></c:if>
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
        $.post("/hk/hkDetail", {
                pageNo: str},
            function(data){
                window.location.href="/hk/hkDetail?pageNo="+str;
            });
    }
</script>

</body>
</html>
