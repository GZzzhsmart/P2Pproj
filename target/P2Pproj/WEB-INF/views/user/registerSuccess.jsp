<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String name= (String) session.getAttribute("uname");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册成功</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/register.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/layer.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/alerthongbao.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/hongbao2.css" rel="stylesheet" />
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--注册-->
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">注册账户</div>
        <div class="registerLc3">
            <p class="p1">填写账户信息</p>
            <p class="p2">验证手机信息</p>
            <p class="p3">注册成功</p>
        </div>
        <div class="registerCont">
            <ul>
                <li class="scses"><%=name%>，恭喜您注册成功！<a class="blue" href="#" target="_blank">请立即开通--双乾支付账户,即可投资！</a></li>
                <li class="rz"><a href="#" class="btn">立即开通</a><a href="<%=path%>/page/login" class="blue">进入我的账户</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="ljzc_pup">
    <div class="zc_pup_tit">
        <h2>恭喜获得红包,请到我的账户查看</h2>
        <a  href="javascript:layer.closeAll();"></a>
    </div>
    <div class="zc_pup_box">
        <c:forEach items="${utvList}" var="unuse">
            <c:if test="${unuse.type==1}">
                <div class="stamp stamp03">
                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>请及时转入余额</p></div>
                    <div class="copy">
                        现金券
                        <p>${unuse.uttime}<br>${unuse.tktime}</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${unuse.type==2}">
                <div class="stamp stamp03">
                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>${unuse.tintro}</p></div>
                    <div class="copy">
                        代金券
                        <p>${unuse.uttime}<br>${unuse.tktime}</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${unuse.type==3}">
                <div class="stamp stamp03">
                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>${unuse.tintro}</p></div>
                    <div class="copy">
                        体验金
                        <p>自${unuse.uttime}<br>起三天有效期</p>
                    </div>
                </div>
            </c:if>
            <c:if test="${unuse.type==4}">
                <div class="stamp stamp03">
                    <div class="par"><p>${unuse.tname}</p><sub class="sign"></sub><span>${unuse.tkmoney.toString()}</span><sub class="sign">%</sub><p>${unuse.tintro}</p></div>
                    <div class="copy">
                        加息券
                        <p>${unuse.uttime}<br>${unuse.tktime}</p>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        <a href="javascript:layer.closeAll();">知道了</a>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/layer.js"></script>
<script>
$(function(){
    if(${utvList.size()==1}){
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            shadeClose: true,
            area: ["420px","280"],
            offset: "1%",
            content: $('#ljzc_pup')
        });
    }
    if(${utvList.size()==2}){
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            shadeClose: true,
            area: ["420px","400px"],
            offset: "1%",
            content: $('#ljzc_pup')
        });
    }
    if(${utvList.size()>=3}){
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            shadeClose: true,
            area: ["420px","520px"],
            offset: "1%",
            content: $('#ljzc_pup')
        });
    }




//    layer.open({
//        type: 1,
//        title: false,
//        closeBtn: 0,
//        area: '420px',
//        skin: 'layui-layer-nobg', //没有背景色
//        shadeClose: true,
//        content: $('#ljzc_pup')
//    });

//    layer.open({
//        type: 2,
//        title: false,
//        shadeClose: true,
//        shade: false,
//        maxmin: true, //开启最大化最小化按钮
//        area: ['700px', '500px'],
//        content: $('#ljzc_pup')
//    });
});
</script>

