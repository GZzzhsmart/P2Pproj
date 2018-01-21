<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户反馈</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp"%>
        <label id="typeValue" style="display:none;"> </label>
        <div class="personal-main">
            <div class="personal-pay">
                <h3><i>用户反馈</i></h3>
                <div class="quick-pay-wrap">
                    <form class="form-horizontal" id="feedbackFrom">
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">您的电话：</label>
                            <div class="col-sm-7">
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="电话" onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                                       onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " onfocus="hidePhoneCheck();" required>
                            </div>
                        </div>
                        <span class="col-sm-offset-4 phonecheck" style="color: red;display: none">电话有误！</span>
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">请填写内容：</label>
                            <div class="col-sm-8">
                                <textarea id="content" name="content" rows="15" class="form-control" onfocus="hidePhoneCheck();" placeholder="这里填写内容" required></textarea>
                            </div>
                        </div>
                        <span class="col-sm-offset-4 contentCheck" style="color: red;display: none">内容有误！</span>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-success btn-lg" onclick="return phoneCheck();">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/plugin/bootstrap/js/plugins/layer/layer.js" type="text/javascript"></script>
<script>
    function phoneCheck() {
        var phone = $("#phone").val();
        var content=$("#content").val();
        if(!(/^1[34578]\d{9}$/.test(phone))){
            $(".phonecheck").show();
            return false;
        }else if(content.length<=0){
            $(".contentCheck").show();
            return false;
        }else
        {
            $.post("/luser/feedback",$("#feedbackFrom").serialize(),function (data) {
                if(data.result==="ok"){
                    layer.msg("提交成功");
                    setTimeout(function(){
                        window.location.href = "/luser/userindex";
                    }, 2000);
                }else{
                    layer.msg("提交失败");
                }
            });
        }

    }
    function hidePhoneCheck(){
        $(".phonecheck").hide();
        $(".contentCheck").hide();
    }
</script>
