<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开通第三方</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
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
        <style>
            /*获取验证码*/
            a.hqyzm{ float:left; background:#ea524a; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
            a.hqyzm:hover{color:#fff;background:#ff8882;}
            /*获取验证码后在倒计时中的样式*/
            a.hqyzmAfter{float:left; background:#c0c0c0; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
        </style>
        <script type="text/javascript">

        function disanfang() {
            var rname = $("#rname").val();
            var idno = $("#idno").val();
            if (rname=='') {
                layer.alert('请输入您的真实姓名',{icon: 3});
            } else if (idno=='') {
                layer.alert('请输入您的身份证号码',{icon: 3});
            } else {
                layer.open({
                    type: 2,
                    title: '绑定银行卡',
                    shadeClose: true,
                    shade: false,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['893px', '600px'],
                    content: <%=path%>'/page/guodu'
                });
            }
        }


        </script>
        <input id="investorValiCodeError" type="hidden" name="investorValiCodeError">
        <div class="personal-main">
            <div class="personal-pay">
                <h3><i>开通第三方账户</i></h3>
                <form id="form" name="form" method="post" action="" enctype="application/x-www-form-urlencoded">
                    <div class="pay-notice">
                        <p>开通第三方资金托管账户的信息将提交至<a href="http://www.sumapay.com/" target="_blank">丰付支付</a>网站执行，</p>
                        <p><a href="http://www.sumapay.com/" target="_blank">丰付支付</a>系统将为您分配唯一用户ID（格式为：TG_用户名），并与您亿人宝账户自动绑定，您无需修改和记忆。 </p>
                    </div>
                    <div class="pay-form">
                        <h6>请输入您的身份证信息</h6>
                        <ul>
                            <li>
                                <label >真实姓名</label>
                                <input type="text" id="rname" class="pay-txt" maxlength="16" value="${users.rname} "placeholder="您的真实姓名">
                                <div id="realnameErrorDiv"></div>
                            </li>
                            <li>
                                <label >身份证号</label>
                                <input type="text" id="idno" class="pay-txt" maxlength="18" value="${users.idno}" placeholder="您的身份证号">
                                <div id="idCardErrorDiv">
                                    <p style="margin-top:10px;">身份证信息认证后将不可修改，请您仔细填写</p>
                                </div>
                            </li>
                        </ul>
                        <h6>邮箱已绑定</h6>
                        <ul>
                            <li>
                                <label>邮箱</label>
                                <label id="form:email">${users.email}</label>
                            </li>
                        </ul>
                        <h6>手机号已绑定</h6>
                        <ul>
                            <li>
                                <label>手机号</label>
                                <label>${users.phone}</label>
                            </li>
                            <li>
                                <input type="button" name="" value="开户" onclick="disanfang()" style="border:none;" class="btn-paykh">
                            </li>
                        </ul>
                    </div>
                </form>
                <div class="pay-tipcon"> 1、为切实保障投资人的利益，亿人宝将理财资金托管在<a href="http://www.sumapay.com/" target="_blank">丰付第三方支付</a>平台。平台是2012年6月获批中国人民银行支付许可证和中国证监会基金支付许可的第三方支付公司，在金融支付领域业界领先地位。详情请登录<a href="http://www.sumapay.com/" target="_blank">丰付支付</a>官方网站查看。<br>
                    2、根据相关法律规定，亿人宝在开通资金托管账户时，需要验证您的身份信息。该信息一经设置，无法修改，请慎重选择。为了确保您可以顺利提现，请确认您拥有一张使用该身份证开户的有效储蓄卡。<br>
                    3、亿人宝将最大限度的尊重和保护您的个人隐私，详情请阅读<a href="#" target="_blank">《亿人宝隐私条款》</a>。<br>
                    4、您在开通第三方账号过程中，如有遇到问题，可以查看理财帮助，也可以联系我们的客服进行咨询，咨询电话：400-999-8850。 </div>
            </div>
            <script type="text/javascript">
                //<![CDATA[
                if(window.ActiveXObject)
                {
                    var browser=navigator.appName
                    var b_version=navigator.appVersion
                    var version=b_version.split(";");
                    var trim_Version=version[1].replace(/[ ]/g,"");
                    if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0")
                    {
                        $("#form\\:sendAuthCodeBtn2").css("display","block");
                        $("#form\\:sendAuthCodeBtn").css("display","none");
                    }
                }
                function sCode2(){
                    var mobile = $("#form\\:mobileNumber").val();
                    var mobileRegex="^1[3|4|5|7|8][0-9]{9}$";
                    var mobilePattern = new RegExp(mobileRegex);
                    var mobileFlag=mobilePattern.test(mobile);

                    if(!mobileFlag){
                        return;
                    }

                    $("#sendCode").hide();
                    $("#sendCodeGrey").show();
                    if(flag && $("#sendCode").is(":hidden")){
                        return;
                    }
                    flag = true;
                    timer("sendAuthCodeBtn1", {
                        "count" : 60,
                        "animate" : true,
                        initTextBefore : "后可重新操作",
                        initTextAfter : "秒",
                        callback:function(){
                            $("#sendCode").show();
                            $("#sendCodeGrey").hide();
                            flag = false;
                        }
                    }).begin();
                }
                var ua = navigator.userAgent;
                if(ua.indexOf("Windows NT 5")!=-1) {
                    if(window.ActiveXObject)
                    {
                        var browser=navigator.appName
                        var b_version=navigator.appVersion
                        var version=b_version.split(";");
                        var trim_Version=version[1].replace(/[ ]/g,"");
                        if(browser=="Microsoft Internet Explorer" && (trim_Version=="MSIE8.0" || trim_Version=="MSIE7.0"))
                        {
                            $("#form\\:sendAuthCodeBtn2").css("display","block");
                            $("#form\\:sendAuthCodeBtn").css("display","none");
                        }
                    }
                }

                var second = 0;
                var internal;
                /** 校验修改手机验证码 */
                function validateSMS(){
                    $("#form\\:authCode_message").remove();
                    var mobileNumber = $("#form\\:mobileNumber").val();
                    if(mobileNumber == '请输入手机'){
                        return;
                    }
                    var returnResult = false;
                    $.ajax({
                        url: "/valiSms",
                        async:false,
                        data:{
                            mobileNumber:mobileNumber
                        },
                        success: function(data){
                            if(data.flag == 'NO'){
                                $("#form\\:authCode_message").remove();
                                var $span = $("<span id=form\:authCode_message class=alerterror>点击过于频繁,请<b>"+data.second+"</b>秒后重试</span>");
                                $("#authCodeErrorDiv").append($span);
                                second = data.second;
                                clearInterval(internal);
                                internal = setInterval(function(){
                                    if(second == 0){
                                        $("#form\\:authCode_message").remove();
                                    }else{
                                        second = second -1;
                                        $("#form\\:authCode_message").find('b').html(second);
                                    }
                                },1000);
                                returnResult = false;
                            }else if(data.flag == 'NO1'){
                                $("#form\\:authCode_message").remove();
                                var $span = $("<span id=form\:authCode_message class=alerterror>"+data.smsVali+"</span>");
                                $("#authCodeErrorDiv").append($span);
                                returnResult = false;
                            }else{
                                returnResult = true;
                            }
                        }
                    });
                    return returnResult;
                }
                //]]>
            </script>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
<jsp:include page="../common/bootstraptablejs.jsp"/>
</body>
</html>
