<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/31
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>标种列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>优惠券</h5>
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
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">卷类：</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="type3" id="type3">
                                <option></option>
                                <option value="1">现金券</option>
                                <option value="2">代金券</option>
                                <option value="3">体验金</option>
                                <option value="4">加息券</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">面值：</label>
                        <div class="col-sm-2 tkmoneychange">
                            <input type="text" class="form-control" name="tkmoney3" id="tkmoney3"/>
                        </div>
                        <div class="col-sm-2 input-group tkmoneychange2" style="display: none">
                            <div class="input-group-addon" style="border: none"></div>
                            <input type="text" class="form-control onlynumber" id="tkmoney6" name="tkmoney6" required="" aria-required="true"
                                   onkeyup="value=value.replace(/[^\d\.]/g,'')" onblur="value=value.replace(/[^\d\.]/g,'')"
                            >
                            <div class="input-group-addon" style="border: none">%</div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12" style="margin-top:5px">
                        <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">有效时间：</label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" name="tktime3" id="tktime3"/>
                        </div>
                        <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">优惠券名称：</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="tname2" id="tname2"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-12" style="margin-top:5px">
                        <div class="col-sm-2 col-sm-offset-4">
                            <button class="btn btn-primary" id="search_btn">查询</button>
                        </div>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                <button id="save" type="button" onclick="return save()" class="btn btn-default" style="display: block; border-radius: 0" data-toggle="modal" data-target="#webAdd">
                    <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>新增
                </button>
            </div>
        </div>
    </div>
</div>
<%--优惠券的新增--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="webAddTitle">
                    新增优惠券
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="form-group">
                    <label class="col-sm-3 control-label">优惠券类别：</label>
                    <div class="col-sm-8">
                        <select id="type1" name="type" class="form-control" required="" aria-required="true">
                            <option value="1">现金券</option>
                            <option value="2">代金券</option>
                            <option value="3">体验金</option>
                            <option value="4">加息券</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">面值：</label>
                    <div class="col-sm-8 tkmoneychange3">
                        <input type="text" id="tkmoney" name="tkmoney" class="form-control" required="" aria-required="true"
                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=
                               this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=
                               this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                        >
                    </div>
                    <div class="col-sm-8 input-group tkmoneychange4" style="display: none">
                        <div class="input-group-addon" style="border: none"></div>
                        <input type="text" class="form-control onlynumber" id="tkmoney4" name="tkmoney4" required="" aria-required="true"
                               onkeyup="value=value.replace(/[^\d\.]/g,'')" onblur="value=value.replace(/[^\d\.]/g,'')"
                        >
                        <div class="input-group-addon" style="border: none">%</div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">有效截止日期：</label>
                    <div class="col-sm-8">
                        <input type="date" id="tktime" name="tktime" class="form-control" required="" aria-required="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">名称：</label>
                    <div class="col-sm-8">
                        <input type="text" id="tname" name="tname" class="form-control" required="" aria-required="true">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" style="text-align: right; margin-top:5px">使用条件大于：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="usecondition"value="0" id="usecondition" required="" aria-required="true"
                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=
                               this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=
                               this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                        />
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="col-sm-3 control-label">简介：</label>
                    <div class="col-sm-8">
                        <textarea id="tintro" name="tintro" class="form-control" rows="5" required="" aria-required="true"></textarea>
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
<%--优惠券新增结束--%>
<%--优惠券修改--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  id="updateForm">
                    <input type="hidden" name="kid" id="kid"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">优惠券类别：</label>
                        <div class="col-sm-8">
                            <select id="type2" name="type" class="form-control" required="" aria-required="true" disabled aria-disabled="true">
                                <option value="1">现金券</option>
                                <option value="2">代金券</option>
                                <option value="3">体验金</option>
                                <option value="4">加息券</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">面值：</label>
                        <div class="col-sm-8 tkmoneychange5">
                            <input type="text" id="tkmoney2" name="tkmoney" class="form-control" required="" aria-required="true" readonly=""
                                   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=
                               this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=
                               this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                            />
                        </div>
                        <div class="col-sm-8 input-group tkmoneychange6" style="display: none">
                            <div class="input-group-addon" style="border: none"></div>
                            <input type="text" class="form-control" id="tkmoney5" name="tkmoney5" required="" aria-required="true" readonly=""
                                   onkeyup="value=value.replace(/[^\d\.]/g,'')" onblur="value=value.replace(/[^\d\.]/g,'')"
                            >
                            <div class="input-group-addon" style="border: none">%</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">有效截止日期大于：</label>
                        <div class="col-sm-8">
                            <input type="date" id="tktime2" name="tktime" class="form-control" required="" aria-required="true" readonly=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称：</label>
                        <div class="col-sm-8">
                            <input type="text" id="tname3" name="tname3" class="form-control" required="" aria-required="true" readonly="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" style="text-align: right; margin-top:5px">使用条件大于：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="usecondition" value="0" id="usecondition2" required="" aria-required="true"
                                   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=
                               this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=
                               this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                            />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">简介：</label>
                        <div class="col-sm-8">
                            <textarea id="tintro3" name="tintro3" class="form-control" rows="5" required="" aria-required="true"></textarea>
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
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="seeContentModel" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    使用简介查看
                </h4>
            </div>
            <div style="margin-top: 10px">
                <span id="contentSpan"  style="font-size: 18px;font-style: normal;padding-left: 10px"></span>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/ticket.js"></script>

</body>
</html>
