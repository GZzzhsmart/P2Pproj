//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/dynamic/pager_criteria",//要请求数据的文件路径
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
    toolbar: '#toolbar',
    search: true,
    uniqueId: "id",                     //每一行的唯一标识，一般为主键列
    showExport: true,
    exportDataType: 'all',
    columns: [
        {
            title: '全选',
            field: 'select',
            //复选框
            checkbox: true,
            width: 50,
            align: 'center',
            valign: 'middle'
        },

        {
            title: '报道标题',
            field: 'title',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '封面图片',
            field: 'pic',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                return  "<img style='width: 100px;height:50px' src='http://localhost:8080/"+value+"'>";
            }
        }
        ,
        {
            title: '创建时间',
            field: 'date',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                var date = new Date(value);
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                var h = date.getHours();
                var mi = date.getMinutes();
                var ss = date.getSeconds();
                return y + '-' + m + '-' + d ;
            }
        }
        ,

        {
            title: '状态',
            field: 'state',
            align: 'center',
            formatter: function (value, row, index) {
                if (value == 1) {
                    //表示激活状态
                    return '<span style="color:red" >冻结</span>';
                } else if(value == 0) {
                    //表示冻结状态
                    return '<span style="color:green">激活</span>';
                }
            }
        }
        ,
        {
            title: '操作',
            align: 'center',
            field: '',
            formatter: function (value, row, index) {
                var e = '<a title="编辑" href="initUpdate/'+ row.dyid+'"><i class="glyphicon glyphicon-pencil" alt="修改" style="color:green"></i></a> ';
                var d = '<a title="删除" href="javascript:void(0);" onclick="del(' + row.dyid + ',' + row.state + ')"><i class="glyphicon glyphicon-trash" alt="删除" style="color:red"></i></a> ';
                var f = '';
                if (row.state == 0) {
                    f = '<a title="冻结" href="javascript:void(0);" onclick="updatestatus(' + row.dyid + ',' + 1 + ')"><i class="glyphicon glyphicon-ok-sign" style="color:green"></i></a> ';
                } else if (row.state == 1) {
                    f = '<a title="激活" href="javascript:void(0);" onclick="updatestatus(' + row.dyid + ',' + 0 + ')"><i class="glyphicon glyphicon-remove-sign"  style="color:red"></i></a> ';
                }


                return e + d + f;
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
//查询按钮事件
$('#search_btn').click(function () {
    var title = $('#title').val();
    var date = $('#date').val();
    $('#mytab').bootstrapTable('refresh', {url: '/dynamic/pager_criteria',
    query:{title:title,date:date}});
})
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/dynamic/pager_criteria'});
}

//单个删除
function del(dyid, state) {
    if (state == 0) {
        layer.msg("删除失败，已经激活的不允许删除!", {icon: 2, time: 3000});
        return;
    }
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '/dynamic/delete/' + dyid,
            dataType: 'json',
            success: function (data) {
                if (data.result == 'ok!') {
                    layer.msg(data.message, {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
                refush();
            },
            error: function (data) {
                console.log(data.msg);
            },
        });
    });
}
//编辑
function edit(dyid) {
         $.post("/dynamic/findDynamic/" + dyid,
            function (data) {
                $("#updateForm").autofill(data);
                $("#demo1").attr("src","/"+data.pic);
            },
            "json"
        );
}
function update() {
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        return row.dyid;
    });
    if (row == "") {
        layer.msg('修改失败，请勾选数据!', {
            icon: 2,
            time: 2000
        });
        return ;

    }else {
        $.post("/dynamic/initUpadate/" + $("#dyid").val(),
            function (data) {
                if (data.result == "ok") {
                    $("#updateForm").autofill(data);
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }

            },
            "json"
        );
    }
}

function updatestatus(dyid, state) {
    $.post("/dynamic/updateStatus/" + dyid + "/" + state,
        function (data) {
            if (state == 1) {
                if (data.result == "ok") {
                    layer.msg("已冻结", {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
            } else {
                if (data.result == "ok") {
                    layer.msg("已激活", {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
            }
            refush();
        },
        "json"
    );
}
//新增
$('#dynamicAdd').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        title: {
            message: '标题验证失败',
            validators: {
                notEmpty: {
                    message: '请输入标题'
                },
                stringLength: {
                    min: 1,
                    max: 20,
                    message: '标题长度必须在1到20之间'
                }
            }
        },
        pic: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '封面图片不能为空'
                }
            }
        },
        date: {
             message: '时间验证失败',
             validators: {
                 notEmpty: {
                     message: '请选择时间'
                 },
                 date:{
                     format : 'YYYY/MM/DD',
                     message : '日期格式不正确'
                 }

             }
        }
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    alert($("#pic").val());
    var bv = $form.data('bootstrapValidator');
     $.post(
        "/dynamic/save",
        $('#dynamicAdd').serialize(),
        function (data) {
            if (data.result == "ok") {
                layer.msg(data.message, {icon: 1, time: 3000});
            } else {
                layer.msg(data.message, {icon: 2, time: 3000});
            }
            $("#dynamicAdd").data('bootstrapValidator').resetForm();
            $("#title").val("");
            $("#date").val("");
            $("#demo2").html('');
            $("#demo1").attr("src",'');
            $("#demoText").val("");
            $("#pic").val("");
            ue.setContent('');
             refush();
        },
        "json"
    );
});
//修改
$('#updateForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        title: {
            message: '标题验证失败',
            validators: {
                notEmpty: {
                    message: '请输入标题'
                },
                stringLength: {
                    min: 1,
                    max: 20,
                    message: '标题长度必须在1到20之间'
                }
            }
        },
        pic: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '封面图片不能为空'
                }
            }
        },
        date: {
            message: '报道时间验证失败',
            validators: {
                notEmpty: {
                    message: '请选择报道时间'
                },
                date:{
                    format : 'YYYY/MM/DD',
                    message : '日期格式不正确'
                }

            }
        }
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');

    $.post(
        "/dynamic/update",
        $('#updateForm').serialize(),
        function (data) {
            if (data.result == "ok") {
                layer.msg(data.message, {icon: 1, time: 3000});
            } else {
                layer.msg(data.message, {icon: 2, time: 3000});
            }
            $("#dynamicUpdate").modal('hide');
            $("#title").val("");
            $("#pic").val("");
            $("#date").val("");
            ue.setContent('');
            $("#demo1").attr("src",'');
             refush();
        },
        "json"
    );
});
function deleteMany() {
    var isactivity = "";
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        if (row.state == 0) {
            isactivity += row.state;
        }
        return row.id;
    });
    if (row == "") {
        layer.msg('删除失败，请勾选数据!', {
            icon: 2,
            time: 2000
        });
        return;
    }
    if (isactivity != "") {
        layer.msg('删除失败，已经激活的不允许删除!', {
            icon: 2,
            time: 2000
        });
        return;

    }
    $("#deleteId").val(row);
    layer.confirm('确认要执行批量删除媒体报道数据吗？', function (index) {
        $.post(
            "/dynamic/deleteMany",
            {
                "manyId": $("#deleteId").val()
            },
            function (data) {
                if (data.result == "ok") {
                    layer.msg("批量删除成功", {icon: 1, time: 3000});
                    refush();
                } else {
                    layer.msg("批量删除失败", {icon: 2, time: 3000});
                }
                refush();
            }, "json"
        );
    });
}
