var contextPath='';
function login() {

   var phone=document.getElementById("phone").value;
    if(phone==null || phone==""){
        swal("手机号不能为空！","","error");
        return;
    }

    var password=document.getElementById("pwd").value;
    if(password==null || password==""){
        swal("密码不能为空！","","error");
        return;
    }

    $.post(contextPath + '/Huser/page',
        $('#longinForm').serialize(),
        function (data) {
            if (data.result === 'ok') {
                window.location.href = contextPath + "/Huser/index";
            } else {
                swal(data.message,"","error");
            }
        },
        'json'
    );
}