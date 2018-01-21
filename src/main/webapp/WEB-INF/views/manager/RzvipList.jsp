<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>认证信息列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>认证</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>

        </div>
        <div class="ibox-content">

            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">用户名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="uname" id="uname"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">学历：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="xl" id="xl"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-4">
                        <button class="btn btn-primary" onclick="doSearch();">查询</button>
                    </div>
                </div>
            </div>




            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button type="button" onclick="findDetails()" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>查看详情
                </button>

                <button id="sh" type="button"  class="btn btn-default" style="display: block; border-radius: 0" data-target="#exampleModal">
                    <span class="glyphicon glyphicon-screenshot" aria-hidden="true" ></span>审核
                </button>
            </div>
        </div>
    </div>
</div>

<%--网站信息的修改--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">审核</h4>
            </div>
            <div class="modal-body">

                <form id="from1" method="post" class="form-horizontal"  action="<%=path%>/rzvip/examineAndverify">

                    <input type="hidden"  class="form-control" name="rows.uid"/>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">是否通过</label>
                        <div class="col-sm-8">
                            <select class="form-control"  name="isok" id="isok">
                                <option value="0">审核通过</option>
                                <option value="1">审核不通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">理由</label>
                        <div class="col-sm-8">
                            <textarea  name="excute" id="remark" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">提 交</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>








<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/lyj/rzvipList.js"></script>

<script src="<%=path%>/static/js/lyj/bootstrapValidator.js"></script>
<script src="<%=path%>/static/js/lyj/formFill.js"></script>

</body>
</html>

<script>
    function doSearch () {
        var uname=$('#uname').val();
        var xl=$('#xl').val();
        var options=$('#mytab').bootstrapTable('refresh', {
            url: '/rzvip/pager',
            query:{uname:uname,xl:xl}
        });
    }
</script>
