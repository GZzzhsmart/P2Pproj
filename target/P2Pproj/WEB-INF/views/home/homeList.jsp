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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">链接1：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="l1" id="l1"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">链接2：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="l2" id="l2"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">链接3：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="l3" id="l3"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">链接4：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="l4" id="l4"/>
                    </div>
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">手机号码：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="phone" id="phone"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">创建时间：</label>
                    <div class="col-sm-2">
                        <input type="date" class="form-control" name="date" id="date"/>
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
<div class="modal inmodal fade" id="homeUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <form class="form-horizontal" id="updateForm">
                    <input type="hidden" name="hid"/>
                    <input type="hidden" name="state"/>
                    <input type="hidden" id="pic1" name="pic1"/>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">轮播图1</label>
                        <div class="col-sm-10">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test1">上传图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 150px;height: 150px" id="demo1">
                                    <p id="demoText1"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">链接1</label>
                        <div class="col-sm-10">
                            <input type="text" name="l1" class="form-control">
                        </div>
                    </div>
                    <input type="hidden" id="pic2" name="pic2"/>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">轮播图2</label>
                        <div class="col-sm-10">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test2">上传图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 150px;height: 150px" id="demo2">
                                    <p id="demoText2"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">链接2</label>
                        <div class="col-sm-10">
                            <input type="text" name="l2" class="form-control">
                        </div>
                    </div>
                    <input type="hidden" id="pic3" name="pic3"/>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">轮播图3</label>
                        <div class="col-sm-10">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test3">上传图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 150px;height: 150px" id="demo3">
                                    <p id="demoText3"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">链接3</label>
                        <div class="col-sm-10">
                            <input type="text" name="l3" class="form-control">
                        </div>
                    </div>
                     <input type="hidden" id="ewm" name="ewm"/>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">二维码图片</label>
                        <div class="col-sm-10">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test4">上传图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 150px;height: 150px" id="demo4">
                                    <p id="demoText4"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">链接4</label>
                        <div class="col-sm-10">
                            <input type="text" name="l4" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">报道日期</label>
                        <div class="col-sm-10">
                            <input name="date" type="date" class="form-control">
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
<%--layui上传图片--%>
<script src="<%=path%>/static/layui/layui.js" charset="utf-8"></script>
<script src="<%=path%>/static/js/pageJs/upload.js"></script>
<script src="<%=path%>/static/js/pageJs/home.js"></script>
</body>
</html>
