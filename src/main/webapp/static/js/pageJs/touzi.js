//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/tz/pageById",//要请求数据的文件路径
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
    clickToSelect: true,//是否启用点击选中行
    uniqueId: "id",                     //每一行的唯一标识，一般为主键列
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
        }
        ,
        {
            title: '投资人',
            field: 'uname',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '借款人',
            field: 'rname',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '投资金额',
            field: 'money',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '投资产品',
            field: 'cpname',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '投资利率',
            field: 'nprofit',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '投资时间',
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
    var rname=$('#rname').val();
    var reason=$('#reason').val();
    $('#mytab').bootstrapTable('refresh', {url: '/tz/pageById',query:{date:date,rname:rname}});
})
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/tz/pageById'});
}
