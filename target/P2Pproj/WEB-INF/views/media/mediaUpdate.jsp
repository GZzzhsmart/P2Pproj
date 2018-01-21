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
    <!--上传文件及图片-->
    <link href="<%=path%>/static/plugin/bootstrap/css/plugins/webuploader/webuploader.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/plugin/bootstrap/css/demo/webuploader-demo.min.css"rel="stylesheet" type="text/css">
 </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>媒体报道</h5>
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
            <form method="post" id="media-update" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" id ="title" name="title" value="${media.title}" placeholder="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <textarea id="content"  name="content" style="height: 250px;width: 825px"autofocus>${media.content}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">封面图片</label>
                    <div class=" col-sm-10" style="margin-left: 160px">
                        <div id="pic" name="pic" value="${media.pic}" class="page-container">
                            <div id="uploader" class="wu-example">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker"></div>
                                        <p>您可以尝试文件拖拽，使用QQ截屏工具，然后激活窗口后粘贴，或者点击添加图片按钮，或将照片拖到这里，单次最多可选300张</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">报道日期</label>
                    <div class="col-sm-10">
                        <input id="date" name="date" value="${media.date}" type="date" placeholder="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">报道地址</label>
                    <div class="col-sm-10">
                        <input type="text" id ="url" name="url" value="${media.url}" placeholder="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12 col-sm-offset-9">
                        <button class="btn btn-lg btn-primary " type="submit" onclick="return media_update();"><i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">提交</span></button>
                        <button class="btn btn-lg btn-default " type="button"><i class="fa fa-times"></i>&nbsp;&nbsp;<span class="bold">取消</span></button>
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
