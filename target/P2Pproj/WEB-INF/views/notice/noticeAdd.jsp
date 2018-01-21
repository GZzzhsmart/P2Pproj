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
    <title>最新公告</title>
    <link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/><script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
    <!--上传文件及图片-->
   </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>新增最新公告</h5>
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
            <form method="post" action="<%=path%>/notice/save" id="formadd" class="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" id = "title" name ="title" placeholder="请输入标题" class="form-control">
                    </div>
                </div>
                <div class="form-group" id="div1">
                    <label class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <script type="text/plain" id="myEditor" name="content"></script>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-12 col-sm-offset-9">
                        <button class="btn btn-lg btn-primary " onclick="return  save()" type="submit"><i class="fa fa-check"></i>&nbsp;<span class="bold">提交</span></button>
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
<!--弹出框样式--><link rel="stylesheet" href="<%=path%>/static/css/lyj/sweetalert.css"/><script type="text/javascript" src="<%=path%>/static/js/lyj/sweetalert-dev.js"></script>

<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

    UE.getEditor('myEditor',{initialFrameHeight:300,initialFrameWidth:800})



    function save() {

      var content =  UE.getEditor("myEditor").getContent();
      var title1 = $("#title").val();
      if(title1.length == 0){
          sweetAlert("标题为空！", "请输入标题！","error");
          return false;
      }
      if(content.length == 0){
          sweetAlert("内容为空！", "请输入编辑器内容！","error");
          return false;
      }else {
        return true;

      }

    }
</script>
</body>
</html>
