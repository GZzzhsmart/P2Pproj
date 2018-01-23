<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>推荐中心</title>
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
            <div class="personal-back">
                <div style="position: relative;font-size: 18px;color: #333;border-bottom: 1px solid #DCDCDC;width: 880px;padding-top: 25px;height: 35px;">
                        <span style="font-size: 18px;padding-right: 15px;">
                            <a href="/recommend/tuijian/">推荐好友</a>
                        </span>
                    <span style="font-size:18px;border-bottom: 2px solid #28A7E1;border-padding-bottom: 40px;">
                            <a href="/recommend/listByUid/1/0">推荐列表</a>
                        </span>
                </div>
                <br/>
                <div class="back-choosedate"><span class="choosedate">筛选时间</span>
                    <select id="byDate" name="byDate"
                            style="border: 1px solid #e5e6e7;padding: 6px 12px;font-size: 14px;">
                        <option value="0" ${byDate>5 && byDate<2 ? 'selected = "selected"' : '' }>全部</option>
                        <option value="2" ${byDate==2 ? 'selected = "selected"' : '' }>今天</option>
                        <option value="3" ${byDate==3 ? 'selected = "selected"' : '' }>最近一周</option>
                        <option value="4" ${byDate==4 ? 'selected = "selected"' : '' }>一个月</option>
                        <option value="5" ${byDate==5 ? 'selected = "selected"' : '' }>六个月</option>
                    </select>
                    <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only btn-ok btn-235 txt-right"
                            onclick="byDate();"><span class="ui-button-text ui-c">查询</span></button>
                </div>
                <br/>
                <div class="personal-backlist">
                    <div class="pmain-contitle">
                        <%--<span class="pmain-titleproject fb">好友姓名</span>
                        pmain-* fb
                        *:titleproject,titledate,titlemoney,titletype
                        --%>
                        <span class="pmain-titledate fb">好友姓名</span>
                        <span class="pmain-titleproject fb">注册时间</span>
                        <span class="pmain-titlemoney fb">奖励金额</span>
                        <span class="pmain-titletype fb">操作</span>
                    </div>
                    <ul style="float:left;">
                        <c:forEach items="${obj}" var="d">
                            <li>
                                <span class="pmain-titledate fb">${d.rname}</span>
                                <span class="pmain-titleproject fb">${d.dateToStr}</span>
                                <span class="pmain-titlemoney fb">￥${d.money}【现金劵】</span>
                                <span class="pmain-titletype fb"><a style="text-decoration:none;" href="javascript:;"
                                                                    onclick="del('${d.id}','/remend/remove')">删除</a></span>
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
                                       onclick="page(1)">首页</a>
                                    <c:choose>
                                        <c:when test="${page.pageNo - 1 > 0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo - 1}')">上一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo - 1 <= 0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page(1)">上一页</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.pages==0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo}')">下一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo + 1 < page.pages}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo + 1}')">下一页</a>
                                        </c:when>
                                        <c:when test="${page.pageNo + 1 >= page.pages}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pages}')">下一页</a>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${page.pages==0}">
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pageNo}')">尾页</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a style="font-size:15px;text-decoration:none;" href="javascript:void(0);"
                                               onclick="page('${page.pages}')">尾页</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <font size="2">共${page.total}个好友 </font>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <br/>

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

    function page(str) {
        if (str ==${page.pageNo} && str == 1) {
            layer.msg("当前已经是第一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        if (str ==${page.pageNo} && str ==${page.pages}) {
            layer.msg("当前已经是最后一页了哦！", {icon: 2, time: 1000});
            return false;
        }
        $.post("/recommend/listByUid", {pageNo: str},
            function (data) {
                window.location.href = "/recommend/listByUid/" + str+"/0";
            });
    }

    function byDate() {
        window.location.href = "/recommend/listByUid/1/" + $("#byDate").val();
    }
</script>

</body>
</html>

