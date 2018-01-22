<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>站内信管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <link href="<%=path%>/static/css/jquery.datetimepicker.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>站内信管理</h5>
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
                    搜索条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">标题：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="title" id="title"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:3px">内容：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="content" id="content"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">日期：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" placeholder="开始日期" readonly="readonly" id="startTime" name="startTime">
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" placeholder="结束日期" readonly="readonly" id="endTime" name="endTime">
                    </div>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-primary" onclick="doSearch();">搜索</button>
                    <button class="btn btn-primary" onclick="doSearchAll();" style="margin-left:5px">搜索所有</button>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <input type="hidden" value=""  id="deleteId"/>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="btn_delete" onclick="delMany('/letter/delMany');" type="button" class="btn btn-primary"
                        style="margin-left:5px">
                    <i class="glyphicon glyphicon-remove"></i>批量删除
                </button>
                <button type="button" id="download" style="margin-left:5px" class="btn btn-primary"
                        onClick="sendMessage();"><i
                        class="glyphicon glyphicon-import"></i>消息发送
                </button>
            </div>
        </div>
    </div>
</div>

<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script type="text/javascript">
    <%--bootstrap时间插件--%>
    $("#startTime").datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        language: 'zh-CN',
        autoclose: true,
    }).on("click", function () {
        $("#startTime").datetimepicker("setStartDate", $("#startTime").val())
    });
    $("#endTime").datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        language: 'zh-CN',
        autoclose: true,
    }).on("click", function () {
        $("#endTime").datetimepicker("setEndTime", $("#endTime").val())
    });
    <%--条件查询--%>

    function doSearch() {
        var title = $("#title").val();
        var content = $("#content").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var options = $("#mytab").bootstrapTable('refresh', {
            url: '/letter/pager_criteria',
            query: {title: title, content: content, startTime: startTime, endTime: endTime}
        });
    }
    function doSearchAll() {
        $("#title").val("");
        $("#content").val("");
        $("#startTime").val("");
        $("#endTime").val("");
        doSearch();
    }
    function sendMessage(){
        layer.open({
            type: 2,
            title: '消息发送',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: "/letter/letterAdd" ,//iframe的url
            end:function() {
                refush();
            }
        });
    }
</script>
<script src="<%=path%>/static/js/jquery.datetimepicker.js"></script>
<script src="<%=path%>/static/js/pageJs/letter.js"></script>
<script src="<%=path%>/static/js/tableExport.min.js"></script>

</body>

</html>
