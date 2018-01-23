<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的红包</title>
    <meta name="keywords" content=""/>
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user2.css" />
    <link href="<%=path%>/static/css/hongbao.css" rel="stylesheet" />
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <label id="typeValue" style="display:none;"> </label>
        <style type="text/css">
            .wdhb-tab .on  a{color:#fff;}
            </style>
        <div class="personal-main">
            <div class="personal-zqzr personal-xtxx" style="min-height: 500px;">
                <div style="font-family: '微软雅黑';">
                    <ul id="hear">
                        <li class="action" style="border-bottom: 2px solid red;height: 43px;"><a href="#">未使用<span style="color: red;">(${unuseCount})</span></a></li>
                        <li><a href="#" >已使用<span style="color: red;">(${usedCount})</span></a></li>
                        <li><a href="#" >已过期<span style="color: red;">(${overCount})</span></a></li>
                    </ul>
                    <ul id="contentop">
                        <li class="action">
                            <c:forEach items="${unuseList}" var="unuse">
                                <c:if test="${unuse.type==1}">
                                    <div class="stamp stamp03">
                                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>请及时转入余额</p></div>
                                    <div class="copy">
                                    现金券
                                    <p>${unuse.uttime}<br>${unuse.tktime}</p><a href="<%=path%>/page/hong1&kid=${unuse.kid}">转入余额</a>
                                    </div>
                                    </div>
                                </c:if>
                                <c:if test="${unuse.type==2}">
                                    <div class="stamp stamp03">
                                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>${unuse.tintro}</p></div>
                                    <div class="copy">
                                    代金券
                                    <p>${unuse.uttime}<br>${unuse.tktime}</p><a href="<%=path%>/page/list?pageNo=1&kid=${unuse.kid}">立即使用</a>
                                    </div>
                                    </div>
                                </c:if>
                                <c:if test="${unuse.type==3}">
                                    <div class="stamp stamp03">
                                    <div class="par"><p>${unuse.tname}</p><sub class="sign">￥</sub><span>${unuse.tkmoney}</span><p>${unuse.tintro}</p></div>
                                    <div class="copy">
                                    体验金
                                    <p>自${unuse.uttime}<br>起三天有效期</p><a href="<%=path%>/page/list?pageNo=1&kid=${unuse.kid}">立即使用</a>
                                    </div>
                                    </div>
                                </c:if>
                                <c:if test="${unuse.type==4}">
                                    <div class="stamp stamp03">
                                    <div class="par"><p>${unuse.tname}</p><sub class="sign"></sub><span>${unuse.tkmoney.toString()}</span><sub class="sign">%</sub><p>${unuse.tintro}</p></div>
                                    <div class="copy">
                                    加息券
                                    <p>自${unuse.uttime}<br>${unuse.tktime}</p><a href="<%=path%>/page/list?pageNo=1&kid=${unuse.kid}">立即使用</a>
                                    </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </li>
                        <li>
                            <c:forEach items="${usedList}" var="used">
                                <c:if test="${used.type==1}">
                                    <div class="stamp stamp02">
                                    <div class="par"><p>${used.tname}</p><sub class="sign">￥</sub><span>${used.tkmoney}</span><p>${used.tintro}</p></div>
                                    <div class="copy">
                                    现金券
                                    <p>${used.uttime}<br>${used.tktime}</p></div>
                                    <i><font size="16">已使用</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${used.type==2}">
                                    <div class="stamp stamp02">
                                    <div class="par"><p>${used.tname}</p><sub class="sign">￥</sub><span>${used.tkmoney}</span><p>${used.tintro}</p></div>
                                    <div class="copy">
                                    代金券
                                    <p>${used.uttime}<br>${used.tktime}</p></div>
                                    <i><font size="16">已使用</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${used.type==3}">
                                    <div class="stamp stamp02">
                                    <div class="par"><p>${used.tname}</p><sub class="sign">￥</sub><span>${used.tkmoney}</span><p>${used.tintro}</p></div>
                                    <div class="copy">
                                    体验金
                                    <p>自${used.uttime}<br>起三天内有效</p></div>
                                    <i><font size="16">已使用</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${used.type==4}">
                                    <div class="stamp stamp02">
                                    <div class="par"><p>${used.tname}</p><span>${used.tkmoney}</span><sub class="sign">%</sub><p>${used.tintro}</p></div>
                                    <div class="copy">
                                    加息券
                                    <p>${used.uttime}<br>${used.tktime}</p></div>
                                    <i><font size="16">已使用</font></i>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </li>
                        <li>
                            <c:forEach items="${overList}" var="over">
                                <c:if test="${over.type==1}">
                                    <div class="stamp stamp01">
                                    <div class="par"><p>${over.tname}</p><sub class="sign">￥</sub><span>${over.tkmoney}</span><p>${over.tintro}</p></div>
                                    <div class="copy">
                                    现金券
                                    <p>${over.uttime}<br>${over.tktime}</p></div>
                                    <i><font size="16" color="red">已过期</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${over.type==2}">
                                    <div class="stamp stamp01">
                                    <div class="par"><p>${over.tname}</p><sub class="sign">￥</sub><span>${over.tkmoney}</span><p>${over.tintro}</p></div>
                                    <div class="copy">
                                    代金券
                                    <p>${over.uttime}<br>${over.tktime}</p></div>
                                    <i><font size="16" color="red">已过期</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${over.type==3}">
                                    <div class="stamp stamp01">
                                    <div class="par"><p>${over.tname}</p><sub class="sign">￥</sub><span>${over.tkmoney}</span><p>${over.tintro}</p></div>
                                    <div class="copy">
                                    体验金
                                    <p>自${over.uttime}<br>起三天内有效</p></div>
                                    <i><font size="16" color="red">已过期</font></i>
                                    </div>
                                </c:if>
                                <c:if test="${over.type==4}">
                                    <div class="stamp stamp01">
                                    <div class="par"><p>${over.tname}</p><span>${over.tkmoney}</span><sub class="sign">%</sub><p>${over.tintro}</p></div>
                                    <div class="copy">
                                    加息券
                                    <p>${over.uttime}<br>${over.tktime}</p></div>
                                    <i><font size="16" color="red">已过期</font></i>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
<script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
</body>
</html>
<script>
    $(function(){
        $("#hear li").click(function(){
            $(this).css({
                borderBottom: "2px solid red",
                height:"43px"
            }).siblings().css({
                borderBottom: "none",
                height:"45px"
            });
        });

        $("#hear li").click(function(){
            $(this).addClass("action").siblings().removeClass("action");
            var index = $(this).index();
            $("#contentop li").eq(index).css("display","block").siblings().css("display","none");
        });
        
        function touseaddr() {
            alert("sdfsdfs");
        }
    });
</script>
