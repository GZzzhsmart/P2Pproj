<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>推荐管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <link href="<%=path%>/static/css/jquery.datetimepicker.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>推荐管理</h5>
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
                    <div class="row">
                        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">推荐人：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="tname" id="tname"/>
                        </div>
                        <label class="col-sm-1 control-label" style="text-align: right; margin-top:3px">被推荐人：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="rname" id="rname"/>
                        </div>
                        <label class="col-sm-1 control-label" style="text-align: right; margin-top:3px">推荐码：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="tzm" id="tzm"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">日期：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" placeholder="开始日期" readonly="readonly"
                                   id="startTime"
                                   name="startTime">
                        </div>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" placeholder="结束日期" readonly="readonly" id="endTime"
                                   name="endTime">
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-primary" onclick="doSearch();">搜索</button>
                    <button class="btn btn-primary" onclick="doSearchAll();" style="margin-left:5px">搜索所有</button>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <input type="hidden" value="" id="deleteId"/>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="btn_delete" onclick="delMany('/recommend/delMany');" type="button" class="btn btn-primary"
                        style="margin-left:5px">
                    <i class="glyphicon glyphicon-remove"></i>删除
                </button>
                <button type="button" id="download" style="margin-left:5px" class="btn btn-primary"
                        onClick="$('#mytab').tableExport({ type: 'excel', escape: 'false' })"><i
                        class="glyphicon glyphicon-import"></i>数据导出
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
        var tname = $("#tname").val();
        var rname = $("#rname").val();
        var tzm = $("#tzm").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var options = $("#mytab").bootstrapTable('refresh', {
            url: '/recommend/pager_criteria',
            query: {tname: tname, rname: rname, tzm: tzm， startTime: startTime, endTime
    :
        endTime
    }
    })
        ;
    }

    function doSearchAll() {
        $("#tname").val("");
        $("#rname").val("");
        $("#tzm").val("");
        $("#startTime").val("");
        $("#endTime").val("");
        doSearch();
    }
</script>
<script src="<%=path%>/static/js/jquery.datetimepicker.js"></script>
<script src="<%=path%>/static/js/pageJs/recommend.js"></script>
<script src="<%=path%>/static/js/tableExport.min.js"></script>

</body>
</html>
