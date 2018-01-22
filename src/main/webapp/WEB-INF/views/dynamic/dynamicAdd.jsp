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
    <%--layui上传图片--%>
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css"  media="all">
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>新增公司动态</h5>
            <div class="ibox-tools">
               <h5><a  style="color: blue" href="<%=path%>/dynamic/page">返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a></h5>
            </div>
        </div>
        <div class="ibox-content">
            <form method="post" id="dynamicAdd" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" placeholder="请输入标题" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <textarea id="editor" name="content" required="required" style="height: 250px;width: 825px"autofocus></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">封面图片</label>
                    <div class="col-sm-10">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="pics">上传图片</button>
                            <div class="layui-upload-list">
                                <p id="demo2"></p>
                                <input type="text" id="pic"  class="form-control" name="pic" style="height:0px;border:0px;margin:0px;padding:0px;"/>
                                <p id="demoText"></p>
                            </div>
                        </div>
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
                        <button class="btn btn-lg btn-primary " onclick="return save()"type="submit"><i class="fa fa-check"></i>&nbsp;&nbsp;<span class="bold">提交</span></button>
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
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#pics'
            ,url: '<%=path%>/dynamic/upload'
            ,exts: 'png|PNG|JPEG|jpeg|gif|GIF|jpg|JPG' //只允许上传压缩文件
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    var demo2= $('#demo2');
                    demo2.html('<img style="width: 150px;height: 130px;background-color: white" id="demo1">');
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                if(res.code==0) {
                    $('#pic').val(res.filePath);
                    $("#dynamicAdd").data("bootstrapValidator").resetForm();
                    return layer.msg(res.msg);
                }
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

</script>
<%--<script src="<%=path%>/static/js/pageJs/upload.js"></script>--%>
<script src="<%=path%>/static/js/pageJs/dynamic.js"></script>
</body>
</html>
