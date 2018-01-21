<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>关于我们平台</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<!--关于我们-->
<div class="bg">
    <div class="contain" id="tabs" style="margin:0 auto;">
       <%@include file="../common/aboutLeft.jsp"%>
        <div class="text-box">
            <div class="text-content" id="text-content">
                <h1 class="title">公司简介</h1>
                <p class="mt20 cn_line"> 亿人宝（www.yirenbao.com）为安徽省亿人宝投资管理有限公司旗下的互联网金融服务平台，创办于2015年。安徽省亿人宝投资管理有限公司是经工商行政管理局批准，专业从事“金融服务”业务的公司。<br>
                </p>
                <p class="cn_line mt20"> 亿人宝（www.yirenbao.com）作为安徽省内实行真正资金第三方托管的互联网金融平台，旨在利用互联网技术，创新金融产品与服务，为大众投资者提供安全、稳健、平民化的理财途径，为中小微企业及创业个人提供快速、便捷、低成本的融资渠道。通过互联网与传统金融相结合，扶持中小微企业成长，助力地方实体经济，推动金融创新。<br>
                </p>
                <p class="cn_line mt20"> 在互联网金融发展迅猛的今天，亿人宝经营团队凭借在银行业多年的从业经验，坚持走差异化路线，立足本土市场，突出行业特色，坚持信贷投向与当地最具潜力的产业和最有发展前景的实业挂钩。通过完善的信用评估及风控体系，亿人宝真正做到安全、透明、专业，在使信贷业务长期、稳健、可持续发展的同时，让“大众金融快捷定制”的目标得以实现。 </p>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>

</body>
</html>
