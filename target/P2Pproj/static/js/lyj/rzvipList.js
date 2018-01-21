//生成用户数据
var modal;
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/rzvip/pager",//要请求数据的文件路径
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
            title: '用户名',
            field: 'uname',
            align: 'center',
            sortable: true
        },
        {
            title: '是否结婚',
            field: 'ism',
            align: 'center',
            formatter: function (value, row, index) {
                if (value == 0) {
                    //表示状态
                    return "已婚";
                } else if(value==1){
                    //表示状态
                    return "未婚";
                }else if(value==2){
                    //表示状态
                    return "单身";
                }
            }
        },
        {
            title: '毕业学校',
            field: 'bschool',
            align: 'center',
            sortable: true
        },
        {
            title: '地址',
            field: 'addr',
            align: 'center',
            sortable: true
        },

        {
            title: '工作',
            field: 'work',
            align: 'center',
            sortable: true
        },
        {
            title: '学历',
            field: 'xl',
            align: 'center',
            sortable: true
        },
        {
            title: '年龄',
            field: 'age',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '状态',
            field: 'huid',
            align: 'center',
            formatter: function (value, row, index) {
                if (value == null) {
                    //表示激活状态
                    return '<span style="color:red" >未审核</span>';
                } else {
                    //表示冻结状态
                    return '<span style="color:green">已审核</span>';
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
        $("#from1").fill(data[0]);
        $("#exampleModalLabel").text("审核");
        $('#exampleModal').modal();
        return;
    }else{
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            return row.sid;
        });

        if (row == "") {
            layer.msg('审核失败，请勾选数据!', {
                icon: 2,
                time: 2000
            });
            return;

        }
        return;
    }
});





