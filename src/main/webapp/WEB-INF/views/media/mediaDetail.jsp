<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>媒体报道</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <%--layui上传图片--%>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"  media="all">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>媒体报道详情</h5>
            <div class="ibox-tools">
                <div class="ibox-tools">
                    <h5><a  style="color: blue" href="<%=path%>/media/page">返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                </div>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" class="form-horizontal">
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">标题：</label>
                    ${media.title}
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">内容：如下 请详细阅读</label>
                    <div class="hr-line-dashed"></div>
                    <div class="col-lg-10">
                       ${media.content}
                    </div>
                </div>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">封面图片：</label>
                    <img src="<%=path%>/${media.pic}" style="width: 120px;height: 120px">
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">报道地址：</label>
                    ${media.url}
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">报道时间：</label>
                    ${media.date}
                </div>
            </form>
         </div>
      </div>
    </div>
</div>
<jsp:include page="../common/bootstraptablejs.jsp"/>
</body>
</html>
