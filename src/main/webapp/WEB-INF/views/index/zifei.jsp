<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资费说明</title>
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
                <h1 class="title">资费说明</h1>
                <p class="mt10 cn_line">
                    <strong>一、投资者居间服务费：</strong> <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 投资者在收回借款时，网站将相应收取居间服务费，居间服务费为借款利息的10%，从每期还款中直接扣除。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 亿人宝郑重承诺：如投资者未能获得利息，亿人宝将启动“赔付宝”本息安全保障计划，按照《“赔付宝”资金使用规则》对投资者的本金及利息进行垫付，除居间服务费外，网站不向投资人收取其他费用。
                </p>
                <p>
                    <br>
                </p>
                <p class="mt10 cn_line">
                    <strong>二、充值费和取现费：</strong><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 充值费用：<span style="color:#e53333;">所有用户充值全部免费</span>。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 提现费用：亿人宝不向平台会员收取任何提现费用，仅代为收取第三方平台（环迅支付）应缴纳的提现费用。 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;普通会员提现时按照额度，每笔收取提现金额的千分之三（0.3%），上不封顶。 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#e53333;">亿人宝VIP会员缴纳年费后，将免费提现</span>，由亿人宝支付应向第三方平台（环迅支付）缴纳的提现费用。
                </p>
                <p>
                    <br>
                </p>
                <p class="mt10 cn_line">
                    <strong>三、成为会员：</strong> <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 凡是在亿人宝平台注册的用户，自动成为亿人宝普通会员，<span style="color:#e53333;">普通会员免会员费。</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 普通会员可在缴纳会员费后升级为VIP会员，会员费每年为500元。 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. VIP会员享受取现免费、优先办理业务、优先本金或本息垫付、月度电子对账单发送等服务。 <br>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
