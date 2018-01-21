//生成用户数据
var modal;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/reward/pager",//要请求数据的文件路径
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
    uniqueId: "rwid",                     //每一行的唯一标识，一般为主键列
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
            title: '用户名',
            field: 'uname',
            align: 'center',
            sortable: true
        },
        {
            title: '投资总额',
            field: 'tmoney',
            align: 'center',
            sortable: true
        },
        {
            title: '奖励金额',
            field: 'money',
            align: 'center',
            sortable: true
        },
        {
            title: '发放状态',
            field: 'state',
            align: 'center',
            formatter: function (value) {
                if (value == 2) {
                    return '<span style="color:green" >已发放</span>';
                } else if(value == 1){
                    return '<span style="color:red" >未发放</span>';
                }
            }
        },

        {
            title: '自动发放时间',
            field: 'date',
            align: 'center',
            sortable: true
        },
        {
            title: '手动发放奖励',
            align: 'center',
            field: '',
            formatter: function (value, row) {
                if (row.state == 2) {
                    f = '<a title="已发放" href="javascript:void(0);" onclick="updatestatus(' + row.uid + ',' + 1 + ','+row.money+')"><i class="glyphicon glyphicon-ok-sign" style="color:green"></i></a> ';
                } else if (row.state == 1) {
                    f = '<a title="未发放" href="javascript:void(0);" onclick="updatestatus(' + row.uid + ',' + 2 + ','+row.money+')"><i class="glyphicon glyphicon-remove-sign"  style="color:red"></i></a> ';
                }
                return f;
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


function updatestatus(uid, state,money) {

    if(state==1){
        swal("已发放，不能再发放奖励！","","error");
        return;
    }


    $.post("/reward/updateState/" + uid + "/" + state+ "/" + money,
        function (data) {
            if (state == 2) {
                if (data.message == "ok") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.message, {icon: 1, time: 1000});
                }
            } else  if (state == 1){
                if (data.message == "ok") {
                    layer.msg(data.message, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.message, {icon: 1, time: 1000});
                }
            }
            refush();
        },
        "json"
    );


    function refush() {
        $('#mytab').bootstrapTable('refresh', {url: '/reward/pager'});
    }

}



