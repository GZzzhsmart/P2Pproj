//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/borrowapply/pager",//要请求数据的文件路径
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
    uniqueId: "baid",                     //每一行的唯一标识，一般为主键列
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
            title: '审核人',
            field: 'username',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '审核理由',
            field: 'reason',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '申请借款人',
            field: 'rname',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '审核状态',
            field: 'state',
            align: 'center',
            formatter: function (value, row, index) {
                if (value == 0) {
                    //表示激活状态
                    return '<span style="color:green">已审核</span>';
                } else {
                    //表示冻结状态
                    return '<span style="color:red" >未审核</span>';
                }
            }
        }
        ,
        {
            title: '审核时间',
            field: 'time',
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
        // ,
        // {
        //     title: '操作',
        //     align: 'center',
        //     field: '',
        //     formatter: function (value, row, index) {
        //         var g='';
        //         g = '<a title="审核" id="checker" id="cashAccounts"  data-toggle="modal" data-id="\'' + row.shid + '\'" data-target="#shenheModal" onclick="return shenhe('+row.shid+','+row.isok+')"><i class="glyphicon glyphicon-import" alt="审核" style="color:green"></i></a>';
        //         return g;
        //     }
        // }
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


function shenhe(id,isok) {
    $("#shenhe").click(function () {
        $.post(
            "/shborrow/update/" + id + "/" + isok,
            $("#shenheform").serialize(),
            function (data) {
                if (data.result == "ok") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                    refush();
                } else {
                    layer.msg(data.message, {icon: 2, time: 1000});
                    refush();
                }
            },
            "json"
        );
    });
}


//查询按钮事件
$('#search_btn').click(function () {
    $('#mytab').bootstrapTable('refresh', {url: '/borrowapply/pager'});
})


function refush() {
    $('#mytab').bootstrapTable('refresh');
}

$("#update").click(function () {
    $.post(
        "/shborrow/update",
        $("#updateForm").serialize(),
        function (data) {
            if (data.message === "修改成功") {
                layer.msg(data.message, {icon: 1, time: 1000});
            } else {
                layer.msg(data.message, {icon: 2, time: 1000});
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
        isok: {
            message: '审核状态验证失败',
            validators: {
                notEmpty: {
                    message: '审核状态不能为空'
                },

            }
        },
        excute: {
            message: '审核理由验证失败',
            validators: {
                notEmpty: {
                    message: '审核理由不能为空'
                }

            }
        },
    }
});

