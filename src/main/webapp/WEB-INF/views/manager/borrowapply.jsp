<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>借款审核列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>申请借款列表</h5>
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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">申请人：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="rname" id="rname"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">金额：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="money" id="money1"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-4">
                        <button class="btn btn-primary" onclick="doSearch();">查询</button>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button type="button" onclick="findDetails()" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>借款详情
                </button>
                <button type="button" onclick="hk()" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>还款详情
                </button>
            </div>
        </div>
    </div>
</div>
    <!-- 申请借款的审核-->
    <div class="modal fade" id="shenheModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="shenheModalLabel">
                        申请借款审核
                    </h4>
                </div>
                <form class="form-horizontal" id="shenheform" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">审核操作：</label>
                            <div class="col-sm-8">
                                <select class="form-control"  name="state" id="state">
                                    <option value="0">审核通过</option>
                                    <option value="1">未审核</option>
                                    <option value="3">审核不通过</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">审核理由：</label>
                            <div class="col-sm-8">
                                <textarea  name="reason" id="reason" class="form-control" required="" aria-required="true"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" id="shenhe" class="btn btn-primary" data-dismiss="modal">
                            确认审核
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

<jsp:include page="../common/bootstraptablejs.jsp"/>
<script src="<%=path%>/static/js/pageJs/borrowapply.js"></script>
<script>
    function doSearch () {
        var rname=$('#rname').val();
        var money1=$('#money1').val();
        var options=$('#mytab').bootstrapTable('refresh', {
            url: '/borrowapply/pager_criteria',
            query:{rname:rname,money1:money1}
        });
    }
</script>
</body>
</html>
