<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资金记录</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <div class="personal-main">
            <div class="personal-money">
                <h3><i>资金记录</i></h3>

                <div class="personal-moneylist">
                    <div class="pmain-contitle">
                        <span class="pmain-title1 fb">交易时间</span>
                        <span class="pmain-title2 fb">类型</span>
                        <span class="pmain-title3 fb">收入</span>
                            <span class="pmain-title4 fb">支出</span>
                        <span class="pmain-title5 fb">操作</span>
                    </div>
                    <ul style="float:left;">
                        <c:forEach items="${obj}" var="d">
                            <li>
                                <span class="pmain-title1 pmain-height">${d.dateToStr}</span>
                                <span class="pmain-title2 pmain-height">
                                    <c:if test="${d.type==0}">充值</c:if>
                                    <c:if test="${d.type==1}">提现</c:if>
                                    <c:if test="${d.type==2}">回款</c:if>
                                    <c:if test="${d.type==3}">公司奖励</c:if>
                                    <c:if test="${d.type==4}">投资金额</c:if>
                                    <c:if test="${d.type==5}">收款</c:if>
                                    <c:if test="${d.type==6}">还款</c:if>
                                </span>
                                <span class="pmain-title3 pmain-height"><c:if test="${d.in==null}">0.00</c:if>${d.in}</span>
                                <span class="pmain-title4 pmain-height"> <c:if test="${d.out==null}">0.00</c:if>${d.out}</span>
                                <span class="pmain-title5 pmain-height"><a style="text-decoration:none;" href="javascript:;" onclick="del('${d.id}','/recommend/remove')">删除</a></span>
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
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script src="<%=path%>/static/js/pageJs/zijin.js"></script>
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
        $.post("/page/zijin", { pageNo: str},
            function(data){
                window.location.href="/page/zijin?pageNo="+str;
            });
    }
</script>
</html>
