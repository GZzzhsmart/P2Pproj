<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>excel上传</title>
    <script src="<%=path%>/static/js/jquery.min.js"></script>
    <script src="<%=path%>/static/js/jQuery.form.js"></script>
</head>
<body>
<form id="upload"  enctype="multipart/form-data">
    <input type="file" name="file" id="file"/>
    <input type="button" onclick="toSave()" value="上传" id="btn"/>
</form>
<script>
    $(function(){
        var options = {
            type: 'POST',
            url: '<%=path %>/excel/up_saveDb',
            success:showResponse,
            dataType: 'json',
            clearForm: true,    //成功提交后，清除所有表单元素的值
        };
        $("#upload").submit(function(){
            $(this).ajaxSubmit(options);
            return false;   //防止表单自动提交
        });
    });

    /**
     * 保存操作
     */
    function toSave(){
        var ant = $("#file").val();
        if(ant == null || ant == ''){
            alert("请选择需要导入的excel文件");
        }else {
            $("#btn").attr("disabled",true);
            $("#upload").submit();
        }
    }

    /**
     * 保存后，执行回调
     * @param responseText
     * @param statusText
     * @param xhr
     * @param $form
     */
    function showResponse(responseText, statusText, xhr, $form){
        if(responseText.result == 'error'){  //文件类型错误
            $("#btn").attr("disabled",false);
            alert(responseText.message);
        } else if(responseText.result == 'success'){ //上传成功
            $("#btn").attr("disabled",false);
            alert(responseText.message);
        } else if(responseText.result == 'busy') {  //服务器繁忙
            $("#btn").attr("disabled",false);
            alert(responseText.message);
        }
    }
</script>
</body>
</html>
