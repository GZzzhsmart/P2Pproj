//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/role/roleQuery",//要请求数据的文件路径
    toolbar: '#toolbar',//指定工具栏
    striped: true, //是否显示行间隔色
    dataField: "res",
    sortable: true, //是否启用排序 sortOrder: "ID asc",
    sortOrder: "ID asc",
    pagination: true,//是否分页
    //queryParamsType: 'limit',//查询参数组织方式
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
    search: true,
    uniqueId: "id", //每一行的唯一标识，一般为主键列
    showExport: true,
    exportDataType: 'all',
    columns: [
        {
            radio: true,
            width: 25,
            align: 'center',
            valign: 'middle'
        },
        {
            title: '角色名称',
            field: 'rname',
            align: 'center',
            sortable: true
        },
        {
            title: '角色描述',
            field: 'content',
            align: 'center',
            sortable: true
        },
        {
            title: '状态',
            field: 'status',
            align: 'center',
            formatter:function (value,row,index) {
                if(value == 1) {
                    return '<label style="color:green">激活</label>';
                }else if(value == 2){
                    return '<label style="color:red">冻结</label>';
                }
            }
        },
        {
            title: '操作',
            align: 'center',
            field: '',
            formatter: function (value, row, index) {
                if(row.status == 1){
                    var e = '<a title="修改" href="javascript:void(0);" id="modify"  data-toggle="modal" data-id="\'' + row.rid + '\'" data-target="#myModal" onclick="return edit(\'' + row.rid + '\',\'' + row.rname + '\',\'' + row.content + '\',)"><i class="glyphicon glyphicon-pencil" alt="修改" style="color:chartreuse"></i></a> ';
                    var f = '<a title="冻结" href="javascript:void(0);" onclick="updateStatus(\'' + row.rid + '\', \'' + 2 + '\')"><i class="glyphicon glyphicon-remove" alt="冻结" style="color:red"></i></a> ';
                }else if(row.status == 2){
                    var e = '';
                    var f = '<a title="激活" href="javascript:void(0);" onclick="updateStatus(\'' + row.rid + '\',\'' + 1 + '\')"><i class="glyphicon glyphicon-ok" alt="激活" style="color:green"></i></a> ';
                }
                return e + f;




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
});

//请求服务数据时所传参数
function queryParams(params) {
    var content = "";
    $("#content").each(function () {
        content = $(this).val();
    });
    return {
        //每页多少条数据
        pageSize: this.pageSize,
        //请求第几页
        pageIndex: this.pageNumber,
        content: content
    }
}

//刷新表格
function refush() {
    $('#mytab').bootstrapTable('refresh');
}

//按条件查询     未用到
function doSearchContent() {
    var content = $("#content").val();
    var options = $("#mytab").bootstrapTable('refresh', {
        url: '/role/roleQuery',
        query: {content: content}
    });
}

//验证并新增角色
$('#formadd').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        rname: {
            message: '角色名称验证失败',
            validators: {
                notEmpty: {
                    message: '角色名称不能为空'
                },

            }
        },
        content: {
            message: '角色描述验证失败',
            validators: {
                notEmpty: {
                    message: '角色描述不能为空'
                }
            }
        },
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/role/addRole",
        $("#formadd").serialize(),
            function (data) {
            if (data.result == "ok") {
                swal(data.message, "新增角色成功","success");
            } else {
                swal(data.message, "发生错误","error");
            }
            $("#webAdd").modal('hide');
            $("#formadd").data('bootstrapValidator').resetForm();
            $("#addRname").val("");
            $("#addContent").val("");
            refush();
        }, "json"
    );
});


//修改前填充数据到模态框
function edit(rid,rname,content) {
    $("#rid").val(rid);
    $("#updateRname").val(rname);
    $("#updateContent").val(content);
}

//角色修改
$('#updateForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        rname: {
            message: '角色名称验证失败',
            validators: {
                notEmpty: {
                    message: '角色名称不能为空'
                },

            }
        },
        content: {
            message: '角色描述验证失败',
            validators: {
                notEmpty: {
                    message: '角色描述不能为空'
                }

            }
        },
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/role/updateRole",
        $("#updateForm").serialize(),
        function (data) {
            if (data.result == "ok") {
                swal(data.message,"可对角色进行修改操作","success");
            } else {
                swal(data.message,"发生错误","error");
            }
            $("#updateForm").data('bootstrapValidator').resetForm();
            $("#myModal").modal('hide');
            $("#updateRname").val("");
            $("#updateContent").val("");
            refush();
        }, "json"
    );
});



function updateStatus(roleId,status) {
    if(status == 2){
        swal({
                title: "确定冻结吗？冻结后该角色将不可用",
                text: "冻结后可激活,激活后可用！",
                type: "warning",
                showCancelButton: true,
                cancelButtonText:"取消",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定冻结",
                closeOnConfirm: false
            },
            function(){
                swal("冻结！", "角色已被冻结", "success");
                postUpdateStatus(roleId,status);
            });
    }else if(status == 1){
        swal({
                title: "确定激活吗？",
                text: "激活后可进行修改操作！",
                type: "warning",
                showCancelButton: true,
                cancelButtonText:"取消",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定激活",
                closeOnConfirm: false
            },
            function(){
                swal("激活！", "角色已被激活。", "success");
                postUpdateStatus(roleId,status);
            });
    }
}

function postUpdateStatus(roleId,status) {
    $.post(
        "/role/updateStatus",
        {roleId:roleId,status:status},
        function (data) {
            if(data.result == "ok"){
                refush();
            }
        },
        "json"
    );
}

