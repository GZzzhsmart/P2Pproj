//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url: "/home/pager_criteria",//要请求数据的文件路径
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
    uniqueId: "hid",                     //每一行的唯一标识，一般为主键列
    showExport: true,
    exportDataType: 'all',
    columns: [
        {
            title: '全选',
            field: 'select',
            //复选框
            checkbox: true,
            width: 50,
            align: 'center',
            valign: 'middle'
        },

        {
            title: '轮播图1',
            field: 'pic1',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                return  "<img style='width: 100px;height:50px' src='http://localhost:8080/"+value+"'>";
            }
        }
        ,
        {
            title: '轮播图2',
            field: 'pic2',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                return  "<img style='width: 100px;height:50px' src='http://localhost:8080/"+value+"'>";
            }
        }
        ,
        {
            title: '轮播图3',
            field: 'pic3',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                return  "<img style='width: 100px;height:50px' src='http://localhost:8080/"+value+"'>";
            }
        }
        ,
        {
            title: '二维码',
            field: 'ewm',
            align: 'center',
            sortable: true,
            formatter: function (value) {
                return  "<img style='width: 100px;height:50px' src='http://localhost:8080/"+value+"'>";
            }
        }
        ,
        {
            title: '手机号码',
            field: 'phone',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '链接1',
            field: 'l1',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '链接2',
            field: 'l2',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '链接3',
            field: 'l3',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '链接4',
            field: 'l4',
            align: 'center',
            sortable: true
        }
        ,
        {
            title: '创建时间',
            field: 'date',
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
            title: '状态',
            field: 'state',
            align: 'center',
            formatter: function (value, row, index) {
                if (value == 1) {
                    //表示激活状态
                    return '<span style="color:red" >冻结</span>';
                } else if(value == 0) {
                    //表示冻结状态
                    return '<span style="color:green">激活</span>';
                }
            }
        }
        ,
        {
            title: '操作',
            align: 'center',
            field: '',
            formatter: function (value, row, index) {
                var e = '<a title="编辑" href="javascript:void(0);" id="leave"  data-toggle="modal" data-id="\'' + row.hid + '\'" data-target="#homeUpdate" onclick="return edit(\'' + row.hid + '\')"><i class="glyphicon glyphicon-pencil" alt="修改" style="color:green"></i></a> ';
                var d = '<a title="删除" href="javascript:void(0);" onclick="del(' + row.hid + ',' + row.state + ')"><i class="glyphicon glyphicon-trash" alt="删除" style="color:red"></i></a> ';
                var f = '';
                if (row.state == 0) {
                    f = '<a title="冻结" href="javascript:void(0);" onclick="updatestatus(' + row.hid + ',' + 1 + ')"><i class="glyphicon glyphicon-ok-sign" style="color:green"></i></a> ';
                } else if (row.state == 1) {
                    f = '<a title="激活" href="javascript:void(0);" onclick="updatestatus(' + row.hid + ',' + 0 + ')"><i class="glyphicon glyphicon-remove-sign"  style="color:red"></i></a> ';
                }


                return e + d + f;
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
    var l1 = $('#l1').val();
    var l2 = $('#l2').val();
    var l3 = $('#l3').val();
    var l4 = $('#l4').val();
    var phone = $("#phone").val();
    var date = $('#date').val();
    $('#mytab').bootstrapTable('refresh', {url: '/home/pager_criteria',
        query:{l1:l1,l2:l2,l3:l3,l4:l4,phone:phone,date:date}});
  })
function refush() {
    $('#mytab').bootstrapTable('refresh', {url: '/home/pager_criteria'});
}

//单个删除
function del(hid, state) {
    if (state == 0) {
        layer.msg("删除失败，已经激活的不允许删除!", {icon: 2, time: 3000});
        return;
    }
    layer.confirm('确认要删除吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '/home/delete/'+ hid,
            dataType: 'json',
            success: function (data) {
                if (data.result == 'ok') {
                    layer.msg(data.message, {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
                refush();
            },
            error: function (data) {
                console.log(data.msg);
            },
        });
    });
}
//编辑
function edit(hid) {
         $.post("/home/findHome/"+ hid,
            function (data) {
                $("#updateForm").autofill(data);
                $("#demo1").attr("src","/"+data.pic1);
                $("#demo2").attr("src","/"+data.pic2);
                $("#demo3").attr("src","/"+data.pic3);
                $("#demo4").attr("src","/"+data.ewm);
                },
            "json"
        );
}
function update() {
    var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
        return row.hid;
    });
    if (row == "") {
        layer.msg('修改失败，请勾选数据!', {
            icon: 2,
            time: 3000
        });
        return ;

    }else {
        $.post("/home/findHome/" + $("#hid").val(),
            function (data) {
                if (data == "ok") {
                    $("#updateForm").autofill(data);
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }

            },
            "json"
        );
    }
}

function updatestatus(hid, state) {
    $.post("/home/updateStatus/" + hid + "/" + state,
        function (data) {
            if (state == 1) {
                if (data.result == "ok") {
                    layer.msg("已冻结", {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
            } else {
                if (data.result == "ok") {
                    layer.msg("已激活", {icon: 1, time: 3000});
                } else {
                    layer.msg(data.message, {icon: 2, time: 3000});
                }
            }
            refush();
        },
        "json"
    );
}
//新增
$('#homeAdd').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        phone: {
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/,
                    message: '请输入正确的手机号码格式'
                }
            }
        },
        pic1: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '请上传图片'
                }
            }
        },
        pic2: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '请上传图片'
                }
            }
        },
        pic3: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '请上传图片'
                }
            }
        },
        ewm: {
            message: '图片验证失败',
            validators: {
                notEmpty: {
                    message: '请上传图片'
                }
            }
        },
        l1: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接1'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l2: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接2'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l3: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接3'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l4: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接4'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        date: {
             message: '报道时间验证失败',
             validators: {
                 notEmpty: {
                     message: '请选择报道时间'
                 },
                 date:{
                     format : 'YYYY/MM/DD',
                     message : '日期格式不正确'
                 }

             }
        }
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');
     $.post(
        "/home/save",
        $('#homeAdd').serialize(),
        function (data) {
            if (data.result == "ok") {
                 layer.msg(data.message, {icon: 1, time: 3000});
            } else {
                layer.msg(data.message, {icon: 2, time: 3000});
            }
            $("#homeAdd").data('bootstrapValidator').resetForm();
            $("#l1").val("");
            $("#l2").val("");
            $("#l3").val("");
            $("#l4").val("");
            $("#phone").val("");
            $("#date").val("");
            $("#demo1").attr("src",'');
            $("#demo2").attr("src",'');
            $("#demo3").attr("src",'');
            $("#demo4").attr("src",'');
            $("#image1").html('');
            $("#image2").html('');
            $("#image3").html('');
            $("#image4").html('');
            refush();
        },
        "json"
    );
});
//修改
$('#updateForm').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        phone: {
            validators: {
                notEmpty: {
                    message: '手机号码不能为空'
                },
                stringLength: {
                    min: 11,
                    max: 11,
                    message: '请输入11位手机号码'
                },
                regexp: {
                    regexp: /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/,
                    message: '请输入正确的手机号码格式'
                }
            }
        },
        l1: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接1'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l2: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接2'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l3: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接3'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        l4: {
            message: '链接验证失败',
            validators: {
                notEmpty: {
                    message: '请输入链接4'
                },
                stringLength: {
                    min: 1,
                    max: 50,
                    message: '链接长度必须在1到50之间'
                },
                regexp: {
                    regexp: /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/,
                    message: '请输入有效的网址'
                }
            }
        },
        date: {
            message: '报道时间验证失败',
            validators: {
                notEmpty: {
                    message: '请选择报道时间'
                },
                date:{
                    format : 'YYYY/MM/DD',
                    message : '日期格式不正确'
                }

            }
        }
    }
}).on('success.form.bv', function(e) {//点击提交之后
    e.preventDefault();
    var $form = $(e.target);
    var bv = $form.data('bootstrapValidator');

    $.post(
        "/home/update",
        $('#updateForm').serialize(),
        function (data) {
            if (data.result == "ok") {
                layer.msg(data.message, {icon: 1, time: 3000});
            } else {
                layer.msg(data.message, {icon: 2, time: 3000});
            }
            $("#homeUpdate").modal('hide');
            $("#l1").val("");
            $("#l2").val("");
            $("#l3").val("");
            $("#l4").val("");
            $("#phone").val("");
            $("#date").val("");
            refush();
        },
        "json"
    );
});

