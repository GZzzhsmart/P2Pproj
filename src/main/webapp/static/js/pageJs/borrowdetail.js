//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/borrowdetail/pager_criteria",//要请求数据的文件路径
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
    uniqueId: "bdid",                     //每一行的唯一标识，一般为主键列
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
            title: '借款人',
            field: 'rname',
            align: 'center',
            sortable: true
        },

        {
            title: '企业账号',
            field: 'qpic',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '其他资料',
            field: 'tpic',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '资金用途',
            field: 'mpurpose',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '还款来源',
            field: 'hksource',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '借款人介绍',
            field: 'suggest',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '金额',
            field: 'money',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '年化收益',
            field: 'nprofit',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '收益方式',
            field: 'way',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '产品名称',
            field: 'cpname',
            align: 'center',
            sortable: true
        }

        // ,
        // {
        //     title: '操作',
        //     align: 'center',
        //     field: '',
        //     formatter: function (value, row, index) {
        //         var g='';
        //         g = '<a title="审核" id="checker" id="cashAccounts"  data-toggle="modal" data-id="\'' + row.baid + '\'" data-target="#shenheModal" onclick="return shenhe('+row.baid+','+row.state+')"><i class="glyphicon glyphicon-import" alt="审核" style="color:green"></i></a>';
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
});



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
    $('#mytab').bootstrapTable('refresh', {url: '/borrowdetail/pager_criteria'});
})
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/borrowdetail/pager_criteria'});
}


