//生成用户数据
var modal;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/hk/pager",//要请求数据的文件路径
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
    search: false,
    uniqueId: "rid",                     //每一行的唯一标识，一般为主键列
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
            title: '产品名',
            field: 'bzname',
            align: 'center',
            sortable: true
        },

        {
            title: '应还本息',
            field: 'ybx',
            align: 'center',
            formatter: function (value) {
                if (value == null) {

                    return '0';
                } else {

                    return value;
                }
            }
        },
        {
            title: '应还利息',
            field: 'ylx',
            align: 'center',
            formatter: function (value) {
                if (value == null) {

                    return '0';
                } else {

                    return value;
                }
            }
        },
        {
            title: '应还本金',
            field: 'ybj',
            align: 'center',
            formatter: function (value) {
                if (value == null) {

                    return '0';
                } else {

                    return value;
                }
            }
        },

        {
            title: '已还期数',
            field: 'rnum',
            align: 'center',
            formatter: function (value) {
                if (value == null) {

                    return '0';
                } else {

                    return value;
                }
            }
        },
        {
            title: '应还时间',
            field: 'ytime',
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
            title: '第几期',
            field: 'djq',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '状态',
            field: 'state',
            align: 'center',
            formatter: function (value) {
                if (value == 0) {
                    //表示激活状态
                    return '<span style="color:red" >未还</span>';
                } else {
                    //表示冻结状态
                    return '<span style="color:green">已还</span>';
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

    var uid= $('#uid').val();

    $(".search input").each(function () {
        title = $(this).val();
    });
    return {

        //每页多少条数据
        pageSize: this.pageSize,
        //请求第几页
        pageIndex: this.pageNumber,
        uid:uid,
        searchVal: title
    }
}

var check=$("#check").val();
if(check!=null && check=='state'){

    layer.msg("您已还款，无需再还！", {icon: 2, time: 2000});
}


if(check!=null && check=='pwd'){

    layer.msg("支付密码错误，请重新输入！", {icon: 2, time: 2000});
}

if(check!=null && check=='money'){

    layer.msg("余额不足，请充值！", {icon: 2, time: 2000});
}


if(check!=null && check=='success'){

    layer.msg("恭喜您，还款成功！", {icon: 1, time: 2000});
}

$("#sh").click(function () {
    //取表格的选中行数据
    var data = $("#mytab").bootstrapTable('getSelections');

    if (data.length == 1) {
        $("#from1").fill(data[0]);
        $("#exampleModalLabel").text("审核");
        $('#exampleModal').modal();
        return;
    }else{
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            return row.uid;
        });

        if (row == "") {
            layer.msg('还款失败，请勾选数据!', {
                icon: 2,
                time: 2000
            });
            return;

        }
        return;
    }
});



