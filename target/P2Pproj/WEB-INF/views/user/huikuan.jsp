<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>还款计划</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>

    <link href="<%=path%>/static/plugin/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet">


</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <div class="personal-main">
            <div class="personal-money">
                <h3><i>还款计划</i></h3>


                <input type="hidden" id="uid" name="uid"  value="${uid}">

                <input type="hidden" id="check" name="check"  value="${check}">

                <table id="mytab" name="mytab" class="table table-hover"></table>
                <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">

                    <button id="sh" type="button"  class="btn btn-default" style="display: block; border-radius: 0" data-target="#exampleModal">
                        <span class="glyphicon glyphicon-screenshot" aria-hidden="true" ></span>还款
                    </button>
                </div>
            </div>


        </div>
        <div class="clear"></div>
    </div>
</div>


<%--网站信息的修改--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">审核</h4>
            </div>
            <div class="modal-body">

                <form id="from1" method="post" class="form-horizontal"  action="<%=path%>/hk/huanmoney">

                    <input type="hidden"  class="form-control"  name="rows.uid"/>

                    <input type="hidden"  class="form-control"  name="rows.ybx"/>

                    <input type="hidden"  class="form-control"  name="rows.ylx"/>

                    <input type="hidden"  class="form-control"  name="rows.ybj"/>

                    <input type="hidden"  class="form-control"  name="rows.djq"/>

                    <input type="hidden"  class="form-control"  name="rows.state"/>

                    <input type="hidden"  class="form-control"  name="rows.hkid"/>

                    <input type="hidden"  class="form-control"  name="rows.baid"/>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付密码</label>
                        <div class="col-sm-8">
                            <input type="password" id="pass" name="password"  class="form-control" required="" aria-required="true"/>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit"  class="btn btn-primary">确认还款</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>


<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
<jsp:include page="../common/bootstraptablejs.jsp"/>

<script src="<%=path%>/static/plugin/bootstrap/js/plugins/layer/layer.js"></script>


<script src="<%=path%>/static/js/lyj/huankuanList.js"></script>


<script src="<%=path%>/static/js/lyj/bootstrapValidator.js"></script>
<script src="<%=path%>/static/js/lyj/formFill.js"></script>

</html>
