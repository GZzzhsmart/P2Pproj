<%@ page import="top.zzh.common.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <div class="header-top min-width">
        <div class="container fn-clear">
            <c:forEach var="s" items="${homeList}">
               <strong class="fn-left">咨询热线：${s.phone}<span class="s-time">服务时间：9:00 - 18:00</span></strong>
            </c:forEach>
                <ul class="header_contact">
                <li class="c_1"> <a class="ico_head_weixin" id="wx"></a>
                    <div class="ceng" id="weixin_xlgz" style="display: none;">
                        <div class="cnr"> <img src="<%=path%>/static/images/code.png"> </div>
                        <b class="ar_up ar_top"></b> <b class="ar_up_in ar_top_in"></b> </div>
                </li>
                <li class="c_2"><a href="http://wpa.qq.com/msgrd?v=3&uin=1729340612&site=qq&menu=yes" target="_blank" title="官方QQ" alt="官方QQ"><b class="ico_head_QQ"></b></a></li>
                <li class="c_4"><a href="#" target="_blank" title="新浪微博" alt="新浪微博"><b class="ico_head_sina"></b></a></li>
            </ul>
            <ul class="fn-right header-top-ul">
                <li> <a href="<%=path%>/" class="app">返回首页</a> </li>
                <li>
                    <c:if test="${userId==null}">
                        <div class=""><a href="<%=path%>/page/register" class="c-orange" title="免费注册">免费注册</a></div>
                    </c:if>
                    <c:if test="${userId!=null}">
                        <div class=""><a href="<%=path%>/luser/logout" class="c-orange" title="退出">安全退出</a></div>
                    </c:if>
                </li>
                <li>
                    <c:if test="${userId==null}">
                        <a href="<%=path%>/page/login"  title="登录">登录</a>
                    </c:if>
                    <c:if test="${userId!=null}">
                        <a href="<%=path%>/page/user"  title="用户名">${user}</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
    <div class="header min-width">
        <div class="container">
            <div class="fn-left logo">
                <a class="" href="<%=path%>/">
                    <img src="<%=path%>/static/images/logo.png"  title="亿人宝">
                </a>
            </div>
            <ul class="top-nav fn-clear">
                <li> <a href="<%=path%>/">首页</a> </li>
                <li> <a href="<%=path%>/page/list?pageNo=1" class="">投资理财</a> </li>
                <li> <a href="<%=path%>/page/help">安全保障</a> </li>
                <li class="top-nav-safe"> <a href="<%=path%>/page/user">我的账户</a> </li>
                <li> <a href="<%=path%>/page/about">关于我们</a> </li>
            </ul>
        </div>
    </div>
</header>
