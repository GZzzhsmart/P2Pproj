<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统消息</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css" />
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
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
            <div class="personal-xtxx">
                <h3><i>系统消息</i></h3>
                <form id="form" name="form" method="post" action="">
                    <input type="hidden" name="form" value="form">
                    <span id="form:dataTable">
          <script type="text/javascript">
								//<![CDATA[
                                $(function(){
                                    $("#pxtxx-list li").click(function(){
                                        var changeStatusTag = false;
                                        if($(this).children("span").hasClass("pxtxx-newmail")){
                                            $(this).children("span").removeClass("fb");
                                            $(this).children("span.pxtxx-newmail").removeClass("pxtxx-newmail").addClass("pxtxx-mail");
                                            changeStatusTag = true;
                                        }
                                        $(this).children(".pxtxx-notice").show();
                                        /*var displayValue = $(this).children(".pxtxx-notice").css("display");
                                         if("block"==displayValue || "inline"==displayValue){
                                         $(this).css("background-color","#fff");
                                         $(this).mouseover(function(){
                                         $(this).css("background-color","#fff");
                                         });
                                         $(this).mouseout(function(){
                                         $(this).css("background-color","#fff");
                                         });
                                         }else if("none"==$(this).children(".pxtxx-notice").css("display")){
                                         $(this).css("background-color","#F8F8F8");
                                         $(this).mouseover(function(){
                                         $(this).css("background-color","#F8F8F8");
                                         });
                                         $(this).mouseout(function(){
                                         $(this).css("background-color","#fff");
                                         });

                                         }*/
                                        $(this).siblings().children(".pxtxx-notice").css("display","none");
                                        if(changeStatusTag){
                                            $(this).children("a").click();
                                            $(this).click();
                                        }
                                    });
                                });

                                //]]>
								</script>
          <div id="pxtxx-tab" class="pxtxx-tab">
            <ul>
              <li class="on"><a  href="#" style="color:#fff;padding:5px 22px;display:block;" title="全部">全部</a> </li>
              <li><a href="#" style="padding:5px 22px;display:block;" title="未读">未读</a> </li>
              <li><a href="#" style="padding:5px 22px;display:block;" title="已读">已读</a> </li>
            </ul>
            <span class="xxsz" style="display:none;">消息设置</span> </div>
          <div class="pxtxx-title"> <span class="pxtxx-type ml46">消息类型</span><span class="pxtxx-con">内容</span><span class="pxxtx-date">发送时间</span> </div>
          <div id="pxtxx-list" class="pxtxx-list">
            <ul>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
              <li><span class="pxtxx-type ml46">公司公告</span><span class="pxtxx-con">热烈祝贺阳光易贷新平台上线</span><span class="pxxtx-date">2015-10-1</span></li>
            </ul>
          </div>
          </span>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>
<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
</body>
</html>
