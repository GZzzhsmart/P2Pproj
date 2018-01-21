//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/hUserRole/hasRoleHuser",//要请求数据的文件路径
    toolbar: '#toolbar',//指定工具栏
    striped: true, //是否显示行间隔色
    dataField: "res",
    sortable: true, //是否启用排序 sortOrder: "ID asc",
    sortOrder: "ID asc",
    pagination: true,//是否分页
    //queryParamsType: 'limit',//查询参数组织方式
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
    uniqueId: "id", //每一行的唯一标识，一般为主键列
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
            title: '真实姓名',
            field: 'rname',
            align: 'center',
            formatter:function (value, row, index) {
                if(value == null ||value == undefined || value == ''){
                    return "暂未填写姓名";
                }else {
                    return value;
                }
            }
        },
        {
            title: '手机号',
            field: 'phone',
            align: 'center',
            sortable: true
        },
        {
            title: '操作',
            align: 'center',
            field: 'huid',
            formatter: function (value, row, index) {
                var f = '<a href="javascript:void(0);" onclick="modifyRole(\'' + row.rname + '\',\'' + value + '\')">修改角色</a> ';
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
});

//请求服务数据时所传参数
function queryParams(params) {
    var content = "";
    $("#content").each(function () {
        content = $(this).val();
    });
    return {
        //每页多少条数据
        pageSize: this.pageSize,
        //请求第几页
        pageIndex: this.pageNumber,
        content: content
    }
}

//刷新表格
function refush() {
    $('#mytab').bootstrapTable('refresh');
}

//按条件查询     未用到
function doSearchContent() {
    var content = $("#content").val();
    var options = $("#mytab").bootstrapTable('refresh', {
        url: '/role/roleQuery',
        query: {content: content}
    });
}

//修改角色
function modifyRole(rname,value) {
    //把hUserId设置到模态框中(保存修改角色需要HuserId)
    $("#hUserId").attr("value",value);
    $("#hUserName").html(rname);
    //查询未被冻结的角色
    $.post(
        "/hUserRole/hRoleList",
        function (data) {
            var checkbox = '';
            for (var i = 0; i < data.length; i++){
                checkbox += "<div class='col-md-offset-1 col-md-2'>";
                checkbox += "   <input type='checkbox' name='hUserRole' value='" + data[i].rid + "'>";
                checkbox += "   <label>" + data[i].rname + "</label>";
                checkbox += "</div>";
            }
            $("#role").html(checkbox);
            //勾选该用户拥有的角色
            $.post(
                "/hUserRole/hRoleByHuserId",
                {hUserId:value},
                function (data) {
                    for(var i=0;i<data.length;i++){
                        $(function(){
                            $(":checkbox[value='"+data[i].rid+"']").prop("checked",true);
                        });
                    }
                    //打开模态框
                    $('#myModal').modal('toggle');
                }
            );
        },
        "json"
    );


}

//保存修改后的角色
$(".modifyRole").click(function () {
    //获取选中的角色
    var modifyRoleList = '';
    $("input[name='hUserRole']:checkbox").each(function(){
        if($(this).is(':checked') == true){
            modifyRoleList += $(this).val()+",";
        }
    });
    var hHuserId = $("#hUserId").val();
    if(modifyRoleList != ''){
        //修改角色
        $.post(
            "/hUserRole/updateRoles",
            {roleList:modifyRoleList,hHuserId:hHuserId},
            function (data) {
                if(data.result == "ok"){
                    swal(data.message,"该用户角色已被修改！","success");
                }
            },
            "json"
        );
        // 关闭模态框
        $('#myModal').modal('toggle');
    }else {
        swal("您未选择任何角色，请选择角色哦！","角色不能为空","warning");
    }
});
