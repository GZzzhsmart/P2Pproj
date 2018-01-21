<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员信息</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


                    <div class="ibox-title">
                        <h5>个人信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form method="post" class="form-horizontal" onsubmit="return check()" action="<%=path%>/Huser/updateMessage">

                            <c:if test="${update!=null}">
                            <center><font size="5" color="red">${update}</font></center>
                            </c:if>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">昵称</label>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="huname"  name="huname" value="${hUser.huname}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">真实姓名</label>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control"  id="rname" name="rname" value="${hUser.rname}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-7">

                                    <c:if test="${hUser.sex==0}">
                                        <input type="radio" name="sex"   value="0" checked>男
                                        <input type="radio" name="sex"   value="1">女
                                    </c:if>
                                    <c:if test="${hUser.sex==1}">
                                        <input type="radio" name="sex"   value="0" >男
                                        <input type="radio" name="sex"   value="1" checked>女
                                    </c:if>
                                    <c:if test="${hUser.sex==null}">
                                        <input type="radio" name="sex"   value="0" >男
                                        <input type="radio" name="sex"   value="1">女
                                    </c:if>

                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号</label>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="phone"  name="phone" value="${hUser.phone}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">电子邮箱</label>

                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="email" value="${hUser.email}">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>



                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">修改资料</button>
                                </div>
                            </div>

                        </form>
                    </div>

</div>

</body>
</html>
<script type="text/javascript">

    function check() {
        var huname=document.getElementById("huname").value;
        if(huname==null || huname==""){
            swal("昵称不能为空！","","error");
            return false;
        }

        var rname=document.getElementById("rname").value;
        if(rname==null || rname==""){
            swal("真实姓名不能为空！","","error");
            return false;
        }

        var phone=document.getElementById("phone").value;
        if(phone==null || phone==""){
            swal("手机号不能为空！","","error");
            return false;
        }

        var a = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|14[57]\d{8}|15\d{9}|18\d{9}$/;

        if(phone.length!=11 || !phone.match(a)){
            swal("手机号格式不正确！","","error");
            return false;
        }

    }

</script>

