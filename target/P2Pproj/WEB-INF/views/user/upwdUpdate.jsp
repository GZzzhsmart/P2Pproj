<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改登录密码</title>
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
                <h3><i>登录密码修改</i></h3>
                <c:if test="${exist!=null}">
                    <font  color="#ff3300" size="5"  id="xs">${exist}</font>
                </c:if>
                <c:if test="${check!=null}">
                    <font  color="#ff3300" size="5"  id="xs">${check}</font>
                </c:if>




                <form id="form" name="form" method="post" action="<%=path%>/luser/upwdUpdate" onsubmit="return check()">

                    <div class="pay-form">
                        <h6>请输入您的登录密码</h6>
                        <ul>
                            <li>
                                <label >原登录密码</label>
                                <input type="password" onblur="check()" class="pay-txt" id="upwd" name="upwd"  maxlength="18"  placeholder="请输入您的登录密码">

                                <font  color="#ff3300"   id="up">请输入您的原登录密码</font>
                            </li>
                            <li>
                                <label >现登录密码</label>
                                <input type="password" onblur="check()" class="pay-txt" id="xupwd" name="xupwd"  maxlength="18"  placeholder="请输入您的登录密码">

                                <font  color="#ff3300"   id="xup">请输入您的现登录密码</font>
                            </li>

                            <li>
                                <label >确认密码</label>
                                <input type="password" onblur="check()" class="pay-txt" id="qpwd" name="qpwd"  maxlength="18"  placeholder="请输入您的登录密码">

                                <font  color="#ff3300"   id="qup">请输入您的确认密码</font>
                                <font  color="#ff3300"   id="qup2">密码与确认密码不一致</font>
                            </li>

                        </ul>

                        <ul>
                            <li>
                                <input type="submit" name="" value="保存" style="border:none;" class="btn-paykh">
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
<script type="text/javascript">

    function check(){
        var upwd=document.getElementById("upwd").value;
        if(upwd==null || upwd==""){
            var m;  m = document.getElementById("up");
            m.style.visibility = "visible";
            return false;
        }
        if(upwd!=""){
            var m;  m = document.getElementById("up");
            m.style.visibility = "hidden";
        }



        var xupwd=document.getElementById("xupwd").value;
        if(xupwd==null || xupwd==""){
            var m;  m = document.getElementById("xup");
            m.style.visibility = "visible";
            return false;
        }
        if(xupwd!=""){
            var m;  m = document.getElementById("xup");
            m.style.visibility = "hidden";
        }

        var qpwd=document.getElementById("qpwd").value;
        if(qpwd==null || qpwd==""){
            var m;  m = document.getElementById("qup");
            m.style.visibility = "visible";
            return false;
        }
        if(qpwd!=""){
            var m;  m = document.getElementById("qup");
            m.style.visibility = "hidden";
        }



        if(xupwd!=qpwd){
            var m;  m = document.getElementById("qup2");
            m.style.visibility = "visible";
            return false;
        }

        if(xupwd==qpwd){
            var m;  m = document.getElementById("qup2");
            m.style.visibility = "hidden";
        }

    }

    window.onload=function(){
        var m;  m = document.getElementById("up");
        m.style.visibility = "hidden";


        var m;  m = document.getElementById("xup");
        m.style.visibility = "hidden";


        var m;  m = document.getElementById("qup");
        m.style.visibility = "hidden";

        var m;  m = document.getElementById("qup2");
        m.style.visibility = "hidden";


    }


</script>
</html>
