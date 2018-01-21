var contextPath='';
function login() {

   var name=document.getElementById("name").value;
    if(name==null || name==""){
        swal("用户名不能为空！","","error");
        return;
    }

    var password=document.getElementById("password").value;
    if(password==null || password==""){
        swal("密码不能为空！","","error");
        return;
    }

    $.post(contextPath + '/luser/login',
        $('#longinForm').serialize(),
        function (data) {
            if (data.result === 'ok' || data.result==='logined') {
                window.location.href = contextPath + "/luser/userindex";
            } else {
                swal(data.message,"","error");
            }
        },
        'json'
    );
}