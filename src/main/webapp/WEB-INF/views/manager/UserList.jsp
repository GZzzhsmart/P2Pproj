<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>用户信息</h5>
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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">状态：</label>
                    <div class="col-sm-2">
                        <select class="form-control" name="state" id="state">
                            <option value="1">激活</option>
                            <option value="2">冻结</option>
                        </select>

                    </div>
                    <div class="col-sm-1 col-sm-offset-4">
                        <button class="btn btn-primary" onclick="doSearch();">查询</button>
                    </div>
                </div>
            </div>




            <table id="mytab" name="mytab" class="table table-hover"></table>

        </div>
    </div>
</div>



<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/lyj/userList.js"></script>

<script src="<%=path%>/static/js/lyj/bootstrapValidator.js"></script>
<script src="<%=path%>/static/js/lyj/formFill.js"></script>

</body>
</html>

<script>
    function doSearch () {
        var uname=$('#uname').val();
        var st=$('#state').val();

        var options=$('#mytab').bootstrapTable('refresh', {
            url: '/luser/pager',
            query:{uname:uname,state:st}
        });
    }
</script>
