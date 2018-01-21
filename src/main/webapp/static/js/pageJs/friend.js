//生成用户数据
var modal;
var localhostPaht= window.location.host;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/friend/pager",//要请求数据的文件路径
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
            width: 25,
            align: 'center',
            valign: 'middle'
        },

        {
            title: '合作伙伴链接',
            field: 'furl',
            align: 'center',
            sortable: true
        },

        {
            title: '图片',
            field: 'fpic',
            align: 'center',
            formatter: function (value,row,index){
                return   '<img  src=../'+value+'   width="200" height="50"  >';
            }
        }
        ,

        {
            title: '操作',
            align: 'center',
            field: '',
            formatter: function (value, row, index) {
                var e = '<a title="编辑" href="javascript:void(0);" id="leave"  data-toggle="modal" data-id="\'' + row.fid + '\'" data-target="#myModal" onclick="return edit(\'' + row.fid + '\')"><i class="glyphicon glyphicon-pencil" alt="修改" style="color:green"></i></a> ';
                var d = '<a title="删除" href="javascript:void(0);" onclick="del(' + row.fid +')"><i class="glyphicon glyphicon-trash" alt="删除" style="color:red"></i></a> ';
                return e + d ;
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
function del(fid) {

    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '/friend/delete/' + fid,
            dataType: 'json',
            success: function (data) {
                if (data.result == 'ok') {
                    layer.msg(data.message, {icon: 1, time: 1000});
                    refush();
                } else {
                    layer.msg(data.message, {icon: 2, time: 1000});
                }
                refush();
            },
            error: function (data) {
                console.log(data.msg);
            },
        });
    });
}

function deleteMany() {
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        return row.fid;
    });
    if (row == "") {
        layer.msg('删除失败，请勾选数据!', {
            icon: 2,
            time: 2000
        });
        return;
    }


    $("#fid").val(row);
    layer.confirm('确认要删除数据吗？', function (index) {
        $.post(
            "/friend/delete/" +$("#fid").val(),
            function (data) {
                if (data.result == "ok") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                    refush();
                } else {
                    layer.msg(data.message, {icon: 2, time: 1000});
                }
                refush();
            }, "json"
        );
    });

}

function edit(fid) {
    $.post("/friend/findFriend/" + fid,
        function (data) {
            $('#demo11').attr('src', '../'+data.fpic);
            $("#updateForm").autofill(data);

        },
        "json"
    );
}

function update() {
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        return row.fid;
    });
    if (row == "") {
        layer.msg('修改失败，请勾选数据!', {
            icon: 2,
            time: 2000
        });
        return ;

    }else {
            $.post("/friend/findFriend/" + $("#fid").val(),
                function (data) {
                    if (data.result == "ok") {
                        $("#updateForm").autofill(data);
                        $('#demo1').attr('src', data.fpic);
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1000});
                    }

                },
                "json"
            );
    }
}

//查询按钮事件
$('#search_btn').click(function () {
    $('#mytab').bootstrapTable('refresh', {url: '/friend/pager'});
})
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/friend/pager'});
}

$('#updateForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        furl: {
            message: '请假理由验证失败',
            validators: {
                notEmpty: {
                    message: '合作伙伴链接不能为空'
                },

            }
        },
        fpic1: {
            message: '请假理由验证失败',
            validators: {
                notEmpty: {
                    message: '合作伙伴图片不能为空'
                },

            }
        },

    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/friend/update",
        $("#updateForm").serialize(),
        function (data) {
            if (data.result == "ok") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 2, time: 1000});

            }
            refush();
            $("#myModal").modal('hide');
            $("#updateForm").data('bootstrapValidator').resetForm();
            $("#furl").val("");
            $("#fPic1").val("");
            $("#demoText1").val("");
            $('#demo11').attr('src', null);
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
        furl: {
            message: '请假理由验证失败',
            validators: {
                notEmpty: {
                    message: '合作伙伴链接不能为空'
                },

            }
        },
        fpic: {
            message: '请假理由验证失败',
            validators: {
                notEmpty: {
                    message: '合作伙伴图片不能为空'
                },

            }
        },

    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/friend/save",
        $("#formadd").serialize(),
        function (data) {
            if (data.result == "ok") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 2, time: 1000});

            }

            $("#webAdd").modal('hide');
            $("#formadd").data('bootstrapValidator').resetForm();
            $("#furl").val("");
            $("#fpic").val("");
            $("#demoText").val("");
            $('#demo1').attr('src', null);
            refush();
        }, "json"
    );
});



