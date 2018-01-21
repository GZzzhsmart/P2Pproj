//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/userMoney/pager_criteria",//要请求数据的文件路径
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
            title: '用户名称',
            field: 'rname',
            align: 'center',
            sortable: true
        },

        {
            title: '总资产',
            field: 'zmoney',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '可用余额',
            field: 'kymoney',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '收益总额',
            field: 'symoney',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '投资总额',
            field: 'tzmoney',
            align: 'center',
            sortable: true
        },
        {
            title: '冻结金额',
            field: 'djmoney',
            align: 'center',
            sortable: true
        },
        {
            title: '待收金额',
            field: 'dsmoney',
            align: 'center',
            sortable: true
        },
        {
            title: '奖励金额',
            field: 'jlmoney',
            align: 'center',
            sortable: true
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
function del(leaveid, status) {
    if (status == 0) {
        layer.msg("删除失败，已经激活的不允许删除!", {icon: 2, time: 1000});
        return;
    }
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '/leave/deleteManyLeave/' + leaveid,
            dataType: 'json',
            success: function (data) {
                if (data.message == '删除成功!') {
                    layer.msg(data.message, {icon: 1, time: 1000});
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
function edit(name) {
    $.post("/leave/findLeave/" + name,
        function (data) {
            $("#updateForm").autofill(data);

        },
        "json"
    );
}
function shenhe(name) {
    $("#leaveid").val(name);
}

function updatestatus(id, status) {
    $.post("/leave/updateStatus/" + id + "/" + status,
        function (data) {
            if (status == 0) {
                if (data.message == "ok") {
                    layer.msg("已激活", {icon: 1, time: 1000});
                } else {
                    layer.msg("修改状态失败!", {icon: 2, time: 1000});
                }
            } else {
                if (data.message == "ok") {
                    layer.msg("已冻结", {icon: 2, time: 1000});
                } else {
                    layer.msg("修改状态失败!", {icon: 2, time: 1000});
                }
            }
            refush();
        },
        "json"
    );
}
//查询按钮事件
$('#search_btn').click(function () {
    var rname=$('#rname').val();
    var zmoney=$('#zmoney').val();
    var tzmoney=$('#tzmoney').val();
 $('#mytab').bootstrapTable('refresh', {url: '/userMoney/pager_criteria',query:{tzmoney:tzmoney,rname:rname,zmoney:zmoney}});
})
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/userMoney/pager_criteria'});
}
$("#update").click(function () {
    $.post(
        "/leave/leaveUpdateSave",
        $("#updateForm").serialize(),
        function (data) {
            if (data.message == "修改成功!") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 2, time: 1000});
            }
            refush();
            $("#myModal").modal('hide');
        }, "json"
    );
});
$("#shenhe").click(function () {
    $.post(
        "/leave/leaveShenHe",
        $("#shenheform").serialize(),
        function (data) {
            if (data.message == "审核成功!") {
                layer.msg(data.message, {icon: 1, time: 1000});
                refush();
            } else {
                layer.msg(data.message, {icon: 2, time: 1000});
                refush();
            }
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
        reason: {
            message: '请假理由验证失败',
            validators: {
                notEmpty: {
                    message: '请假理由不能为空'
                },

            }
        },
        totalDays: {
            message: '请假天数验证失败',
            validators: {
                notEmpty: {
                    message: '请假天数不能为空'
                }

            }
        },
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
    $.post(
        "/leave/leaveAddSave",
        $("#formadd").serialize(),
        function (data) {
            if (data.message == "新增成功!") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 1, time: 1000});

            }
            refush();
            $("#webAdd").modal('hide');
            $("#reason").val("");
            $("#createTime").val("");
            $("#totalDays").val("");
        }, "json"
    );
});
function deleteMany() {
    var isactivity = "";
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        if (row.isActive == 0) {
            isactivity += row.isActive;
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
    layer.confirm('确认要执行批量删除请假员工数据吗？', function (index) {
        $.post(
            "/leave/deleteManyLeave",
            {
                "manyId": $("#deleteId").val()
            },
            function (data) {
                if (data.message == "删除成功!") {
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
function getAccounts(){
    $("#accountsshenhe").click(function () {
        var isActives = "";
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            if (row.isActive == 1) {
                isActives += row.isActive;
            }
            return row.id;
        });
        if (row == "") {
            layer.msg('审核失败，请勾选数据!', {
                icon: 2,
                time: 2000
            });
            return;
        }
        if (isActives != "") {
            layer.msg('审核失败，已经审核通过的的不允许再次审核!', {
                icon: 2,
                time: 2000
            });
            return;

        }
        $("#manyId").val(row);
        layer.confirm('确认要执行批量审核请假员工吗？', function (index) {
            $.post(
                "/leave/checkerLeave",
                $("#manyshenheform").serialize(),
                function (data) {
                    if (data.message == "批量审核成功!") {
                        layer.msg(data.message, {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.message, {icon: 2, time: 1000});
                    }
                    refush();
                    $("#manyId").val("");
                    $("#remarks").val("");
                }, "json"
            );
        });
    });

}
