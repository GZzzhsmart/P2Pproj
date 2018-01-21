<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="<%=path%>/static/css/common.css" rel="stylesheet"/>
    <link href="<%=path%>/static/css/register.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp" %>
<!--注册-->
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">注册账户</div>
        <div class="registerLc1">
            <p class="p1">填写账户信息</p>
            <p class="p2">验证手机信息</p>
            <p class="p3">注册成功</p>
        </div>
        <form id="registerForm">
            <div class="registerCont">
                <ul>
                    <li>
                        <span class="dis">用户名:</span>
                        <input type="text" name="uname" id="uname" class="input _userName" maxlength="24" tabindex="1">
                    </li>
                    <li>
                        <span class="dis">密码:</span>
                        <input type="password" name="upwd" id="upwd" class="input _password" maxlength="24"
                               tabindex="1">
                        <span id="passwordAlt" data-info="6-24个字符，英文、数字组成，区分大小写">6-24个字符，英文、数字组成，区分大小写</span>
                    </li>
                    <li>
                        <span class="dis">确认密码:</span>
                        <input type="password" name="repeatPassword" id="repeatPassword" class="input _repeatPassword"
                               maxlength="24" tabindex="1">
                        <span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span>
                    </li>

                    <li class="telNumber">
                        <span class="dis">手机号码:</span>
                        <input type="text" class="input _phoneNum" id="phone" name="phone" onblur="checkPhone();"
                               tabindex="1" maxlength="11">
                    </li>
                    <li class="telNumber">
                        <span class="dis">邀请码:</span>
                        <input id="userCode" type="text" name="userCode" placeholder="输入邀请码" class="input input1  _phonVerify"
                               data-_id="phonVerify" tabindex="1">
                        <span id="ts">可填也可不填</span>
                    </li>

                    <li class="agree">
                        <input name="protocol" id="protocol" type="checkbox" value="" checked="checked">
                        我同意《<a href="#" target="_black">亿人宝注册协议</a>》 <span id="protocolAlt"
                                                                           data-info="请查看协议">请查看协议</span>
                    </li>
                    <li class="btn"><a href="javascript:void(0);" onclick="register();" class="radius1 _ajaxSubmit">注
                        册</a>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>

<script type="text/javascript" src="<%=path%>/static/js/lyj/userregister.js"></script>
<script>
    function parseUrl() {
        var url = location.href;
        var i = url.indexOf('?');
        if (i == -1) return;
        var querystr = url.substr(i + 1);
        var arr1 = querystr.split('&');
        var arr2 = new Object();
        for (i in arr1) {
            var ta = arr1[i].split('=');
            arr2[ta[0]] = ta[1];
        }
        return arr2;
    }

    var v = parseUrl();//解析所有参数
    var userCode = v['userCode'].substr(0,5);//就是你要的结果
    if(userCode==null){
        userCode="";
    }else{
        $("#userCode").attr("readOnly",true);
    }
    var oText=document.getElementById('userCode');
//    oText=oText.substr(1,5);
    oText.value=userCode;//给文本框赋值并显示
</script>
</html>

