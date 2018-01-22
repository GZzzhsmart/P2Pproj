<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公司动态列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>公司动态列表</h5>
        </div>
        <div class="ibox-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">标题：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="title" id="title"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">报道时间：</label>
                    <div class="col-sm-2">
                        <input type="date" class="form-control" name="date" id="date"/>
                    </div>
                         <div class="col-sm-1 col-sm-offset-1">
                        <button class="btn btn-primary" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="btn_add" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span><a a class="J_menuItem" style="color: white" href="<%=path%>/dynamic/initAdd">新增动态</a>
                </button>
                <button id="btn_detail" type="button" onclick="detail();" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>查看详情
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script src="<%=path%>/static/js/pageJs/dynamic.js"></script>

</body>
</html>
