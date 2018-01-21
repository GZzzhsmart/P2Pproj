//生成用户数据
var modal;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/sk/pager",//要请求数据的文件路径
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
            title: '应收本息',
            field: 'ybx',
            align: 'center',
            sortable: true
        },
        {
            title: '应收利息',
            field: 'ylx',
            align: 'center',
            sortable: true
        },
        {
            title: '已收利息',
            field: 'rlx',
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
            title: '应收本金',
            field: 'ybj',
            align: 'center',
            sortable: true
        },

        {
            title: '已收本金',
            field: 'rbj',
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
            title: '总期数',
            field: 'tnum',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '状态',
            field: 'state',
            align: 'center',
            formatter: function (value,row) {
                if (value==1) {
                    //表示激活状态
                    return '<span style="color:red">未还款</span>';
                } else if(value== 2){
                    //表示冻结状态
                    return '<span style="color:green">已收款</span>';
                }else if(value==3){
                    //表示冻结状态
                    return '<span style="color:red">确认收款</span>';
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

    var juid= $('#juid').val();

    $(".search input").each(function () {
        title = $(this).val();
    });
    return {

        //每页多少条数据
        pageSize: this.pageSize,
        //请求第几页
        pageIndex: this.pageNumber,
        juid:juid,
        searchVal: title
    }
}


function findDetails() {
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        return row.uid;
    });
    if (row == "") {
        layer.msg('查看详情失败，请勾选数据!', {
            icon: 2,
            time: 2000
        });
        return;
    }else {

        window.location.href = "/rzvip/detailView?row="+row;
    }

}



$("#sh").click(function () {
    //取表格的选中行数据
    var data = $("#mytab").bootstrapTable('getSelections');

    if (data.length == 1) {

        var ybx=data[0].ybx;
        var ylx=data[0].ylx;
        var ybj=data[0].ybj;
        var djq=data[0].djq;
        var juid=data[0].juid;
        var baid=data[0].baid;
        var state=data[0].state;

        $.post(
            "/sk/querenShoukuan/"+ybx+"/"+ylx+"/"+ybj+"/"+djq+"/"+juid+"/"+baid+"/"+state,
            function (data) {
                if (data.result == "ok") {
                    layer.msg(data.message, {icon: 1, time: 2000});
                    window.location.href = "/sk/refurbish/"+juid;

                }else {
                    layer.msg(data.message, {icon: 2, time: 2000});

                }
            }, "json"
        );

    }else{
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            return row.sid;
        });

        if (row == "") {
            layer.msg('确认收款失败，请勾选数据!', {
                icon: 2,
                time: 2000
            });
            return;

        }
        return;
    }
});





