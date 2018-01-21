<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>借款审核结果</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <link href="<%=path%>/static/plugin/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>


<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">

        <%@include file="../common/leftList.jsp"%>

        <input id="investorValiCodeError" type="hidden" name="investorValiCodeError">
        <div class="personal-main">
            <div class="personal-money">
                <h3><i>借款审核结果</i></h3>

            <div class="personal-moneylist">
                <div class="pmain-contitle">
                    <span class="pmain-title1 fb">投资标种</span>
                    <span class="pmain-title2 fb">产品名称</span>
                    <span class="pmain-title3 fb">借款金额</span>
                    <span class="pmain-title4 fb">还款方式</span>
                    <span class="pmain-title5 fb">操作</span>
                </div>
                <ul style="float:left;">
                    <c:forEach items="${borrowApply}" var="d">
                        <li>
                            <span class="pmain-title1 pmain-height">${d.bzname}</span>
                            <span class="pmain-title2 pmain-height">
                                    ${d.cpname}
                                </span>
                            <span class="pmain-title3 pmain-height">${d.money}</span>
                            <span class="pmain-title4 pmain-height">
                                <c:if test="${d.sid==1}">等额本金</c:if>
                                  <c:if test="${d.sid==2}">等额本息</c:if>
                                  <c:if test="${d.sid==3}">先息后本</c:if>
                                  <c:if test="${d.sid==4}">一次性还本付息</c:if>
                            </span>
                            <span class="pmain-title5 pmain-height">
                                <c:if test="${d.state==0}">通过</c:if>
                                <c:if test="${d.state==1}">审核中</c:if>
                                <c:if test="${d.state==2}">满标</c:if>
                                <c:if test="${d.state==3}"><a style="text-decoration:none;" href="${request.getContextPath}/borrowapply/update_page/${d.baid}" >不通过</a></c:if>
                        </li>
                    </c:forEach>
                    <c:if test="${page.total==0}"><li><div align="center">没有找到匹配的记录</div></li></c:if>
                    <c:if test="${page.total>0}">
                        <li>
                            <div align="center">
                                <font size="2">页码${page.pageNo}/${page.pages} </font>
                                <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">首页</a>
                                <c:choose>
                                    <c:when test="${page.pageNo - 1 > 0}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo - 1}')">上一页</a>
                                    </c:when>
                                    <c:when test="${page.pageNo - 1 <= 0}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page(1)">上一页</a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${page.pages==0}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo}')">下一页</a>
                                    </c:when>
                                    <c:when test="${page.pageNo + 1 < page.pages}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo + 1}')">下一页</a>
                                    </c:when>
                                    <c:when test="${page.pageNo + 1 >= page.pages}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pages}')">下一页</a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${page.pages==0}">
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pageNo}')">尾页</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);" onclick="page('${page.pages}')">尾页</a>
                                    </c:otherwise>
                                </c:choose>
                                <font size="2">共${page.total}条</font>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>

            </div>

        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
<script src="<%=path%>/static/plugin/bootstrap/js/plugins/layer/layer.js"></script>
<script>
    function del(id, url) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: url + '?id=' + id,
                dataType: 'json',
                success: function (data) {
                    if (data.message == '删除成功') {
                        layer.msg(data.message, {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1000});
                    }
                },
                error: function (data) {
                    console.log(data.msg);
                }
            });
        });
    }
    function page(str){
        if(str==${page.pageNo}&&str==1){
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if(str==${page.pageNo}&&str==${page.pages}){
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        $.post("/borrowapply/shenqin", { pageNo: str},
            function(data){
                window.location.href="/borrowapply/shenqin?pageNo="+str;
            });
    }
</script>

</html>
