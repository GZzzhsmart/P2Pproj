<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>分配权限</title>
    <link href="<%=path %>/static/plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path %>/static/plugin/select2/select2.min.css" rel="stylesheet"/>
    <link href="<%=path %>/static/plugin/select2/select2-bootstrap.min.css" rel="stylesheet"/>
    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>
</head>
<body class="gray-bg">
<div class="container">
    <h3>角色添加权限</h3>
    <hr/>
    <div class="row">
        <div class="h4 col-md-4 col-md-offset-4">
            <select id="role"  name="role" class="form-control select2"></select>
        </div>
    </div>
    <hr/>
    <div class="row">
        <span id="permission"></span>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-offset-5 col-md-4">
            <button type="button" class="btn btn-primary btn-lg save">保  存</button>
        </div>
    </div>
</div>
</div>
<%--网站信息的修改--%>
<script src="<%=path %>/static/js/jquery.min.js"></script>
<script src="<%=path %>/static/plugin/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/static/plugin/select2/i18n/zh-CN.js"></script>
<script src="<%=path %>/static/plugin/select2/select2.min.js"></script>

<script src="<%=path%>/static/js/xsl/rolePermission.js"></script>
<script>
    $(function () {

        var roleId = '';
        var selectedPList = {};

        //初始化角色下拉框
        $.post(
            "/rolePermission/roleList",
            function (data){
                $("#role").select2(
                    {
                        data: data,
                    })
                roleId = data[0].id;
            },
            'json'
        );

        //初始化权限多选框
        $.post(
            "/rolePermission/permissionList",
            function (data){
                var checkbox = '';
                for (var i = 0; i < data.length; i++){
                    checkbox += "<div class='col-md-offset-1 col-md-2'>";
                    checkbox += "   <input type='checkbox' name='id' value='" + data[i].id + "'>";
                    checkbox += "   <label>" + data[i].desZh + "</label>";
                    checkbox += "</div>";
                }
                $("#permission").html(checkbox);
                //设置第一个选中的角色的权限勾选
                getSelected(roleId);
            }
        );

        //改变下拉框后（选择另外的角色）
        $("#role").change(function () {
            //清空选中的权限
            for(var i=0;i<selectedPList.length;i++){
                $(function(){
                    $(":checkbox[value='"+selectedPList[i].id+"']").prop("checked",false);
                });
            }
            //设置该角色拥有的权限勾选
            getSelected($("#role").select2("data")[0].id);
        });



        //批量保存权限
        $(".save").click(function () {
            var permissionIds = '';
            var roleId = $("#role").select2("data")[0].id;
            $("input[name='id']:checkbox").each(function(){
                if($(this).is(':checked') == true){
                    permissionIds += $(this).val()+",";
                }
            });
            batchSaveRP(roleId,permissionIds);
        });


        function batchSaveRP(jueSeId,permissionIds) {
            $.post(
                "../rolePermission/saveOrUpdateRP",
                {roleId:jueSeId,permissionIds:permissionIds},
                function (data) {
                    if(data.result == "ok"){
                        getSelected(jueSeId);
                        swal(data.message, "该角色已有权限","success");
                    }else if(data.result == "permissionNull"){
                        swal("保存成功！",data.message,"success");
                    }else{
                        swal(data.message,"发生错误","error");
                    }
                },
                "json"
            );
        };

        function getSelected(roleId) {
            $.post(
                "../rolePermission/initSelectedP",
                {roleId:roleId},
                function(data) {
                    for(var i=0;i<data.length;i++){
                        $(function(){
                            $(":checkbox[value='"+data[i].id+"']").prop("checked",true);
                        });
                    }
                    selectedPList = data;
                },
                "json"
            );
        }
    })
</script>
</body>
</html>
