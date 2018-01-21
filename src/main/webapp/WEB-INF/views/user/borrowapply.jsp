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
    <title>申请借款</title>
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
                        <li id="pmain-contab1" class="on">申请借款</li>
                        <li class="li-other"></li>
                    </ul>
                </div>
                <div class="pmain-conmain" id="pmain-conmain">
                    <div class="pmain-conmain1">
                        <div class="personal-main">
                            <div class="personal-pay">
                                <c:if test="${exist!=null}">
                                    <font  color="#ff3300" size="5"  id="xs">${exist}</font>
                                </c:if>
                                <form id="form1" name="form1" method="post" enctype="multipart/form-data" action="<%=path%>/borrowapply/save" onsubmit="check();">
                                    <div class="pay-form">
                                        <ul>
                                            <li>
                                                <label >真实姓名</label>
                                                <input type="text" onblur="check()" class="pay-txt" id="rname" name="rname" value="<%=name%>"   placeholder="请输入您的真实姓名">
                                                <br>
                                                <font  color="#ff3300"   id="rname1">请输入您的真实姓名</font>
                                            </li>
                                            <li>
                                                <label >申请金额</label>
                                                <input type="text" onblur="check()" class="pay-txt" id="money" name="money"  placeholder="请输入申请金额">
                                                <br>
                                                <font  color="#ff3300"   id="money1">请输入您要申请的金额</font>
                                            </li>
                                            <li>
                                                <label >借款标种</label>
                                                <select  id="bzid" onblur="check()" name="bzid" style="width: 270px;height: 40px">
                                                    <option value="">请选择标种</option>
                                                    <c:forEach items="${bzList}" var="d">
                                                        <option value="${d.bzid}">${d.bzname}</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                                <font  color="#ff3300"   id="bzid1">请选择借款标种</font>
                                            </li>
                                            <li>
                                                <label >借款类型</label>
                                                <select  id="lxid" onblur="check()" name="lxid" style="width: 270px;height: 40px">
                                                    <option value="">请选择借款类型</option>
                                                    <c:forEach items="${jklxList}" var="d">
                                                        <option value="${d.lxid}">${d.lxname}</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                                <font  color="#ff3300"   id="lxid1">请输入借款类型</font>
                                            </li>
                                            <li>
                                                <label >借款期限</label>
                                                <input type="number" onblur="check()" class="pay-txt" id="term" name="term"  placeholder="请输入借款期限">
                                                <br>
                                                <font  color="#ff3300"   id="term1">请输入借款类型</font>
                                            </li>
                                            <li>
                                                <label >资金用途</label>
                                                <input type="text" onblur="check()" class="pay-txt" id="mpurpose" name="mpurpose"  placeholder="请说明资金用途">
                                                <font  color="#ff3300"   id="mpurpose1">请输入资金用途</font>
                                            </li>
                                            <li>
                                                <label >还款来源</label>
                                                <input type="text" onblur="check()" class="pay-txt" id="hksource" name="hksource"  placeholder="请输入还款来源">
                                                <br>
                                                <font  color="#ff3300"   id="hksource1">请输入还款来源</font>
                                            </li>
                                            <li>
                                                <label >年化收益</label>
                                                <input type="text" onblur="check()" class="pay-txt" id="nprofit" name="nprofit"  placeholder="请输入年化收益">
                                                <br>
                                                <font  color="#ff3300"   id="nprofit1">请输入年化收益</font>
                                            </li>
                                            <li>
                                                <label >收益方式</label>
                                                <select  id="sid" onblur="check()" name="sid" style="width: 270px;height: 40px">
                                                    <option value="">请选择还款类型</option>
                                                    <c:forEach items="${swayList}" var="d">
                                                        <option value="${d.sid}">${d.way}</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                                <font  color="#ff3300"   id="sid1">请选择收益方式</font>
                                            </li>
                                            <li>
                                                <label>法人身份证</label>
                                                <input type="file" onblur="check()" class="pay-txt" id="fpic" name="file" placeholder="请选择法人身份证照片" />
                                                <br>
                                                <font  color="#ff3300"   id="fpic1">请选择法人身份证照片</font>
                                            </li>
                                            <li>
                                                <label >营业执照副本</label>
                                                <input type="file" onblur="check()" class="pay-txt" id="ypic" name="file" placeholder="请选择营业执照副本" />
                                                <br>
                                                <font  color="#ff3300"   id="ypic1">请选择营业执照副本</font>
                                            </li>
                                            <li>
                                                <label >企业银行账号</label>
                                                <input type="file" onblur="check()" class="pay-txt" id="qpic" name="file" placeholder="请选择企业银行账号" />
                                                <br>
                                                <font  color="#ff3300"   id="qpic1">请选择企业银行账号</font>
                                            </li>
                                            <li>
                                                <label >其他资料</label>
                                                <input type="file" onblur="check()" class="pay-txt" id="tpic" name="file" placeholder="请选择其他资料" />
                                                <br>
                                                <font  color="#ff3300"   id="tpic1">请选择其他资料</font>
                                            </li>
                                            <li>
                                                <label >借款人介绍</label>
                                                <textarea type="text" onblur="check()" class="pay-txt" id="suggest" name="suggest"  placeholder="请输入借款人介绍" style="width: 570px;height: 50px;"></textarea>
                                                <br>
                                                <font  color="#ff3300"   id="suggest1">请输入借款人介绍</font>
                                            </li>
                                            <li>
                                                <label >项目描述</label>
                                                <textarea type="text" onblur="check()" class="pay-txt" id="xmdescrip" name="xmdescrip"  placeholder="请输入项目描述" style="width: 570px;height: 50px;"></textarea>
                                                <br>
                                                <font  color="#ff3300"   id="xmdescrip1">请填写项目描述</font>
                                            </li>
                                            <li>
                                                <label >保障措施</label>
                                                <textarea type="text" onblur="check()" class="pay-txt" id="guarantee" name="guarantee"  placeholder="请输入保障措施" style="width: 570px;height: 50px;"></textarea>
                                                <br>
                                                <font  color="#ff3300"   id="guarantee1">请填写保障措施</font>
                                            </li>
                                        </ul>
                                        <ul>
                                            <li>
                                                <input type="submit"  value="申请借款" style="border:none;" class="btn-paykh" >
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
<script>
    function check() {
        var rname=document.getElementById("rname").value;
        if(rname==null || rname==""){
            var m;  m = document.getElementById("rname1");
            m.style.visibility = "visible";
            return false;
        }
        if(rname!=""){
            var m;  m = document.getElementById("rname1");
            m.style.visibility = "hidden";
        }

        var money=document.getElementById("money").value;
        if(money==null || money==""){
            var m;  m = document.getElementById("money1");
            m.style.visibility = "visible";
            return false;
        }
        if(money!=""){
            var m;  m = document.getElementById("money1");
            m.style.visibility = "hidden";
        }

        var bzid=document.getElementById("bzid").value;
        if(bzid==null || bzid==""){
            var m;  m = document.getElementById("bzid1");
            m.style.visibility = "visible";
            return false;
        }
        if(bzid!=""){
            var m;  m = document.getElementById("bzid1");
            m.style.visibility = "hidden";
        }

        var lxid=document.getElementById("lxid").value;
        if(lxid==null || lxid==""){
            var m;  m = document.getElementById("lxid1");
            m.style.visibility = "visible";
            return false;
        }
        if(lxid!=""){
            var m;  m = document.getElementById("lxid1");
            m.style.visibility = "hidden";
        }

        var term=document.getElementById("term").value;
        if(term==null || term==""){
            var m;  m = document.getElementById("term1");
            m.style.visibility = "visible";
            return false;
        }
        if(term!=""){
            var m;  m = document.getElementById("term1");
            m.style.visibility = "hidden";
        }
        var mpurpose=document.getElementById("mpurpose").value;
        if(mpurpose==null || mpurpose==""){
            var m;  m = document.getElementById("mpurpose1");
            m.style.visibility = "visible";
            return false;
        }
        if(mpurpose!=""){
            var m;  m = document.getElementById("mpurpose1");
            m.style.visibility = "hidden";
        }
        var hksource=document.getElementById("hksource").value;
        if(hksource==null || hksource==""){
            var m;  m = document.getElementById("hksource1");
            m.style.visibility = "visible";
            return false;
        }
        if(hksource!=""){
            var m;  m = document.getElementById("hksource1");
            m.style.visibility = "hidden";
        }
        var nprofit=document.getElementById("nprofit").value;
        if(nprofit==null || nprofit==""){
            var m;  m = document.getElementById("nprofit1");
            m.style.visibility = "visible";
            return false;
        }
        if(nprofit!=""){
            var m;  m = document.getElementById("nprofit1");
            m.style.visibility = "hidden";
        }
        var sid=document.getElementById("sid").value;
        if(sid==null || sid==""){
            var m;  m = document.getElementById("sid1");
            m.style.visibility = "visible";
            return false;
        }
        if(sid!=""){
            var m;  m = document.getElementById("sid1");
            m.style.visibility = "hidden";
        }
        var fpic=document.getElementById("fpic").value;
        if(fpic==null || fpic==""){
            var m;  m = document.getElementById("fpic1");
            m.style.visibility = "visible";
            return false;
        }
        if(fpic!=""){
            var m;  m = document.getElementById("fpic1");
            m.style.visibility = "hidden";
        }
        var ypic=document.getElementById("ypic").value;
        if(ypic==null || ypic==""){
            var m;  m = document.getElementById("ypic1");
            m.style.visibility = "visible";
            return false;
        }
        if(ypic!=""){
            var m;  m = document.getElementById("ypic1");
            m.style.visibility = "hidden";
        }
        var qpic=document.getElementById("qpic").value;
        if(qpic==null || qpic==""){
            var m;  m = document.getElementById("qpic1");
            m.style.visibility = "visible";
            return false;
        }
        if(qpic!=""){
            var m;  m = document.getElementById("qpic1");
            m.style.visibility = "hidden";
        }
        var tpic=document.getElementById("tpic").value;
        if(tpic==null || tpic==""){
            var m;  m = document.getElementById("tpic1");
            m.style.visibility = "visible";
            return false;
        }
        if(tpic!=""){
            var m;  m = document.getElementById("tpic1");
            m.style.visibility = "hidden";
        }
        var suggest=document.getElementById("suggest").value;
        if(suggest==null || suggest==""){
            var m;  m = document.getElementById("suggest1");
            m.style.visibility = "visible";
            return false;
        }
        if(suggest!=""){
            var m;  m = document.getElementById("suggest1");
            m.style.visibility = "hidden";
        }
        var xmdescrip=document.getElementById("xmdescrip").value;
        if(xmdescrip==null || xmdescrip==""){
            var m;  m = document.getElementById("xmdescrip1");
            m.style.visibility = "visible";
            return false;
        }
        if(xmdescrip!=""){
            var m;  m = document.getElementById("xmdescrip1");
            m.style.visibility = "hidden";
        }
        var guarantee=document.getElementById("guarantee").value;
        if(guarantee==null || guarantee==""){
            var m;  m = document.getElementById("guarantee1");
            m.style.visibility = "visible";
            return false;
        }
        if(guarantee!=""){
            var m;  m = document.getElementById("guarantee1");
            m.style.visibility = "hidden";
        }
    }

    window.onload=function(){
        var m;  m = document.getElementById("rname1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("money1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("bzid1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("lxid1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("term1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("mpurpose1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("hksource1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("sid1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("nprofit1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("fpic1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("ypic1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("qpic1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("tpic1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("suggest1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("xmdescrip1");
        m.style.visibility = "hidden";
        var m;  m = document.getElementById("guarantee1");
        m.style.visibility = "hidden";
    }

</script>
</body>
</html>
