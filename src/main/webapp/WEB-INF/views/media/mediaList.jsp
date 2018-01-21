<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>媒体报道列表</title>
    <%--layui上传图片--%>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"  media="all">
    <jsp:include page="../common/bootstraptablecss.jsp"/>
 </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>媒体报道列表</h5>
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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">媒体报道标题：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="title" id="title"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">报道时间：</label>
                    <div class="col-sm-2">
                        <input type="date" class="form-control" name="date" id="date"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">报道地址：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="url" id="url"/>
                    </div>

                    <div class="col-sm-1 col-sm-offset-1">
                        <button class="btn btn-primary" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
        </div>
    </div>
</div>
<%--网站信息的修改--%>
<div class="modal inmodal fade" id="mediaUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    报道的更改
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="updateForm">
                    <input type="hidden" name="mid"/>
                    <input type="hidden" name="state"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" name ="title" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea id="editor" name="content" style="height: 250px;width: 700px">${media.content}</textarea>
                        </div>
                    </div>
                    <input type="hidden" id="pic" name="pic"/>
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
                            <input name="date" type="date" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">报道地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="url" class="form-control">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-lg btn-primary" id="update" type="submit"><i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">提交</span></button>
                        <button class="btn btn-lg btn-default" data-dismiss="modal" type="button"><i class="fa fa-times"></i>&nbsp;&nbsp;<span class="bold">取消</span></button>

                    </div>
                </form>
            </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<!--UEditor js-->
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('editor').getContentTxt();
</script>

<%--layui上传图片--%>
<script src="<%=path%>/static/layui/layui.js" charset="utf-8"></script>
<script src="<%=path%>/static/js/pageJs/upload.js"></script>
<script src="<%=path%>/static/js/pageJs/media.js"></script>
</body>
</html>
