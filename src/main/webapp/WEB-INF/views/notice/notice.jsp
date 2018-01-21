<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>最新公告</title>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <!--上传文件及图片-->


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>最新公告</h5>
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
                <button type="button" onclick="findDetails()" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>公告详情
                </button>
                <a href="<%=path%>/notice/add" type="button" class="btn btn-default" style="display: block; border-radius: 0" >
                    <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>新增
                </a>
                <button id="btn_delete" onclick="deleteMany();" type="button" class="btn btn-default" style="display: block;">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除
                </button>

            </div>
        </div>
    </div>
</div>
<%--网站数据的新增--%>
<!-- 模态框（Modal） -->
<div class="modal inmodal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="webAddTitle">
                    新增公告
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="formadd">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" id = "title" name ="title" placeholder="请输入标题" class="form-control">
                        </div>
                    </div>
                    <div class="form-group" id="divId">
                        <label class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea id="content"  name="content" style="..." autofocus>

                            </textarea>
                            <input class="form-control" type="text" id="inputId" name="inputName" style="height:0px;border:0px;margin:0px;padding:0px;"/>
                            </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" onclick="return click();" id="add" class="btn btn-primary">提交
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <input type="hidden" value=""  id="deleteId"/>
    <%--网站新增结束--%>
    <%--网站信息的修改--%>
    <div class="modal inmodal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <input type="hidden" name="nid" id="nid"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input type="text" class ="title" id="title1" name="title"  placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10">
                                <textarea class="content1" id="content1"   name="content1" style="..."autofocus></textarea>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">关闭
                            </button>
                            <button type="button" id="update"  class="btn btn-success">
                                确认修改
                            </button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
<jsp:include page="../common/bootstraptablejs.jsp"/>
<!--UEditor js-->
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">

    $(function () {
        editor = UE.getEditor("content", {
            initialFrameHeight: 40
        }).ready(function () {
            var editor = UE.getEditor("content");
            /*找到UEditor的iframe*/
            var margintop = $($('#content .edui-editor-toolbarbox')[0]).height();
            $($('#divId i')[0]).css('margin-top', margintop);
            var contents = $('#content').find('iframe').contents();
            var fn = function () {
                $("#inputId").val(UE.getEditor("content").getContent());
                $('#defaultForm').data('bootstrapValidator')//重新验证inputName
                    .updateStatus('inputName', 'NOT_VALIDATED', null)
                    .validateField('inputName');
                $($('#content div')[0]).css('border-color', $('#labelId').css('color'));
            }

            if (document.all) {//document.all识别是否在IE下，在IE下为true
                contents.get(0).attachEvent('onpropertychange', function (e) {
                    fn();
                });
            } else {
                contents.on('input', fn);
            }
        });


        $('#formadd').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '标题不能为空'
                        },

                    }
                },
                inputName: {
                    message: '内容验证失败',
                    validators: {
                        notEmpty: {
                            message: '内容不能为空'
                        },
                    }
                },

            }
        }).on('success.form.bv', function (e) {//点击提交之后
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post(
                "/notice/save",
                $("#formadd").serialize(),
                function (data) {
                    if (data.message == "ok") {
                        layer.msg(data.message, {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.message, {icon: 1, time: 1000});

                    }

                    $("#webAdd").modal('hide');
                    $("#formadd").data('bootstrapValidator').resetForm();
                    $("#title").val("");
                    $("#content").val("");
                    refush();
                }, "json"
            );
        });
    })


    $(function () {
        editor = UE.getEditor("content1", {
            initialFrameHeight: 40
        }).ready(function () {
            var editor = UE.getEditor("content1");
            /*找到UEditor的iframe*/
            var margintop = $($('#content .edui-editor-toolbarbox')[0]).height();
            $($('#divId i')[0]).css('margin-top', margintop);
            var contents = $('#content1').find('iframe').contents();
            var fn = function () {
                $("#inputId").val(UE.getEditor("content1").getContent());
                $('#defaultForm').data('bootstrapValidator')//重新验证inputName
                    .updateStatus('inputName', 'NOT_VALIDATED', null)
                    .validateField('inputName');
                $($('#content div')[0]).css('border-color', $('#labelId').css('color'));
            }

            if (document.all) {//document.all识别是否在IE下，在IE下为true
                contents.get(0).attachEvent('onpropertychange', function (e) {
                    fn();
                });
            } else {
                contents.on('input', fn);
            }
            function edit(nid,content,title) {
                $("#nid").val(nid);
                $("#content1").val(content);
                var ues = UE.getEditor('content1');
                ues.addListener("ready", function () {
                    ues.setContent(content);
                });
                $("#title1").val(title);
            }
        });




    })

    $('#updateForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            content1: {
                message: '请假理由验证失败',
                validators: {
                    notEmpty: {
                        message: '标种名称不能为空'
                    },

                }
            },
            title: {
                message: '请假理由验证失败',
                validators: {
                    notEmpty: {
                        message: '标种名称不能为空'
                    },

                }
            },

        }
    }).on('success.form.bv', function(e) {//点击提交之后
        e.preventDefault();
        var $form = $(e.target);
        var bv = $form.data('bootstrapValidator');
        $.post(
            "/notice/update",
            $("#updateForm").serialize(),
            function (data) {
                if (data.message == "ok") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.message, {icon: 1, time: 1000});

                }
                refush();
                $("#myModal").modal('hide');
                $("#title").val("");
                $("#content1").val("");
            }, "json"
        );
    });

</script>
<!-- Web Uploader -->



    <script src="<%=path%>/static/js/pageJs/notice.js"></script>
    <c:if test="${requestScope.statusVO =='修改成功'}">
    <script type="text/javascript">
        layer.msg("修改成功", {icon: 1, time: 1000});
    </script>
    </c:if>
    <c:if test="${requestScope.statusVO =='新增成功'}">
    <script type="text/javascript">
        layer.msg("新增成功", {icon: 1, time: 1000});
    </script>
    </c:if>
</body>
</html>
