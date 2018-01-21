<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>合作伙伴列表</title>

    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css" >
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>合作伙伴</h5>
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

            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="save" type="button" class="btn btn-default" style="display: block; border-radius: 0" data-toggle="modal" data-target="#webAdd">
                    <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>新增
                </button>
                <button id="btn_delete" onclick="deleteMany();" type="button" class="btn btn-default" style="display: block;">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
                </button>

            </div>
        </div>
    </div>
</div>
<%--网站数据的新增--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="webAddTitle">
                    新增合作伙伴
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-3 control-label">合作链接:</label>
                    <div class="col-sm-8">
                        <input type="text" id="furl" name="furl" class="form-control" required="" aria-required="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-3 control-label">封面图片:</label>
                    <div class="col-sm-8">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="picx">上传图片</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" style="width: 100px;height: 50px" id="demo1">
                                <input type="text" id="fpic"  class="form-control" name="fpic" style="height:0px;border:0px;margin:0px;padding:0px;"/>
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" id="add" class="btn btn-primary">
                        新增
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" value=""  id="deleteId"/>
<%--网站新增结束--%>
<%--网站信息的修改--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   合作伙伴修改
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="updateForm">
                    <input type="hidden" name="fid" id="fid"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">合作伙伴链接:</label>
                        <div class="col-sm-8">
                            <input type="text"  name="furl" class="form-control" required="" aria-required="true"/>
                        </div>
                    </div>

                    <input type="hidden" id="fPic1" name="fPic1" />
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">封面图片:</label>
                        <div class="col-sm-8">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="picx1">上传图片</button>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" style="width: 100px;height: 50px" id="demo11">
                                    <p id="demoText1"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" id="update" class="btn btn-success">
                            确认修改
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 请假员工的审核-->

</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>

<script src="<%=path%>/static/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#picx'
            ,url: '/friend/upload'
            ,exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){

                    $('#demo1').attr('src', result); //图片链接（base64）

                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                if(res.code==0) {
                    $('#fpic').val(res.filePath);
                    $("#formadd").data("bootstrapValidator").resetForm();
                        return layer.msg(res.msg);
                }
                /* $('#pic').val("res.msg");*/

                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });


    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#picx1'
            ,url: '/friend/upload'
            ,exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo11').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                if(res.code==0) {
                    $('#fPic1').val(res.filePath);
                    return layer.msg(res.msg);
                }
                /* $('#pic').val("res.msg");*/

                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText1');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });
</script>
<script src="<%=path%>/static/js/pageJs/friend.js"></script>
</body>
</html>
