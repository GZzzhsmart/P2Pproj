<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>亿人宝-投资理财计算器</title>
    <link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/layer.css" />
    <script src="<%=path%>/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/layer.js"></script>
</head>
<style>
    .cal-tabs {
        border-bottom: 1px solid #dfdfdf;
        position: absolute;
        right: 0;
        top: -4px;
    }
    .calc-title {
        font-size: 20px;
        line-height: 28px;
    }
    .calc-tab.active {
        border-bottom: 2px solid #fc6700;
        color: #fc6700;
        line-height: 40px;
    }
    .calc-tab {
        cursor: pointer;
        display: inline-block;
        font-size: 16px;
        height: 42px;
        line-height: 42px;
        text-align: center;
    }
    .p-0 {
        padding: 0 !important;
    }
    .mt-15 {
        margin-top: 15px !important;
    }
    .mt-10 {
        margin-top: 10px !important;
    }
    .rel {
        position: relative;
    }
    .form-control {
        box-shadow: none;
    }.calc-addon {
         background: rgba(0, 0, 0, 0) none repeat scroll 0 center;
     }
    .carl-record {
        font-size: 14px;
    }
    .carl-record {
        font-size: 14px;
    }
    .calc-label {
        font-size: 14px;
        line-height: 34px;
        text-align: right;
    }

    .spanfont {
        color: #666666;
        font-family: "微软雅黑";
        font-size: 14px;
    }

    .spanje {
        color: #ff6b00;
        font-size: 24px;
    }
    .reset{
        background: #666 none repeat scroll 0 0;
        border: 0 none;
        border-radius: 3px;
        box-sizing: border-box;
        color: #fff;
        cursor: pointer;
        display: inline-block;
        font-family: "微软雅黑";
        font-size: 14px;
        height: 30px;
        line-height: 30px;
        margin-top: 30px;
        outline: 0 none;
        text-align: center;
        width: 90px;
    }
    .sub{
        background: #53a0e3 none repeat scroll 0 0;
        border: 0 none;
        border-radius: 3px;
        box-sizing: border-box;
        color: #fff;
        cursor: pointer;
        display: inline-block;
        font-family: "微软雅黑";
        font-size: 14px;
        height: 30px;
        line-height: 30px;
        margin-top: 30px;
        outline: 0 none;
        text-align: center;
        width: 90px;
    }
</style>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header bb-no">
            <button onclick="closeTk();" aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
        </div>
        <div class="modal-body">
            <!-- 理财计算器START -->
            <div class="">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title calc-title rel">
                            理财计算器
                            <div class="cal-tabs">
                                <div class="calc-tab active jCalcTab">投资理财</div>
                            </div>
                        </h3>
                    </div>
                    <div class="panel-body p-0" >
                        <!--投资理财，债权转让tab框START-->
                        <div class="calc-bd-tabs jCalcBdTabs">
                            <div class="cal-bd-tab jCalBdTab">

                                <!--投资理财Panel START-->
                                <div class="row mt-15">
                                    <div class="col-md-6">
                                        <div class="col-xs-4 calc-label">投资金额</div>
                                        <div class="col-xs-8">
                                            <div class="input-group">
                                                <!--input type="text" onblur="inputblur(this);" onkeypress="inputkeypress(this);" onkeyup="inputkeyup(this);" id="bidAmount" class="form-control"-->
                                                <input type="text" name="jkje" id="jkje" placeholder="借款金额" class="form-control" style="width: 125px;" />
                                                <div class="input-group-addon calc-addon">元</div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-md-6 col-sm-6 mt-md-10  mt-sm-10  mt-xs-10 col-xs-12">
                                        <div class="col-xs-4 calc-label">年化收益</div>
                                        <div class="col-xs-8">
                                            <div class="input-group">
                                                <!--													<input type="text" onblur="inputblur(this);" onkeypress="inputkeypress(this);" onkeyup="inputkeyup(this);" id="bidRate" class="form-control">
                                                -->												<input type="text" name="nhlv" id="nhlv" placeholder="年化利率" class="form-control" />
                                                <div class="input-group-addon calc-addon">%</div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-sm-6 mt-10">
                                        <div class="col-xs-4 calc-label">借款期限</div>
                                        <div class="col-xs-8">
                                            <div class="input-group">
                                                <input type="text" name="jkqx" id="jkqx" placeholder="期限" class="form-control"  style="width: 81px;">
                                                <div class="input-group-addon calc-addon"> <input type="radio" name="nyy" id="yue" value="1" checked="" />月
                                                    <input type="radio" name="nyy" id="tian" value="2" />天
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-sm-6 mt-10">
                                        <div class="col-xs-4 calc-label">还款方式</div>
                                        <div style="width:147px;" class="col-xs-8">
                                            <!--	<select style="" name="bidWay" id="bidWay">
                                                    <option value="按月等额本息">按月等额本息</option>
                                                    <option value="按月付息到期还本">按月付息到期还本</option>
                                                </select>-->
                                            <select style="margin-top:0px;width:149px;" name="hkfs" id="hkfs" class="form-control">
                                                <option value="1">按月付息，到期还本</option>
                                                <option value="3">等额本息</option>
                                                <option value="2">一次性还本付息</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mt-15">
                                    <div class="col-md-12 tc" style="margin-top:-20px;margin-bottom: 20px;">
                                        <div class="col-xs-6 tc" style="text-align: center;">
                                            <input type="button" value="计算" class="sub " id="btn-profit" />
                                            <!--<button onclick="itCalAll();" style="padding-left:40px;padding-right:40px;" class="btn btn-info btn-lg" type="submit">计算</button>-->
                                        </div>
                                        <div class="col-xs-6 tc" style="text-align: center;">
                                            <input type="button" value="重置数据" class="reset" id="btn-reset">
                                            <span id="expect-profit"></span>
                                        </div>
                                    </div>

                                    <div class="col-md-12" style="margin-top: 10px;;">
                                        <div class="col-md-6">
                                            <span class="spanfont">投资金额： </span><span class="spanje" id="tzjexs"></span><span class="spanfont">元</span>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="spanfont">投资期限：</span><span  class="spanje" id="tzqxxs"></span><span class="spanfont">个月</span>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="spanfont">利息收益： </span><span class="spanje" id="lxsy"></span><span class="spanfont">元</span>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="spanfont">本息合计：</span><span  class="spanje" id="bxhj"></span><span class="spanfont">元</span>
                                        </div>
                                    </div>

                                </div>
                                <!--投资理财Panel END-->

                            </div>
                            <div class="cal-bd-tab hidden jCalBdTab">

                            </div>
                        </div>
                        <!--投资理财，债权转让tab框END-->

                        <div class="calc-tps mt-20 text-center"><strong></strong></div><br />
                        <!--			<div class="jsjg">
                        <div class="tablet">
                            <div style="width: 230px;float: left;text-align: center;"><span class="spanfont">投资金额： </span><span class="spanje" id="tzjexs"> </span><span class="spanfont">元</span></div>
                            <div style="width: 180px;float: left;text-align: center;"><span class="spanfont">投资期限：</span><span  class="spanje" id="tzqxxs"></span><span class="spanfont">个月</span></div>
                            <div style="width: 230px;float: left;text-align: center;"><span class="spanfont">利息收益： </span><span class="spanje" id="lxsy"> </span><span class="spanfont">元</span></div>
                            <div style="width: 230px;float: left;text-align: center;"><span class="spanfont">本息合计：</span><span  class="spanje" id="bxhj"></span><span class="spanfont">元</span></div>
                        </div>
                        <br/>
                    </div>-->
                        <!--<div style="&lt;!--[if !IE 8]&gt;&lt;!--&gt;max-height: 300px;&lt;!--&lt;![endif]--&gt;height:expression(document.body.clientWidth&gt;300?'300px':'auto');overflow:scroll;" class="table-responsive">-->
                        <div class="table-responsive"></div>
                        <div id="bxmx">
                            <table class="table table-striped table-hover carl-record" id="repayplan" >
                                <tbody>
                                <tr style="height: 40px;" align="center">
                                    <th width="12%">期数</th>
                                    <th width="22%">每月还款本息</th>
                                    <th width="22%">应还本金</th>
                                    <th width="22%">应还利息</th>
                                    <th width="22%">剩余回款本息</th>
                                </tr>
                                </tbody>
                                <!--</tbody>
                                        <tbody id="tBodyId" style="display: table-row-group;">


                                        </tbody>-->
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 理财计算器END -->
    </div>
</div>
</div>

<script>
    var loadtype  = $("#hkfs").val();

    //一次性还本付息 设置
    $(".calc-addon").on("click",'input[name="nyy"]',function(){
        //alert($(this).val());
        if($(this).val()==2){
            $('#hkfs').val(2);
        }
    });

    //还款方式
    $("#hkfs").change(function(){
        var val = $(this).val();
        var dw = $('input[name="nyy"]:checked').val();
        /* alert($(this).val()+"1111111111111");
         alert(dw);*/
        if(dw==2 && val!==1){
            layer.msg("单位是天,只能有一次还本付息！", { time: 2000,offset: ['60px']});
            $('#hkfs').val(2);
        }
    });

    //重置
    $("#btn-reset").on("click",function(){
        var resultList = $("#bxmx");
        var $table = $("#repayplan");

        resultList.fadeOut(0,function(){
            $table.find("tr:gt(0)").remove();
            $('input[name="nyy"]').eq(0).click();
            $("#jkje,#jkqx,#nhlv").val("");
            $("#tzjexs,#tzqxxs,#lxsy,#bxhj").html("");
        });

    });


    $("#btn-profit").on("click",function(){

        var jkje =  $('#jkje').val();
        var nhlv = $('#nhlv').val();
        var jkqx = $('#jkqx').val();
        var type = $("#hkfs").val();
        var $table = $("#repayplan");
        var resultLists = $("#bxmx");
        var loadtype = $('input[name="nyy"]:checked').val();
        //alert(jkje);
        if(jkje<100){
            layer.tips('投资金额输入不能小于100！',$('#jkje'), {tips: [3, '#53a0e3'],time: 2000});
            $("#jkje").val('').focus();
            return false;
        }
        if (nhlv<=0) {
            layer.tips('年利率输入不正确！',$('#nhlv'), {tips: [3, '#53a0e3'],time: 2000});
            $("#nhlv").val('').focus();
            return false;
        }
        if (parseFloat(jkqx)<=0) {
            layer.tips('投资期限输入不正确！',$('#jkqx'), {tips: [3, '#53a0e3'],time: 2000});
            $("#jkqx").val('').focus();
            return false;
        }
        if (parseFloat(nhlv) >50) {
            layer.tips('请输入正确的年利率，年利率不能超过50%！',$('#nhlv'), {tips: [3, '#53a0e3'],time: 2000});
            $("#nhlv").val('').focus();
            return false;
        }
        if (parseInt(jkqx)>48 && loadtype==1) {
            layer.tips('期限不能超过48个月！',$('#jkqx'), {tips: [3, '#53a0e3'],time: 2000});
            $("#jkqx").val('').focus();
            return false;
        }
        if(parseFloat(jkqx)!==parseInt(jkqx)){
            layer.tips('期限不能为小数！',$('#jkqx'), {tips: [3, '#53a0e3'],time: 2000});
            $("#jkqx").val('').focus();
            return false;
        }
        if (parseFloat(jkje)>2000000) {
            layer.tips('投标金额不能超过2000000',$('#jkje'), {tips: [3, '#53a0e3'],time: 2000});
            $("#jkje").val('').focus();
            return false;
        }
        if ( loadtype == 2 ){
            if(parseFloat(jkqx)>1095){
                layer.tips('借款期限不能超过1095天',$('#jkqx'), {tips: [3, '#53a0e3'],time: 2000});
                $("#jkqx").val('').focus();
                return false;
            }
            jkqx /=30;
        }

        resultLists.fadeOut(0,function(){
            $table.find('tr:gt(0)').remove();
            $("#tzjexs,#tzqxxs,#lxsy,#bxhj").html("");
        });


        switch(parseInt(type)){
            case 2:
                var sum = jkje * nhlv / 100 * (jkqx / 12);
                var sumfinal = sum.toFixed(2);
                resultLists.fadeOut(0);
                $("#tzjexs").html(jkje);
                if(loadtype ==1){
                    $("#tzqxxs").html(jkqx);
                }else{
                    $("#tzqxxs").html(jkqx.toFixed(1));
                }
                $("#bxhj").html((jkje * 1 + sumfinal * 1).toFixed(2));
                $("#lxsy").html(sumfinal);
                break;
            case 1:
                var sum = jkje * nhlv / 100* (jkqx / 12);
                var sumfinal = sum.toFixed(2);
                var sumfinalEve = (sumfinal / jkqx).toFixed(2);
                var objtitle = $("");

                if ( loadtype == 1 ){
                    $("#tzqxxs").html(parseFloat(jkqx).toFixed(0));
                }else {
                    $("#tzqxxs").html(parseFloat(jkqx).toFixed(1));
                }

                $("#tzjexs").html(parseFloat(jkje).toFixed(2));

                $("#bxhj").text((jkje * 1 + sumfinal * 1).toFixed(2));
                $("#lxsy").text(sumfinal);
                resultLists.fadeIn(0);

                for(var i=1;i<jkqx;i++){
                    var objb = $(
                        "<tr style='height: 40px;'>"
                        + " <td align='center' >"
                        + i
                        + "</td>"
                        + " <td align='center' >"
                        + sumfinalEve
                        + "元</td>"
                        + " <td align='center' >0元</td>"
                        + " <td align='center' >"
                        + sumfinalEve
                        + "元</td>"
                        + " <td align='center' >"
                        + (parseFloat(jkje) * 1 + sumfinal * 1 - sumfinalEve
                        * i).toFixed(2)
                        + "元</td></tr>");
                    $("#repayplan").append(objb);
                }
                var objb =
                    " <tr style='height:40px'>"
                    + " <td align='center'>"
                    + jkqx
                    + "</td>"
                    + " <td align='center'>"
                    + (parseFloat(jkje) * 1 + sumfinalEve * 1).toFixed(2)
                    + "元</td>"
                    + " <td align='center'>"
                    + parseFloat(jkje).toFixed(2)
                    + "元</td>"
                    + " <td align='center'>"
                    + sumfinalEve
                    + "元</td>"
                    + " <td align='center'>"
                    + 0
                    + "元</td></tr>";
                $("#repayplan").append(objb);
                break;
            case 3:
                resultLists.fadeIn(0);
                invest_calc(jkje,nhlv,jkqx);
                break;
        }

    });




    function invest_calc(jkje,nhlv,jkqx){
        var jkje =  parseInt($('#jkje').val());
        var nhlv = parseInt($('#nhlv').val());
        var jkqx = parseInt($('#jkqx').val());
        var Deadline = parseInt(jkqx);
        var hkfs = parseInt($("#hkfs").val());
        var datalist = new Array(jkqx);

        if(jkje){
            if(jkqx){
                if(nhlv){
                    var tablett = $("tablett");

                    datalist = Calculate(jkje, nhlv, jkqx);
                    $("#tzjexs").html(jkje);
                    if(jkqx>1){
                        $("#tzqxxs").html(jkqx);
                    }else{
                        $("#tzqxxs").html(jkqx.toFixed(1));
                    }
                    $("#tzjexs").html(jkje.toFixed(2));

                    for(var i=0;i<Deadline;i++){
                        var newTr = repayplan.insertRow(-1);
                        var newTd0 = newTr.insertCell(-1);
                        var newTd1 = newTr.insertCell(-1);
                        var newTd2 = newTr.insertCell(-1);
                        var newTd3 = newTr.insertCell(-1);
                        var newTd4 = newTr.insertCell(-1);

                        //这里修改与页面对应值
                        newTd0.innerHTML = datalist[i][0] + "";
                        newTd1.innerHTML = datalist[i][1] + "元";
                        newTd2.innerHTML = datalist[i][3] + "元";
                        newTd3.innerHTML = datalist[i][2] + "元";
                        newTd4.innerHTML = datalist[i][4] + "元";
                    }
                }
            }
        }
    }

    function Calculate(jkje,nhlv,jkqx){
        var Deadline = parseInt(jkqx);
        var Amount = parseFloat(jkje);
        var Rate = parseFloat(nhlv) / 1200;
        var datalist = new Array(Deadline);
        var i;
        var a; // 偿还本息
        var b; // 偿还利息
        var c; // 偿还本金
        var TotalRate = (Amount * Deadline * Rate * Math.pow((1 + Rate),Deadline))/ (Math.pow((1 + Rate), Deadline) - 1) - Amount;
        //alert(TotalRate+"Amount!!!!!!!!!");
        var TotalRepay = TotalRate + Amount;//本金+利息
        var d = Amount + TotalRate; // 剩余本金
        //alert(d + "ddddddddddd");
        TotalRate = Math.round(TotalRate * 100) / 100;// 支付总利息
        //alert(TotalRate + "支付总利息");
        TotalRepay = Math.round(TotalRepay * 100) / 100;
        //alert(TotalRepay + "TotalRepay");
        a = TotalRepay / Deadline;
        //alert(a +" TotalRepay / Deadline;")
        a = Math.round(a * 100) / 100;// 支付总还款额



        for (i = 1; i <= Deadline; i++) {
            b = (Amount * Rate * (Math.pow((1 + Rate), Deadline) - Math.pow((1 + Rate), (i - 1))))/ (Math.pow((1 + Rate), Deadline) - 1);
            //alert(b + "bbbbbbbbbb");
            b = Math.round(b * 100) / 100;
            c = a - b;
            c = Math.round(c * 100) / 100;
            d = d - a;
            d = Math.round(d * 100) / 100;
            if (i == Deadline) {
                c = c + d;
                b = b - d;
                c = Math.round(c * 100) / 100;
                b = Math.round(b * 100) / 100;
                d = 0;
            }
            ;
            var tempList = new Array([ 5 ]);
            tempList[0] = i;// 期数
            tempList[1] = a.toFixed(2);// 偿还本息
            tempList[2] = b.toFixed(2);// 偿还利息
            tempList[3] = c.toFixed(2);// 偿还本金
            tempList[4] = d.toFixed(2);// 剩余本金
            datalist[i - 1] = tempList;
        }
        lab_totalmomey = (Math.round((Amount + TotalRate) * 100) / 100).toFixed(2);
        $("#lxsy").html(TotalRate);
        $("#bxhj").html(lab_totalmomey);
        return datalist;
    }

    function debx(){
        var jkje =  parseInt(10000);
        var nhlv = parseInt(0.12);
        var jkqx = parseInt(12);
        var ylv = nhlv / 100 / 12;
        var rest = jkje * ylv * Math.pow(1 + ylv, jkqx) / (Math.pow(1 + ylv, jkqx) - 1)*jkqx;
        return rest;
    }


</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>来源：<a href="http://localhost:8080" target="_blank">亿人宝理财平台</a></p>
</div>
</body>
</html>

