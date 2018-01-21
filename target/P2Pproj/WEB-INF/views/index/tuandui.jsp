<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>团队风采</title>
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
                    <li class="clearfix">
                        <a href="">
                            <img src="<%=path%>/static/images/2015062506.jpg" width="300" height="171">
                        </a>
                        <div class="record">
                            <h5>
                                <a href="#">服务民生</a>
                            </h5>
                            <p class="text">
                                设立公益书友会，斥资购买图书并向市民免费开放，这也和2015年政府工作报告提出要“倡导全民阅读 ，建设书香社会”的号召不谋而合。公益书友会将是一个交流互动的乐园，书友会将不定期举办多种活动，发挥石狮首家互联网金融公司的所长，帮助市民了解金融法规、投资理财等相关知识，为发展普惠金融做出自己的贡献。
                            </p>
                            <p class="time">活动时间：2015年6月</p>
                        </div>
                    </li>
                    <li class="clearfix">
                        <a href="">
                            <img src="<%=path%>/static/images/2015062506.jpg" width="300" height="171">
                        </a>
                        <div class="record">
                            <h5>
                                <a href="#">服务民生</a>
                            </h5>
                            <p class="text">
                                设立公益书友会，斥资购买图书并向市民免费开放，这也和2015年政府工作报告提出要“倡导全民阅读 ，建设书香社会”的号召不谋而合。公益书友会将是一个交流互动的乐园，书友会将不定期举办多种活动，发挥石狮首家互联网金融公司的所长，帮助市民了解金融法规、投资理财等相关知识，为发展普惠金融做出自己的贡献。
                            </p>
                            <p class="time">活动时间：2015年6月</p>
                        </div>
                    </li>
                    <li class="clearfix">
                        <a href="">
                            <img src="<%=path%>/static/images/2015062506.jpg" width="300" height="171">
                        </a>
                        <div class="record">
                            <h5>
                                <a href="#">服务民生</a>
                            </h5>
                            <p class="text">
                                设立公益书友会，斥资购买图书并向市民免费开放，这也和2015年政府工作报告提出要“倡导全民阅读 ，建设书香社会”的号召不谋而合。公益书友会将是一个交流互动的乐园，书友会将不定期举办多种活动，发挥石狮首家互联网金融公司的所长，帮助市民了解金融法规、投资理财等相关知识，为发展普惠金融做出自己的贡献。
                            </p>
                            <p class="time">活动时间：2015年6月</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
