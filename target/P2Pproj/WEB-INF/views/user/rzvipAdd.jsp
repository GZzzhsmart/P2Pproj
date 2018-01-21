<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>信息认证</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

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
                <h3><i>信息认证</i></h3>
                <form id="form" name="form" method="post" action="<%=path%>/rzvip/rzvipSave" onsubmit="return check()">

                    <div class="pay-form">
                        <h6>请输入您的个人信息</h6>
                        <ul>
                            <li>
                                <label >学历</label>
                                <input type="text" onblur="check()" class="pay-txt" id="xl" name="xl"   placeholder="请输入您的学历">
                                <br>
                                <font  color="#ff3300"   id="xueli">请输入您的学历</font>
                            </li>
                            <li>
                                <label >是否结婚</label>
                                <input type="radio" name="ism"   value="0">是
                                <input type="radio" name="ism"   value="1" checked>否

                            </li>
                            <li>
                                <label >毕业学校</label>
                                <input type="text"  onblur="check()" class="pay-txt" id="bschool" name="bschool" placeholder="请输入您的毕业学校">
                                <br>
                                <font  color="#ff3300"   id="bsl">请输入您的毕业学校</font>
                            </li>
                            <li>
                                <label >地址</label>
                                <input type="text"  onblur="check()" class="pay-txt"  id="addr" name="addr"  placeholder="请输入您的地址">
                                <br>
                                <font  color="#ff3300"   id="dizhi">请输入您的地址</font>
                            </li>
                            <li>
                                <label >现工作</label>
                                <input type="text"  onblur="check()" class="pay-txt" id="work" name="work"  placeholder="请输入您的现在的工作">
                                <br>
                                <font  color="#ff3300"   id="xgz">请输入您现在的工作</font>
                            </li>
                            <li>
                                <label >年龄</label>
                                <input type="text" onblur="check()"  class="pay-txt"  id="age" name="age"  placeholder="请输入您的年龄">
                                <br>
                                <font  color="#ff3300"   id="nl">请输入您的年龄</font>
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
<script type="text/javascript">

    function check(){
        var xl=document.getElementById("xl").value;
        if(xl==null || xl==""){
            var m;  m = document.getElementById("xueli");
            m.style.visibility = "visible";
            return false;
        }
        if(xl!=""){
            var m;  m = document.getElementById("xueli");
            m.style.visibility = "hidden";
        }

        var bschool=document.getElementById("bschool").value;
        if(bschool==null || bschool==""){
            var m;  m = document.getElementById("bsl");
            m.style.visibility = "visible";
            return false;
        }
        if(bschool!=""){
            var m;  m = document.getElementById("bsl");
            m.style.visibility = "hidden";
        }

        var addr=document.getElementById("addr").value;
        if(addr==null || addr==""){
            var m;  m = document.getElementById("dizhi");
            m.style.visibility = "visible";
            return false;
        }
        if(addr!=""){
            var m;  m = document.getElementById("dizhi");
            m.style.visibility = "hidden";
        }

        var work=document.getElementById("work").value;
        if(work==null || work==""){
            var m;  m = document.getElementById("xgz");
            m.style.visibility = "visible";
            return false;
        }
        if(work!=""){
            var m;  m = document.getElementById("xgz");
            m.style.visibility = "hidden";
        }

        var age=document.getElementById("age").value;
        if(age==null || age==""){
            var m;  m = document.getElementById("nl");
            m.style.visibility = "visible";
            return false;
        }
        if(age!=""){
            var m;  m = document.getElementById("nl");
            m.style.visibility = "hidden";
        }

    }

    window.onload=function(){
        var m;  m = document.getElementById("xueli");
        m.style.visibility = "hidden";

        var m;  m = document.getElementById("bsl");
        m.style.visibility = "hidden";

        var m;  m = document.getElementById("dizhi");
        m.style.visibility = "hidden";

        var m;  m = document.getElementById("xgz");
        m.style.visibility = "hidden";

        var m;  m = document.getElementById("nl");
        m.style.visibility = "hidden";


    }


</script>
</html>
