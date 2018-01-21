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
    <title>公司动态</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <!--上传文件及图片-->
    <link href="<%=path%>/static/plugin/bootstrap/css/plugins/webuploader/webuploader.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/plugin/bootstrap/css/demo/webuploader-demo.min.css"rel="stylesheet" type="text/css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>公司动态</h5>
            <div class="ibox-tools">
                <div class="ibox-tools">
                    <h5><a  style="color: blue" href="<%=path%>/dynamic/page">返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
                </div>
            </div>
        </div>
        <div class="ibox-content">
            <form class="form-horizontal"  action="<%=path%>/dynamic/update"id="updateForm">
                <input type="hidden" name="dyid" id="dyid" value="${dynamic.dyid}"/>
                <input type="hidden" name="state" id="state" value="${dynamix.state}"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" name ="title" value="${dynamic.title}" placeholder="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <textarea id="editor" name="content" value="${dynamic.content}" style="height: 250px;width: 700px"autofocus>${dynamic.content}</textarea>
                    </div>
                </div>
                <input type="hidden" id="pic" name="pic" value="${dynamic.pic}"/>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-10">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="picx">上传图片</button>
                            <div class="layui-upload-list">
                                <img style="width: 150px;height: 150px" id="demo1">
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">报道日期</label>
                    <div class="col-sm-10">
                        <input name="date" type="date" value="${dynamic.date}" placeholder="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 col-sm-offset-9">
                        <button class="btn btn-lg btn-primary " type="submit"><i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">提交</span></button>
                        <button class="btn btn-lg btn-default " type="reset"><i class="fa fa-times"></i>&nbsp;&nbsp;<span class="bold">取消</span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<!--UEditor js-->
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content');
</script>
<!-- Web Uploader -->
<script type="text/javascript">
    // 添加全局站点信息
    var BASE_URL = 'js/plugins/webuploader';
</script>
<script src="<%=path%>/static/plugin/bootstrap/js/plugins/webuploader/webuploader.min.js"></script>
<script src="<%=path%>/static/plugin/bootstrap/js/demo/webuploader-demo.min.js"></script>
</body>
</html>
