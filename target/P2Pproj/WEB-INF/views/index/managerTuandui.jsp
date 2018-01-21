<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>平台管理团队</title>
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
                <h1 class="title">管理团队</h1>
                <p class="mt20 cn_line">
                    亿人宝以金融创新基因吸引了来自国内五百强知名企业的业界精英，目前团队成员年轻朝气、充满活力，热爱新事物，勇于接受新挑战，团队成员有信心和决心，要用人人共享的理念在金融改革的浪潮中乘风破浪，要为普通大众创造财富增值的机会，为诚信经营者提供高效便捷的金融服务。
                </p>
                <div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
                    <div class="img fl" style="width:130px;">
                        <img src="<%=path%>/static/images/13.jpg" alt="">
                    </div>
                    <div class="fl" style="width:790px;margin-left:20px;">
                        <p>
                            <span style="font-size:18px;color:#0aaae1;">曾志湖</span>
                            <span style="color:#0aaae1;">CEO</span>
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            2017年与合伙人共同创建互联网金融服务平台——亿人宝
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            感言：风控的宗旨在于对风险的预知和防范
                        </p>
                    </div>
                </div>
                <div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
                    <div class="img fl" style="width:130px;">
                        <img src="<%=path%>/static/images/11.jpg" alt="">
                    </div>
                    <div class="fl" style="width:790px;margin-left:20px;">
                        <p>
                            <span style="font-size:18px;color:#0aaae1;">赖勇建</span>
                            <span style="color:#0aaae1;"> 副总裁兼任高级软件工程师</span>
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            拥有3年的国内大型项目工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            曾主打开发过金融理财管理系统和视频教学软件
                        </p>
                    </div>
                </div>
                <div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
                    <div class="img fl" style="width:130px;">
                        <img src="<%=path%>/static/images/23.jpg" alt="">
                    </div>
                    <div class="fl" style="width:790px;margin-left:20px;">
                        <p>
                            <span style="font-size:18px;color:#0aaae1;">赖国荣</span>
                            <span style="color:#0aaae1;">CTO</span>
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            曾先后在中国农业银行、招商银行、兴业银行担任高管职务，拥有16年的国内大型银行工作经历，对客户信用风险评估、产品定价机制和市场风险管理策略具有深入的研究，风险管理经验十分丰富。
                        </p>
                        <p style="font-size:16px;line-height:32px;color:#595757">
                            2017年与合伙人共同创建互联网金融服务平台——亿人宝
                        </p>
                    </div>
                </div>
                <h1 class="title">组织机构</h1><br>
                <p>
                    <img src="<%=path%>/static/images/org.png" alt="亿人宝-组织机构" title="亿人宝-组织机构">
                </p>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
