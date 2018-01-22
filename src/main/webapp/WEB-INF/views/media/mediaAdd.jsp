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
    <%--layui上传图片--%>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"  media="all">
    <jsp:include page="../common/bootstraptablecss.jsp"/>
 </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>媒体报道</h5>
            <div class="ibox-tools">
                <h5><a  style="color: blue" href="<%=path%>/media/page">返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" id="mediaAdd" class="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" placeholder="请输入标题" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <textarea id="editor" name="content" style="height: 250px;width: 825px" required autofocus></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-10">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="picx">上传图片</button>
                            <div class="layui-upload-list">
                                <p id="demo"></p>
                                <input type="text" id="pic"  class="form-control" name="pic" style="height:0px;border:0px;margin:0px;padding:0px;"/>
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">报道地址</label>
                    <div class="col-sm-10">
                        <input type="url" id="url" name="url" placeholder="请输入报道地址"class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">报道日期</label>
                    <div class="col-sm-10">
                        <input id="date" name="date" type="date" placeholder="请选择报道日期" class="form-control">
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
    var ue = UE.getEditor('editor');
</script>
<%--layui上传图片--%>
<script src="<%=path%>/static/layui/layui.js" charset="utf-8"></script>
<script src="<%=path%>/static/js/pageJs/upload.js"></script>
<script src="<%=path%>/static/js/pageJs/media.js"></script>
</body>
</html>
