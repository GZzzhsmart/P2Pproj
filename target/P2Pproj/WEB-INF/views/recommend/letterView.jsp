<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>消息中心</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="<%=path%>/static/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <%--layui弹窗居中--%>
    <link href="<%=path%>/static/plugin/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp" %>

<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp" %>
        <div class="personal-main">
            <div class="personal-xtxx">
                <h3><i>消息中心</i></h3>
                <div id="pxtxx-tab" class="pxtxx-tab">
                    <ul>
                        <c:choose>
                            <c:when test="${lState==0}">
                                <li><a href="javascript:void(0);" onclick="page(1,4);"
                                       style="padding:5px 22px;display:block;" title="全部">全部</a></li>
                                <li class="on"><a href="javascript:void(0);"
                                                  style="color:#fff;padding:5px 22px;display:block;" title="未读">未读</a>
                                </li>
                                <li><a href="javascript:void(0);" onclick="page(1,1);"
                                       style="padding:5px 22px;display:block;" title="已读">已读</a></li>
                            </c:when>
                            <c:when test="${lState==1}">
                                <li><a href="javascript:void(0);" onclick="page(1,4);"
                                       style="padding:5px 22px;display:block;" title="全部">全部</a></li>
                                <li><a href="javascript:void(0);" onclick="page(1,0);"
                                       style="padding:5px 22px;display:block;" title="未读">未读</a></li>
                                <li class="on"><a href="javascript:void(0);"
                                                  style="color:#fff;padding:5px 22px;display:block;" title="已读">已读</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="on"><a href="javascript:void(0);"
                                                  style="color:#fff;padding:5px 22px;display:block;" title="全部">全部</a>
                                </li>
                                <li><a href="javascript:void(0);" onclick="page(1,0);"
                                       style="padding:5px 22px;display:block;" title="未读">未读</a></li>
                                <li><a href="javascript:void(0);" onclick="page(1,1);"
                                       style="padding:5px 22px;display:block;" title="已读">已读</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <div class="pxtxx-title">
                    <span class="pxtxx-type ml46">消息类型</span>
                    <span class="pxtxx-con">标题</span>
                    <span class="pxxtx-date">发送时间</span>
                </div>
                <div class="pxtxx-list">
                    <ul style="float:left;">
                        <c:forEach items="${obj}" var="d">
                            <li>
                                <span class="pxtxx-type ml46">${d.lState}</span>
                                <span class="pxtxx-con">${d.title}</span>
                                <span class="pxxtx-date">${d.date}</span>
                            </li>
                        </c:forEach>
                        <!--<div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
                                                      <img src="images/nondata.png" width="60" height="60"><br><br>
                                                     暂无回款计划</div>-->
                        <c:if test="${page.total==0}">
                            <li>
                                <div align="center">没有找到匹配的记录</div>
                            </li>
                        </c:if>
                        <c:if test="${page.total>0}">
                            <li>
                                <div align="center">
                                    <font size="2">页码${page.pageNo}/${page.pages} </font>
                                    <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                       onclick="page(1,3)">首页</a>
                                    <c:choose>
                                        <c:when test="${page.pageNo - 1 > 0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo - 1}',3)">上一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo - 1 <= 0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page(1,3)">上一页</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.pages==0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo}',3)">下一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo + 1 < page.pages}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo + 1}',3)">下一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo + 1 >= page.pages}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pages}',3)">下一页</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.pages==0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo}',3)">尾页</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pages}',3)">尾页</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <font size="2">共${page.total}个好友 </font>
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
</html>
<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/plugin/bootstrap/js/plugins/layer/layer.js"></script>

<script>
    function doSearch() {
        alert($("#select-date").val());
    }

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

    function page(str, lState) {
        if (lState == 3) {
            lState =${lState};
        }
        if (str ==${page.pageNo} && str == 1 && lState ==${lState}) {
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if (str ==${page.pageNo} && str ==${page.pages} && lState ==${lState}) {
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        window.location.href = "/letter/listByUid/" + str + "/" + lState;
    }
</script>

</body>
</html>

