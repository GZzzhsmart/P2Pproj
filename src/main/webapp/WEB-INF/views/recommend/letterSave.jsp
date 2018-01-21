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
<br/></br/>
<div class="col-md-12">
    <div class="form-group">
        <label class="col-sm-3 control-label">标题：</label>
        <div class="col-sm-9">
            <input type="text" name="title" id="title" class="form-control" placeholder="请输入标题">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">内容：</label>
        <div class="col-sm-9">
            <textarea name="content" id="content" placeholder="请输入内容" class="form-control"></textarea>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-3 control-label">状态：</label>
        <div class="col-sm-9">
            <select class="form-control" name="state" id="state">
                <option value="0">激活</option>
                <option value="1">冻结</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-12 col-sm-offset-3">
            <button class="btn btn-primary" onclick="save();">发送消息</button>
            <button class="btn btn-white" type="submit">取消</button>
        </div>
    </div>
</div>

<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<script type="text/javascript">
    function save() {
        var title = $("#title").val();
        var content = $("#content").val();
        var state = $("#state").val();
        if (title == '') {
            layer.msg('标题不可为空', {icon: 2, time: 1000});
        } else if (content == '') {
            layer.msg('内容不可为空', {icon: 2, time: 1000});
        }
        $.post(
            "/letter/save",
            {
                title: title,
                content: content,
                state: state
            },
            function (data) {
                if (data.message == "删除成功") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 1000});
                }
            }, "json"
        );
        closeWin();
    }

    function closeWin() {
        var index = parent.layer.getFrameIndex(window.name);
        setTimeout(function () {
            parent.layer.close(index)
        }, 1000);
    }
</script>
<script src="<%=path%>/static/js/jquery.datetimepicker.js"></script>

</body>
</html>
