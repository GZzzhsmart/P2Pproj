//生成用户数据
var modal;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/ticket/pager",//要请求数据的文件路径
    toolbar: '#toolbar',//指定工具栏
    striped: true, //是否显示行间隔色
    dataField: "res",
    sortable: true, //是否启用排序 sortOrder: "ID asc",
    sortOrder: "ID asc",
    pagination: true,//是否分页
    queryParamsType: 'limit',//查询参数组织方式
    queryParams: queryParams,//请求服务器时所传的参数
    sidePagination: 'server',//指定服务器端分页
    pageNumber: 1, //初始化加载第一页，默认第一页
    pageSize: 10,//单页记录数
    pageList: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],//分页步进值
    showRefresh: true,//刷新按钮
    showColumns: true,
    clickToSelect: true,//是否启用点击选中行
    toolbarAlign: 'right',//工具栏对齐方式
    buttonsAlign: 'right',//按钮对齐方式
    search: false,
    uniqueId: "id",                     //每一行的唯一标识，一般为主键列
    showExport: true,
    exportDataType: 'all',
    columns: [
        {
            title: '全选',
            field: 'select',
            //复选框
            checkbox: true,
            width: 25,
            align: 'center',
            valign: 'middle'
        },
        {
            title: '券的名称',
            field: 'tname',
            align: 'center',
            sortable: true
        },


        {
            title: '券的类别',
            field: 'type',
            align: 'center',
            sortable: true,
            formatter: function (value, row, index) {
                if (value == 1) {
                    return '<span style="color:green" >现金券</span>';
                }
                if(value==2){
                    return '<span style="color:green">代金券</span>';
                }
                if(value==3){
                    return '<span style="color:green">体验金</span>';
                }
                if(value==4){
                    return '<span style="color:green">加息券</span>';
                }
            }
        },

        {
            title: '面值',
            field: 'tkmoney',
            align: 'center',
            sortable: true,
            formatter: function (value, row, index) {
               if(row.type==4){
                   return value+"%";
               }else{
                   return value;
               }
            }
        },
        {
            title: '使用条件',
            field: 'usecondition',
            align: 'center',
            sortable: true,
            formatter: function (value) {
               if(value==null||value==0){
                   return "用于提现";
               }else{
                   return value;
               }

            }
        },
        {
            title: '使用简介',
            field: 'tintro',
            align: 'center',
            sortable: true
        },
        {
            title: '有效时间',
            field: 'tktime',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                var date = new Date(value);
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                return y + '-' + m + '-' + d;
            }
        },
        {
            title: '操作',
            align: 'center',
            field: '',
            formatter: function (value, row, index) {
                var tktime=new Date(row.tktime).toLocaleDateString();
                var currDate = new Date().toLocaleDateString();//获取系统当前时间
                if(currDate < tktime){
                    var c;
                    if(row.status==0){
                        c= '<a title="激活" href="javascript:void(0);"  onclick="active(\'' + row.status + '\',\''+ row.kid + '\')"><i class="glyphicon glyphicon-ok" style="color:green"></i></a> ';
                    }else{
                        c= '<a title="冻结" href="javascript:void(0);"  onclick="freeze(\'' + row.status + '\',\''+ row.kid + '\')"><i class="glyphicon glyphicon-remove" style="color:green"></i></a> ';
                    }

                    var d=  '<a title="点击查看使用简介" href="javascript:void(0);"  data-toggle="modal" data-id="\'' + row.kid + '\'" data-target="#seeContentModel" onclick="seeContent(\'' + row.tintro + '\')"><i class="glyphicon glyphicon-zoom-in" style="color:green"></i></a> ';
                    var e = '<a title="编辑" href="javascript:void(0);" id="leave"  data-toggle="modal" data-id="\'' + row.kid + '\'" data-target="#myModal" onclick="return edit(\'' + row.kid + '\')"><i class="glyphicon glyphicon-pencil" alt="修改" style="color:green"></i></a> ';
                    return c+d+e;
                }else{
                    var d=  '<a title="点击查看使用简介" href="javascript:void(0);"  data-toggle="modal" data-id="\'' + row.kid + '\'" data-target="#seeContentModel" onclick="seeContent(\'' + row.tintro + '\')"><i class="glyphicon glyphicon-zoom-in" style="color:green"></i></a> ';
                    d=d+"(已过期)";
                    return d;
                }
            }
        }
    ],
    locale: 'zh-CN',//中文支持,
    responseHandler: function (res) {
        if (res) {
            return {
                "res": res.rows,
                "total": res.total
            };
        } else {
            return {
                "rows": [],
                "total": 0
            };
        }
    }
})

//请求服务数据时所传参数
function queryParams(params) {
    var title = "";
    $(".search input").each(function () {
        title = $(this).val();
    });
    return {
        //每页多少条数据
        pageSize: this.pageSize,
        //请求第几页
        pageIndex: this.pageNumber,
        searchVal: title
    }
}



function edit(kid) {
    $.post("/ticket/getById/" + kid,
        function (data) {
            $("#updateForm").autofill(data);
            if(data.type==4){
                $(".tkmoneychange5").hide();
                $(".tkmoneychange6").show();
                $("#tkmoney5").val(data.tkmoney);
                $("#tkmoney2").val(null);
            }else{
                $(".tkmoneychange5").show();
                $(".tkmoneychange6").hide();
            }
            if(data.usecondition==null){
                $("#usecondition2").val(0);
            }
            $("#tname3").val(data.tname);
            $("#tintro3").val(data.tintro);
        },
        "json"
    );
}

//查询按钮事件
$('#search_btn').click(function () {
    var ticket=$("#tkmoney3").val();
    if(ticket==null||ticket==""){
        ticket=$("#tkmoney6").val();
    }
    $('#mytab').bootstrapTable('refresh', {url: '/ticket/pager',
        query:{
                type:$("#type3").val(),
                tktime:$("#tktime3").val(),
                tkmoney:ticket,
                tname:$("#tname2").val()
    }});
});
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/ticket/pager'});
}

$('#updateForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        way: {
            message: '验证失败',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },

            }
        },

    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/ticket/update",
        $("#updateForm").serialize(),
        function (data) {
            if (data.message == "ok") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 1, time: 1000});

            }
            refush();
            $("#myModal").modal('hide');
        }, "json"
    );
});


$('#formadd').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        way: {
            message: '验证失败',
            validators: {
                notEmpty: {
                    message: '不能为空'
                },

            }
        },
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/ticket/save",
        $("#formadd").serialize(),
        function (data) {
            if (data.message == "ok") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 1, time: 1000});
            }
            $("#webAdd").modal('hide');
            refush();
        }, "json"
    );
});



$("#type3").change(function () {
    if($("#type3").val()==4){
        $(".tkmoneychange").hide();
        $(".tkmoneychange2").show();
        $("#tkmoney3").val(null);
    }else{
        $(".tkmoneychange").show();
        $(".tkmoneychange2").hide();
        $("#tkmoney6").val(null);
    }
});
$("#webAdd").on('hidden.bs.modal', function (e) {
    $(".tkmoneychange3").show();
    $(".tkmoneychange4").hide();
    // do something...
});
$("#myModal").on('hidden.bs.modal', function (e) {
    $(".tkmoneychange5").show();
    $(".tkmoneychange6").hide();
    // do something...
});
$("#type1").change(function () {
    if($("#type1").val()==4){
        $(".tkmoneychange3").hide();
        $(".tkmoneychange4").show();
        $("#tkmoney1").val(null);
    }else{
        $(".tkmoneychange3").show();
        $(".tkmoneychange4").hide();
        $("#tkmoney4").val(null);
    }
});
$("#type2").change(function () {
    if($("#type2").val()==4){
        $(".tkmoneychange5").hide();
        $(".tkmoneychange6").show();
        $("#tkmoney2").val(null);
    }else{
        $(".tkmoneychange5").show();
        $(".tkmoneychange6").hide();
        $("#tkmoney5").val(null);
    }
});

function seeContent(content) {
    $("#contentSpan").html(content);
}
function active(status,kid) {
    $.post(
        "/ticket/activeAndFreeze",
        {"status":status,
            "kid":kid
        },
        function (data) {
            if (data.result == "ok") {
                layer.msg("已激活", {icon: 1, time: 1000});
            } else {
                layer.msg("发生错误", {icon: 1, time: 1000});
            }
            refush();
        }, "json"
    );
}
function freeze(status,kid) {
    $.post(
        "/ticket/activeAndFreeze",
        {"status":status,
            "kid":kid
        },
        function (data) {
            if (data.result == "ok") {
                layer.msg("已冻结", {icon: 1, time: 1000});
            } else {
                layer.msg("发生错误", {icon: 1, time: 1000});
            }
            refush();
        }, "json"
    );
}



