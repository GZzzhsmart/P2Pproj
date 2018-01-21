<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>角色管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
    <link href="<%=path%>/static/css/jquery.datetimepicker.css" rel="stylesheet">

    <!--弹出框样式-->
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>
</head>
<body class="gray-bg">
<!--角色 新增 模态框开始-->
<div class="modal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="webAddTitle">新增角色</h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="form-group">
                    <label class="col-sm-3 control-label">角色名称：</label>
                    <div class="col-sm-8">
                        <input type="text" id="addRname" name="rname" class="form-control" required="" aria-required="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">角色描述：</label>
                    <div class="col-sm-8">
                        <input type="text" id="addContent"  name="content" class="form-control" required="" aria-required="true"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    <button type="submit" id="add" class="btn btn-primary">新增</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--权限 新增 模态框结束-->

<!--权限 修改 模态框开始-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">角色修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="updateForm">
                    <input type="hidden" name="rid" id="rid"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称:</label>
                        <div class="col-sm-8">
                            <input type="text" id="updateRname" name="rname"  class="form-control" required="" aria-required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色描述:</label>
                        <div class="col-sm-8">
                            <input type="text" id="updateContent" name="content" class="form-control" required="" aria-required="true"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
                        <button type="submit" id="update" class="btn btn-success">确认修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--权限 修改 模态框结束-->

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="save" type="button" onclick="return save()" class="btn btn-primary" style="display: block; border-radius: 0" data-toggle="modal" data-target="#webAdd">
                    <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>新增
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/jQuery.form.js"></script>
<script src="<%=path%>/static/js/xsl/role.js"></script>
</body>
</html>
