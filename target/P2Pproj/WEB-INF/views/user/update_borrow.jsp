<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="top.zzh.common.Constants" %>
<%
    String path = request.getContextPath();
    String name= (String) session.getAttribute(Constants.USER_IN_SESSION);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改借款</title>
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
    <div class="personal-main">
        <div class="pmain-connent">
            <div id="pmain-contab" class="pmain-contab">
                <ul>
                    <li id="pmain-contab1" class="on">修改借款</li>
                    <li class="li-other"></li>
                </ul>
            </div>
            <div class="pmain-conmain" id="pmain-conmain">
                <div class="pmain-conmain1">
                    <div class="personal-main">
                        <div class="personal-pay">
                            <form id="form1" name="form1" method="post"  action="<%=path%>/borrowapply/update">
                                <input type="hidden" name="baid" value="${borrowDetailVO.baid }">
                                <input type="hidden" name="bdid" value="${borrowDetailVO.bdid }">
                                <div class="pay-form">
                                    <ul>
                                        <li>
                                            <label >真实姓名</label>
                                            <input type="text" class="pay-txt" id="rname" name="rname" value="<%=name%>"   placeholder="请输入您的真实姓名">
                                        </li>
                                        <li>
                                            <label >申请金额</label>
                                            <input type="text" class="pay-txt"  name="money" value="${borrowDetailVO.money}" placeholder="请输入申请金额">
                                        </li>
                                        <li>
                                            <label >借款标种</label>
                                            <select  name="bzid" id="bzid" style="width: 270px;height: 40px">
                                                <option value="${borrowDetailVO.bzid}">${borrowDetailVO.bzname}</option>
                                                <c:forEach items="${bzList}" var="d">
                                                    <option value="${d.bzid}">${d.bzname}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                        <li>
                                            <label >借款类型</label>
                                            <select name="lxid" id="lxid" style="width: 270px;height: 40px">
                                                <option value="${borrowDetailVO.lxid}">${borrowDetailVO.lxname}</option>
                                                <c:forEach items="${jklxList}" var="d">
                                                    <option  value="${d.lxid}">${d.lxname}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                        <li>
                                            <label>法人身份证</label>
                                            <img src="<%=path%>/static/uploads/${borrowDetailVO.fpic}" style="width:50px;height:50px">
                                        </li>
                                        <li>
                                            <label >营业执照副本</label>
                                            <img src="<%=path%>/static/uploads/${borrowDetailVO.ypic}" style="width:50px;height:50px">
                                        </li>
                                        <li>
                                            <label >企业银行账号</label>
                                            <img src="<%=path%>/static/uploads/${borrowDetailVO.qpic}" style="width:50px;height:50px">
                                        </li>
                                        <li>
                                            <label >其他资料</label>
                                            <img src="<%=path%>/static/uploads/${borrowDetailVO.tpic}" style="width:50px;height:50px">
                                        </li>
                                        <li>
                                            <label >借款期限</label>
                                            <input type="number" class="pay-txt"  name="term" id="term" value="${borrowDetailVO.term}" placeholder="请输入借款期限">
                                        </li>
                                        <li>
                                            <label >资金用途</label>
                                            <input type="text" class="pay-txt"  name="mpurpose" id="mpurpose" value="${borrowDetailVO.mpurpose}" placeholder="请说明资金用途">
                                        </li>
                                        <li>
                                            <label >还款来源</label>
                                            <input type="text" class="pay-txt"  name="hksource" id="hksource" value="${borrowDetailVO.hksource}" placeholder="请输入还款来源">
                                        </li>
                                        <li>
                                            <label >年化收益</label>
                                            <input type="text" class="pay-txt"  name="nprofit" id="nprofit" value="${borrowDetailVO.nprofit}" placeholder="请输入年化收益">
                                        </li>
                                        <li>
                                            <label >收益方式</label>
                                            <select  name="sid" id="sid" style="width: 270px;height: 40px">
                                                <option value="${borrowDetailVO.sid}">${borrowDetailVO.way}</option>
                                                <c:forEach items="${swayList}" var="d">
                                                    <option value="${d.sid}">${d.way}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                        <li>
                                            <label >借款人介绍</label>
                                            <textarea type="text" class="pay-txt" name="suggest"  placeholder="请输入借款人介绍" style="width: 570px;height: 50px;">${borrowDetailVO.suggest}</textarea>
                                        </li>
                                        <li>
                                            <label >项目描述</label>
                                            <textarea type="text" class="pay-txt"  name="xmdescrip"  placeholder="请输入项目描述" style="width: 570px;height: 50px;">${borrowDetailVO.xmdescrip}</textarea>
                                        </li>
                                        <li>
                                            <label >保障措施</label>
                                            <textarea type="text" class="pay-txt"  name="guarantee"  placeholder="请输入保障措施" style="width: 570px;height: 50px;">${borrowDetailVO.guarantee}</textarea>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li>
                                            <input type="submit"  value="确认修改" style="border:none;" class="btn-paykh">
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>

</body>
</html>
