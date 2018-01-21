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
                        <li><a href="javascript:void(0);" onclick="empty();"
                               style="background:#FF5722;color:white;padding:5px 22px;display:block;" title="清空已读">清空已读</a>
                        </li>
                    </ul>
                </div>
                <div class="pxtxx-title">
                    <span class="pxtxx-con ml46">标题</span>
                    <span class="pxtxx-type">消息状态</span>
                    <span class="pxxtx-date">发送时间</span>
                </div>
                <div class="pxtxx-list">
                    <ul style="float:left;">
                        <c:forEach items="${obj}" var="d">
                            <li>
                                <span class="pxtxx-con ml46"><a href="javascript:void(0);"
                                                                onclick="checkContent('${d.lid}','${d.title}','${d.dateToStr}');">${d.title}</a></span>
                                <c:if test="${d.lState==0}"><span class="pxtxx-type"
                                                                  style="color:#FF6666">未读</span></c:if>
                                <c:if test="${d.lState==1}"><span class="pxtxx-type"
                                                                  style="color:#0caffe;">已读</span></c:if>
                                </span>
                                <span class="pxxtx-date">${d.dateToStr}</span>
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
                                    <font size="2">共${page.total}条消息 </font>
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
    function checkContent(letterId, title, date) {
        $.post(
            "/letter/checkContent",
            {
                letterId: letterId
            },
            function (data) {
                layer.open({
                    type: 1,
                    title: title,
                    skin: 0, //加上边框
                    area: ['420px', '240px'], //宽高
                    content: '<br/><p style="text-indent : 20px; font-family:微软雅黑;font-size: 16px;">' + data + '</p><br/><br/><br/><p style="text-align:right;">' + date + '</p>',
                    end: function () {
                        location.reload();
                    }
                });

            }, "json"
        );
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

    function empty() {
        layer.confirm('确认要清空已读消息吗？', function () {
            $.ajax({
                type: 'POST',
                url: "/letter/empty",
                dataType: 'json',
                success: function (data) {
                    if (data.message == '删除成功') {
                        layer.msg(data.message, {
                            icon: 1, time: 1000, end: function () {
                                location.reload();
                            }
                        });
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1000});
                    }
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>

</body>
</html>

