var path="";
var check="";

function checkPhone() {

    $.post(path + '/Huser/checkPhone',
        $('#registerForm').serialize(),
        function (data) {
            if (data.result === 'ok') {
                // window.location.href = path + "/luser/userindex";
            } else {
                swal(data.message,"","error");

                if(data.message!=null){
                    check=data.message;
                }
            }
        },
        'json'
    );
}


function register() {

    if(check!=null && check!=""){
        swal(check,"","error");
        return;
    }


    var name=document.getElementById("huname").value;
    if(name==null || name==""){
        swal("用户名不能为空！","","error");
        return;
    }




    var password=document.getElementById("hpwd").value;
    if(password==null || password==""){
        swal("密码不能为空！","","error");
        return;
    }

    var repeatPassword=document.getElementById("pwd").value;
    if(repeatPassword==null || repeatPassword==""){
        swal("确认密码不能为空！","","error");
        return;
    }

    if(password!=repeatPassword){
        swal("密码与确认密码不一致！","","error");
        return ;
    }

    var phone=document.getElementById("phone").value;
    if(phone==null || phone==""){
        swal("手机号码不能为空！","","error");
        return;
    }
    if(isNaN(phone)){
        swal("手机号请输入数字类型！","","error");
        return;
    }


    $.post(path + '/Huser/registerSave',
        $('#registerForm').serialize(),
        function(data) {
             if (data.result == 'ok') {
                //window.location.href = path + "/Huser/registerSuccess";
                 swal("您已提交申请，请耐心等待审核。","","success");
             }
             else {
                swal(data.message,"","error");
             }
        },
        'json'
    );
}

