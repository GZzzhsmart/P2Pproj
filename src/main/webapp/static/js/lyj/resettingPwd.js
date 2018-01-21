var contextPath='';
function update() {

   var password=document.getElementById("password").value;
    if(password==null || password==""){
        swal("新密码不能为空！","","error");
        return;
    }

    var xpassword=document.getElementById("xpassword").value;
    if(xpassword==null || xpassword==""){
        swal("确认密码不能为空！","","error");
        return;
    }

    if(password!=xpassword){
        swal("确认密码与新密码不一致！","","error");
        return;
    }

    $.post(contextPath + '/luser/resttingLogin',
        $('#longinForm').serialize(),
        function (data) {
            if (data.result === 'ok' || data.result==='logined') {
                window.location.href = contextPath + "/page/login";
            } else {
                swal(data.message,"","error");
            }
        },
        'json'
    );
}