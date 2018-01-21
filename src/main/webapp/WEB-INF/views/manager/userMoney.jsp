<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户资金管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>用户资金管理</h5>
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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">姓名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="rname" />
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">总资产：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="zmoney"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">投资总额：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="tzmoney"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-4">
                        <button class="btn btn-primary" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">

            </div>
        </div>
    </div>
</div>

<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script src="<%=path%>/static/js/pageJs/userMoney.js"></script>

</body>
</html>
