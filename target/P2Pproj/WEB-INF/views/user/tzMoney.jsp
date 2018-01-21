<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>投资</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>

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
            <div class="personal-pay">
                <h3><i>投标</i></h3>
                <form id="form" name="form" method="post" action="<%=path%>/tz/ltzSave" >

                    <div class="pay-form">
                        <h6>投资</h6>
                        <ul>
                            <li>
                                <label >资金</label>
                                <input type="text" class="pay-txt" id="money" name="money"   placeholder="请输入您的资金">

                            </li>

                        </ul>

                        <ul>
                            <li>
                                <input type="submit" name="" value="提交" style="border:none;" class="btn-paykh">
                            </li>
                        </ul>
                    </div>
                </form>

            </div>

        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>


</html>
