<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
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
                        <form method="post" class="form-horizontal" onsubmit="return check()" action="<%=path%>/Huser/updatePwd">

                            <c:if test="${update!=null}">
                            <center><font size="5" color="red">${update}</font></center>
                            </c:if>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">原密码</label>

                                <div class="col-sm-7">
                                    <input type="password" class="form-control" id="hpwd"  name="hpwd">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">现密码</label>

                                <div class="col-sm-7">
                                    <input type="password" class="form-control"  id="xpwd" name="xpwd">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码</label>

                                <div class="col-sm-7">
                                    <input type="password" class="form-control" id="qpwd"  name="qpwd">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>



                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="submit">修改</button>
                                </div>
                            </div>

                        </form>
                    </div>

</div>

</body>
</html>
<script type="text/javascript">

    function check() {
        var hpwd=document.getElementById("hpwd").value;
        if(hpwd==null || hpwd==""){
            swal("原密码不能为空！","","error");
            return false;
        }

        var xpwd=document.getElementById("xpwd").value;
        if(xpwd==null || xpwd==""){
            swal("现密码不能为空！","","error");
            return false;
        }

        var qpwd=document.getElementById("qpwd").value;
        if(qpwd==null || qpwd==""){
            swal("确认密码不能为空！","","error");
            return false;
        }

        if(xpwd!=qpwd){
            swal("确认密码和现密码不一致！","","error");
            return false;
        }


    }

</script>

