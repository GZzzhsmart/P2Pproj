<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户角色管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
    <link href="<%=path%>/static/css/jquery.datetimepicker.css" rel="stylesheet">
    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>
</head>
<body class="gray-bg">
<!--新增用户并分配角色 模态框开始-->
<div class="modal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="webAddTitle">新增用户并分配角色</h4>
            </div>
            <form method="post" id="formadd" class="form-horizontal" >
                <div class="row">
                    <div class="h5 col-md-4 col-md-offset-2">
                        用户手机号：<input type="number" name="phone" id="phone" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))">
                    </div>
                    <div class="h5 col-md-4">
                        初始密码：<input type="text" value="666666" disabled="disabled">
                    </div>
                </div>
                <br/>
                <div class="row">
                    <span id="roleList"></span>
                </div>
            </form>
            <div class="modal-footer">
                <div class="col-md-offset-3 col-md-4">
                    <button type="button" class="saveRole btn btn-primary btn-lg save">保  存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--新增用户并分配角色 模态框结束-->

<!--修改角色 模态框开始-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <input type="hidden" id="hUserId">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="col-md-offset-4">
                    <h2><span class="modal-title" id="hUserName" style="color:rgba(50,234,20,0.84)"></span><span>角色修改</span></h2>
                </div>
            </div>
            <hr/>
            <div class="row">
                <span id="role"></span>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-offset-5 col-md-4">
                    <button type="button" class="modifyRole btn btn-primary btn-lg save">确 认 修 改</button>
                </div>
            </div>
            <br/>
        </div>
    </div>
</div>
<!--修改角色 模态框结束-->

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="save" type="button" class="popping btn btn-primary" style="display: block; border-radius: 0" data-toggle="modal">
                    <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>新增
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/xsl/hUserRole.js"></script>
<script>
    $(function () {
        //弹出新增用户并分配角色模态框
        $(".popping").click(function () {
            queryRoleList();
            $('#webAdd').modal('toggle');
        });


        //保存用户和角色
        $(".saveRole").click(function () {
            var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
            var phone = $("#phone").val();
            if(phone != ''){
                //检查是否为11位手机号,手机号是否重复
                if(reg.test(phone)){
                    $.post(
                        "/hUserRole/checkPhone",
                        {phone:phone},
                        function (data) {
                            if(data.result == "ok"){
                                if($('.role').is(':checked')) {
                                    //保存用户角色
                                    saveHuserRole(phone);
                                }else{
                                    swal("请选择角色!","您未选择任何角色","warning");
                                }
                            }else{
                                $("#phone").focus();
                                swal("手机号已存在!","请更换手机号","warning");
                            }
                        }
                    );
                }else {
                    swal("输入的手机号有错误!","请检查手机号","warning");
                }
            }else {
                swal("请填写手机号!","您未填写手机号","warning");
                $("#phone").focus();
            }
        });

        function queryRoleList() {
            //查询未被冻结的所有角色
            $.post(
                "/hUserRole/hRoleList",
                function (data){
                    var checkbox = '';
                    for (var i = 0; i < data.length; i++){
                        checkbox += "<div class='col-md-offset-1 col-md-2'>";
                        checkbox += "   <input type='checkbox' id='checkbox' name='id' value='" + data[i].rid + "' class='role' >";
                        checkbox += "   <label>" + data[i].rname + "</label>";
                        checkbox += "</div>";
                    }
                    $("#roleList").html(checkbox);
                }
            );
        }
        
        
        function saveHuserRole(phone) {
            //关闭模态框
            $('#webAdd').modal('toggle');

            var roleList = '';
            $("input[name='id']:checkbox").each(function(){
                if($(this).is(':checked') == true){
                    roleList += $(this).val()+",";
                    //设置选中的取消选中
                    $(this).attr("checked", false);
                }
            });
            $.post(
                "/hUserRole/saveHuserAndRole",
                {roleList:roleList,phone:phone},
                function (data) {
                    if(data.result == "ok"){
                        //清空数据
                        $("#phone").val('');
                        //刷新表格
                        $('#mytab').bootstrapTable('refresh',{url:"/hUserRole/hasRoleHuser"});
                        swal(data.message,"新增用户成功！","success");
                    }
                },
                "json"
            );
        }
    });
</script>
</body>
</html>
