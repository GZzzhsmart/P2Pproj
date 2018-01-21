<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审核结果</title>
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

        <style>
            /*获取验证码*/
            a.hqyzm{ float:left; background:#ea524a; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
            a.hqyzm:hover{color:#fff;background:#ff8882;}
            /*获取验证码后在倒计时中的样式*/
            a.hqyzmAfter{float:left; background:#c0c0c0; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
        </style>
        <script type="text/javascript">
            //<![CDATA[
            var flag = false;
            function sCode(xhr, status, args, args2) {
                if (!args.validationFailed) {
                    $("#sendCode").hide();
                    $("#sendCodeGrey").show();
                    /* if(flag && $("#sendCode").is(":hidden")){
                     return;
                     } */
                    flag = true;
                    var mobileNumber = $("#form\\:mobileNumber").val().replace(/(^\s*)|(\s*$)/g,"");
                    if("dx" == args2){
                        $("#mobileMsg").html(mobileNumber.substring(0,3) + "****" + mobileNumber.substring(7,11));
                        $("#authCodeMsg").css({"display": ""});
                        $("#authCodeMsg2").css({"display": "none"});
                    }else if("yy" == args2){
                        $("#mobileMsg2").html(mobileNumber.substring(0,3) + "****" + mobileNumber.substring(7,11));
                        $("#authCodeMsg").css({"display": "none"});
                        $("#authCodeMsg2").css({"display": ""});
                    }
                    timer("sendAuthCodeBtn1", {
                        "count" : 60,
                        "animate" : true,
                        initTextBefore : "后可重新操作",
                        initTextAfter : "秒",
                        callback:function(){
                            $("#sendCode").show();
                            $("#sendCodeGrey").hide();
                            flag = false;
                            $("#authCodeMsg").css({"display": "none"});
                            $("#authCodeMsg2").css({"display": "none"});
                        }
                    }).begin();
                }
            }
            //验证验证码是否为空
            function phoneValidate()
            {
                var authCode=$("#form\\:authCode").val();
                var nullFlag=(authCode=="");
                if(nullFlag)
                {
                    $("#form\\:authCode_message").remove();
                    var $span = $("<span id=form\:authCode_message class=error>请输入验证码</span>");
                    $("#authCodeErrorDiv").append($span);
                    return false;
                }

                return true;
            }
            $(document).ready(function(){
                var investorValiCodeError = $("#investorValiCodeError").val();
                if(investorValiCodeError.length > 0){
                    $("#form\\:formauthCode_message").remove();
                    var $span = $("<span id=form\:formauthCode_message class=error>"+investorValiCodeError+"</span>");
                    $("#authCodeErrorDiv").append($span);
                }
            });



            function showSpan(op)
            {
                $("body").append("<div id='mask'></div>");
                $("#mask").addClass("mask").css("display","block");

                $("#"+op).css("display","block");
            }

            function displaySpan(op){
                $("#mask").css("display","none");
                $("#"+op).css("display","none");
            }
            //]]>
        </script>
        <input id="investorValiCodeError" type="hidden" name="investorValiCodeError">
        <div class="personal-main">
            <div class="personal-pay">
                <h3><i>审核结果情况</i></h3>

                    <div class="pay-form">
                        <h6>审核结果</h6>
                        <ul>
                            <li>

                                结果：&nbsp;&nbsp;&nbsp;&nbsp;
                                <c:if test="${rzVipCheck.isok==0}">
                                    <font size="5" color="red"> 恭喜您，通过了！</font>
                                </c:if>
                                <c:if test="${rzVipCheck.isok==1}">
                                    <font size="5" color="red">不好意思，您未通过，请重新提交审核！</font>
                                </c:if>

                                <div id="xls"></div>
                            </li>
                            <li>
                               理由：&nbsp;&nbsp;&nbsp;&nbsp;
                               ${rzVipCheck.excute}
                            </li>


                        <ul>
                            <li>
                                <a href="<%=path%>/rzvip/rzvipaddView2"> <input type="button" name="" value="重新提交审核" style="border:none;" class="btn-paykh"></a>

                                <a href="<%=path%>/rzvip/findMesage"> <input type="button" name="" value="查看认证信息" style="border:none;" class="btn-paykh"></a>
                            </li>
                        </ul>
                    </div>

                <script type="text/javascript">
                    //<![CDATA[
                    //验证邮箱是否为空
                    function checkactiveEmailFormEmail()
                    {
                        var email=$("#activeEmail\\:activeEmailemail").val();
                        var nullFlag=(email=="");
                        if(nullFlag)
                        {
                            $("#activeEmail\\:activeEmailemail_message").remove();
                            var $span = $("<span id=activeEmail\:activeEmailemail_message class=error>请输入邮箱</span>");
                            $("#activeEmailemailErrorDiv").append($span);
                            return false;
                        }
                        else
                        {
                            var error=$("#activeEmailemailErrorDiv").text();
                            if(error=='请输入邮箱')
                                $("#activeEmail\\:activeEmailemail_message").remove();
                        }
                        return true;
                    }
                    //验证所有
                    function checkActiveEmailAll()
                    {
                        checkactiveEmailFormEmail();
                        var emailErrorFlag=$("#activeEmailemailErrorDiv").text()=="";
                        return emailErrorFlag;
                    }
                    //]]>
                </script>

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
</body>


</html>
