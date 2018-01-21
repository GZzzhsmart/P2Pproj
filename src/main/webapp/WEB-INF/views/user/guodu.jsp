<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>充值中心</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="<%=path%>/static/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <jsp:include page="../common/bootstraptablecss.jsp"/>
</head>
<body>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <label id="typeValue" style="display:none;"> </label>
        <script>
            $(function () {
                $('.quick-tit').click(function () {

                    $(this).addClass('pay-cur');
                    $(this).siblings().removeClass('pay-cur');
                    $('.quick-main').show();
                    $('.online-main').hide();

                    $(".pay-tipcon").hide();
                    $(".pay-tipcon2").show();

                })

                $('.online-tit').click(function () {

                    $(this).addClass('pay-cur');
                    $(this).siblings().removeClass('pay-cur');
                    $('.quick-main').hide();
                    $('.online-main').show();

                    $(".pay-tipcon2").hide();
                    $(".pay-tipcon").show();
                })
            });

            //<![CDATA[
            function showSpan(op) {
                $("body").append("<div id='mask'></div>");
                $("#mask").addClass("mask").css("display", "block");

                $("#" + op).css("display", "block");
            }

            function displaySpan(op) {
                $("#mask").css("display", "none");
                $("#" + op).css("display", "none");
            }

            //]]>
        </script>
        <script>
            //<![CDATA[
            function checkRecharge() {
                var moneyRegex = "^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
                var money = $("#recharge\\:actualMoney").val();
                var nullFlag = (money == "") || money <= 0;
                var numberFlag = isNaN(money);
                //如果输入为空
                if (nullFlag) {
                    var $span = "<em></em>请输入金额";
                    $("#actualMoneyErrorDiv").html($span);
                    return false;
                }
                else {
                    $("#actualMoneyErrorDiv").html("");
                }
                //如果输入的不是数字
                if (numberFlag) {
                    var $span = "<em></em>请输入数字</span>";
                    $("#actualMoneyErrorDiv").html($span);
                    return false;
                }
                else {
                    $("#actualMoneyErrorDiv").html("");
                }
                //输入金额是否合法
                var moneyPattern = new RegExp(moneyRegex);
                var legalFlag = moneyPattern.test(money);
                if (!legalFlag) {
                    var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位</span>";
                    $("#actualMoneyErrorDiv").html($span);
                    return false;
                }
                else {
                    $("#actualMoneyErrorDiv").html("");
                }
                return true;
            }

            function validateAgree() {
                var $checkname = $("#bank-check").children("b").hasClass("selected");
                if (!($checkname)) {
                    return false;
                }
                else {
                    return true;
                }
            }

            function getShowPayVal() {
                var rechargeFlag = checkRecharge();
                var agreeFlag = validateAgree();
                flag = rechargeFlag && agreeFlag;
                $("#recharge\\:rechargeWay").val($("#showpay").html());
                var bankProtocol = $("#bankProtocol").attr('class');
                if (!bankProtocol) {
                    $("#bankProtocol_message").show();
                    return false;
                }
                return flag;
            }


            function amount(th) {
                var regStrs = [
                    ['^0(\\d+)$', '$1'], //禁止录入整数部分两位以上，但首位为0
                    ['[^\\d\\.]+$', ''], //禁止录入任何非数字和点
                    ['\\.(\\d?)\\.+', '.$1'], //禁止录入两个以上的点
                    ['^(\\d+\\.\\d{2}).+', '$1'] //禁止录入小数点后两位以上
                ];
                for (i = 0; i < regStrs.length; i++) {
                    var reg = new RegExp(regStrs[i][0]);
                    th.value = th.value.replace(reg, regStrs[i][1]);
                }
                if (th.value > 9999999.99) {
                    th.value = th.value.substr(0, th.value.length - 1);
                }
            }

            function checkBank() {
                $("#form\\:defaultBankName").text("");
                var cardNo = $("#form\\:bankCardNo").val();
                var reg = /^\d{16,19}$/g; // 以19位数字开头，以19位数字结尾
                if (!reg.test(cardNo)) {
                    $(".info2-bank").css({"display": "none"});
                    return false;
                } else {
                    $(".info2-bank").css({"display": "block"});
                }
                return true;
            }

            function validateAgree2() {
                var $checkname = $("#bank-check2").children("b").hasClass("selected");
                if (!($checkname)) {
                    showSpan('alert-tyht');
                    return false;
                }
                else {
                    return true;
                }
            }

            function checkRecharge1() {
                var moneyRegex = "^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
                var money = $("#form\\:actualMoney1").val();
                var nullFlag = (money == "") || money <= 0;
                var numberFlag = isNaN(money);
                //如果输入为空
                if (nullFlag) {
                    var $span = "<em></em>请输入充值金额";
                    $(".quick-error").html($span);
                    return false;
                }
                else {
                    $(".quick-error").html("");
                }
                //如果输入的不是数字
                if (numberFlag) {
                    var $span = "<em></em>请输入数字";
                    $(".quick-error").html($span);
                    return false;
                }
                else {
                    $(".quick-error").html("");
                }
                //输入金额是否合法
                var moneyPattern = new RegExp(moneyRegex);
                var legalFlag = moneyPattern.test(money);
                if (!legalFlag) {
                    var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位";
                    $(".quick-error").html($span);
                    return false;
                }
                else {
                    $(".quick-error").html("");
                }

                if (parseInt(money) > 50000) {
                    var $span = "<em></em>充值金额超过50000元";
                    $(".quick-error").html($span);
                    return false;
                } else {
                    $(".quick-error").html("");
                }
                return true;
            }

            function getShowPayVal1() {
                var rechargeFlag = checkRecharge1();
                var bankCardFlag = checkBankCardNo();
                var agreeFlag = validateAgree2();
                var payflag = rechargeFlag && bankCardFlag && agreeFlag;
                var defaultBankName = $("#form\\:defaultBankName").text();
                if (defaultBankName.replace(/(^\s*)|(\s*$)/g, "") == "此银行暂不支持") {
                    var $span = "<em></em>此银行暂不支持";
                    $(".quick-error3").html($span);
                    return false;
                }
                /*$("#recharge\\:rechargeWay").val($("#showpay").html());
                 var bankProtocol = $("#bankProtocol").attr('class');
                 if(!bankProtocol)
                 {
                 $("#bankProtocol_message").show();
                 return false;
                 }*/
                return payflag;
            }

            function chongzhi() {
                $.post(
                    "/bankcard/save",
                    $("#form").serialize(),
                    function (data) {
                        if (data.result == "ok") {
                            layer.msg(data.message, {icon: 1, time: 1000});
                            window.location.href = "<%=path%>/page/gu";
                        } else {
                            layer.msg(data.message, {icon: 2, time: 1000});
                            refush();
                        }
                    }, "json"
                );
            }


            function refush() {
                $('#form\\:actualMoney1').val("");
            }

            function options() {
                var bankCardNo = $('#bankCardNo').val();
                var bankpwd = $('#bankpwd').val();
                if (bankCardNo == "") {
                    layer.alert('银行卡号不能为空！请输入银行卡号？', {icon: 3});
                } else if (isNaN(bankCardNo)) {
                    layer.alert('请输入正确的银行卡号？', {icon: 3});
                } else if (bankpwd == "") {
                    layer.alert('支付密码不能为空！请输入支付密码？', {icon: 3});
                } else {
                    layer.confirm('你确定要绑定这张银行卡？', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        layer.msg('正在绑定中。。', {icon: 1});
                        chongzhi();
                    }, function () {
                        layer.msg('取消绑定中。。。', {
                            time: 20000, //20s后自动关闭
                            btn: ['明白了', '知道了']
                        });
                    });
                }
            }

            function jiebang() {
                layer.confirm('你确定要解绑这张银行卡？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    layer.msg('正在解绑中。。', {icon: 1});
                    $.post(
                        "/bankcard/remove",
                        function (data) {
                            if (data.result == "ok") {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                window.location.href = "<%=path%>/page/gu";
                            } else {
                                layer.msg(data.message, {icon: 2, time: 1000});
                                refush();
                            }
                        }, "json"
                    );

                }, function () {
                    layer.msg('取消解绑中。。。', {
                        time: 20000, //20s后自动关闭
                        btn: ['明白了', '知道了']
                    });
                });
            }

            function checkRecharge2() {
                var moneyRegex = "^(([1-9]+[0-9]*)|((([1-9]+[0-9]*)|0)\\.[0-9]{1,2}))$";
                var money = $("#form2\\:actualMoney2").val();
                var nullFlag = (money == "") || money <= 0;
                var numberFlag = isNaN(money);
                //如果输入为空
                if (nullFlag) {
                    var $span = "<em></em>请输入充值金额";
                    $("#quick-error2").html($span);
                    return false;
                }
                else {
                    $("#quick-error2").html("");
                }
                //如果输入的不是数字
                if (numberFlag) {
                    var $span = "<em></em>请输入数字";
                    $("#quick-error2").html($span);
                    return false;
                }
                else {
                    $("#quick-error2").html("");
                }
                //输入金额是否合法
                var moneyPattern = new RegExp(moneyRegex);
                var legalFlag = moneyPattern.test(money);
                if (!legalFlag) {
                    var $span = "<em></em>金额必须大于0且为整数或小数，小数点后不超过2位";
                    $("#quick-error2").html($span);
                    return false;
                }
                else {
                    $("#quick-error2").html("");
                }

                if (parseInt(money) > 50000) {
                    var $span = "<em></em>充值金额超过50000元";
                    $("#quick-error2").html($span);
                    return false;
                } else {
                    $("#quick-error2").html("");
                }
                return true;
            }

            function getShowPayVal2() {
                var rechargeFlag = checkRecharge2();
                var agreeFlag = validateAgree2();
                var payflag = rechargeFlag && agreeFlag;
                /*$("#recharge\\:rechargeWay").val($("#showpay").html());
                 var bankProtocol = $("#bankProtocol").attr('class');
                 if(!bankProtocol)
                 {
                 $("#bankProtocol_message").show();
                 return false;
                 }*/
                return payflag;
            }


            $(document).ready(function () {
                if ("false" == 'true') {
                    showSpan("alert-ClickDialog");
                }
                if ("false" == 'true') {
                    showSpan("alert-unbindMsgDialog");
                }
            });
            //]]>
        </script>
        <div class="personal-main">
            <div class="personal-pay">
                <h3><i>开通银行业务</i></h3>
                <div class="quick-pay-wrap">
                    <form id="form" name="form" method="post" action="">
                        <div class="quick-pay-wrap">
                            <div class="fl quick-info">
                                <div class="info-2"><span class="info-tit">银行卡号</span> <span class="info2-input">
                  <input id="bankCardNo" type="text" name="cardno" class="tx-txt">
                  <em class="info2-bank" style="display: none;">
                  <label id="defaultBankName" style="font-size:16px;"> </label>
                  </em> </span> <span class="quick-error3" id="ankCardError"></span></div>

                                <div class="info-2"><span class="info-tit">支付密码</span> <span class="info2-input">
                  <input id="bankpwd" type="password" name="pwd" class="tx-txt">
                  <em class="info2-bank" style="display: none;">
                  <label id="form:defaultBankName" style="font-size:16px;"> </label>
                  </em> </span> <span class="quick-error3" id="bankCardError"></span></div>
                                <div class="pay-bank" id="pay-bank">
                                    <h6>请选择绑定银行</h6>
                                    <ul id="paysSpan" style="height:150px;">
                                        <label for="checkall1" width="165" height="75"><input type="radio" name="type" value="1"
                                                                      id="checkall1"><img
                                                src="<%=path%>/static/images/logo_abc.png" width="138" height="56">
                                        </label>
                                        <label for="checkall2" width="165" height="75"><input type="radio" name="type" value="2" id="checkall2" checked>

                                            <img src="<%=path%>/static/images/1.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall3" width="165" height="75"><input type="radio" name="type" value="3" id="checkall3"  align="center"><img
                                                src="<%=path%>/static/images/2.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall4" width="165" height="75"  align="center"><input type="radio" name="type" value="4" id="checkall4"><img
                                                src="<%=path%>/static/images/3.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall5" width="165" height="75"><input type="radio" name="type" value="5" id="checkall5"><img
                                                src="<%=path%>/static/images/4.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall6" width="165" height="75"><input type="radio" name="type" value="6" id="checkall6"><img
                                                src="<%=path%>/static/images/5.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall7" width="165" height="75"  align="center"><input type="radio" name="type" value="7" id="checkall7"><img
                                                src="<%=path%>/static/images/6.jpg" width="138" height="56">
                                        </label>
                                        <label for="checkall8" width="165" height="75"  align="center"><input type="radio" name="type" value="8" id="checkall8"><img
                                                src="<%=path%>/static/images/7.jpg" width="138" height="56">
                                        </label>
                                    </ul>
                                </div>
                                <div class="pay-bank">
                                    <div class="accordion" id="accordion2">
                                        <div class="accordion-group">
                                            <div class="accordion-heading">
                                                <a class="accordion-toggle" data-toggle="collapse"
                                                   data-parent="#accordion2" href="#collapseOne">
                                                    绑定的银行卡
                                                </a>
                                            </div>
                                            <div id="collapseOne" class="accordion-body collapse in">
                                                <div class="accordion-inner">
                                                    <c:if test="${cardno!=null}">
                                                        <ul>
                                                            <label><img src="<%=path%>/static/images/${deposit}"></br>
                                                                <p align="center">${cardno}</p>
                                                            </label>
                                                            <label><a href="#" onclick="jiebang()">解绑</a></label>
                                                        </ul>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="bank-check" id="bank-check2"><b class="selected"
                                                                            id="bankProtocol1"></b><span
                                        class="bank-agree">我同意并接受<a href="#"
                                                                    target="_blank">《亿人宝投资咨询与管理服务电子协议》</a></span> <span
                                        class="error" id="" style="display:none;margin-top:-3px;">请同意协议内容！</span></div>
                                <input type="button" name="" value="绑定银行卡" class="btn-paycz" onclick="options()">
                            </div>
                        </div>
                    </form>
                    <div class="pay-tipcon" style="display:none;"><b>充值提示：</b><br>
                        1．亿人宝充值过程免费，不向用户收取任何手续费。<br>
                        2．为了您的账户安全，请在充值前进行身份认证、手机绑定以及交易密码设置。<br>
                        3．您的账户资金将通过丰付支付第三方平台进行充值。<br>
                        4．请注意您的银行卡充值限制，以免造成不便。<br>
                        5．如果充值金额没有及时到账，请联系客服—400-999-8850
                    </div>
                    <div class="pay-tipcon2"><b>温馨提示：</b><br>
                        1. 投资人充值过程全程免费，不收取任何手续费。<br>
                        2. 为防止套现，所充资金必须经投标回款后才能提现。<br>
                        3. 使用快捷支付进行充值，可能会受到不同银行的限制，如需大额充值请使用网银充值进行操作。<br>
                        4. 充值/提现必须为银行借记卡，不支持存折、信用卡充值。<br>
                        5. 严禁利用充值功能进行信用卡套现、转账、洗钱等行为，一经发现，将封停账号30天。<br>
                        6. 充值期间，请勿关闭浏览器，待充值成功并返回首页后，所充资金才能入账，如有疑问，请联系客服。<br>
                        7. 充值需开通银行卡网上支付功能，如有疑问请咨询开户行客服。<br>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $("#recharge\\:actualMoney").val("单笔大于0元");
                var value = "单笔大于0元";
                $("#recharge\\:actualMoney").focus(
                    function () {
                        $(this).css({
                            "font-size": "24px",
                            "font-weight": "bold",
                            "font-family": "Arial",
                            "border": "1px solid #0caffe"
                        });
                        if ($("#recharge\\:actualMoney").val() == value) {
                            $("#recharge\\:actualMoney").val("")
                            $(this).css({"font-size": "24px", "font-weight": "bold", "font-family": "Arial"});
                        }
                    }).blur(
                    function () {
                        $(this).css("border", "1px solid #D0D0D0");
                        if ($("#recharge\\:actualMoney").val() == "") {
                            $("#recharge\\:actualMoney").val("单笔大于0元").css("color", "#D0D0D0");
                            $(this).css({"color": "#D0D0D0", "font-size": "14px", "font-weight": "normal"});
                        }
                    })

                $("#form\\:actualMoney1").val("单笔大于0元");
                $("#form\\:actualMoney1").focus(
                    function () {
                        $(this).css({
                            "font-size": "24px",
                            "font-weight": "bold",
                            "font-family": "Arial",
                            "border": "1px solid #0caffe",
                            "height": "38px"
                        });
                        if ($("#form\\:actualMoney1").val() == value) {
                            $("#form\\:actualMoney1").val("");
                            $(this).css({
                                "font-size": "24px",
                                "font-weight": "bold",
                                "font-family": "Arial",
                                "height": "38px"
                            });
                        }
                    }).blur(
                    function () {
                        $(this).css("border", "1px solid #D0D0D0");
                        if ($("#form\\:actualMoney1").val() == "") {
                            $("#form\\:actualMoney1").val("单笔大于0元").css("color", "#D0D0D0");
                            $(this).css({
                                "color": "#D0D0D0",
                                "font-size": "14px",
                                "font-weight": "normal",
                                "height": "38px"
                            });
                        }
                    })

                $("#form2\\:actualMoney2").val("单笔大于0元");
                $("#form2\\:actualMoney2").focus(
                    function () {
                        $(this).css({
                            "font-size": "24px",
                            "font-weight": "bold",
                            "font-family": "Arial",
                            "border": "1px solid #0caffe",
                            "height": "38px"
                        });
                        if ($("#form2\\:actualMoney2").val() == value) {
                            $("#form2\\:actualMoney2").val("")
                            $(this).css({
                                "font-size": "24px",
                                "font-weight": "bold",
                                "font-family": "Arial",
                                "height": "38px"
                            });
                        }
                    }).blur(
                    function () {
                        $(this).css("border", "1px solid #D0D0D0");
                        if ($("#form2\\:actualMoney2").val() == "") {
                            $("#form2\\:actualMoney2").val("单笔大于0元").css("color", "#D0D0D0");
                            $(this).css({
                                "color": "#D0D0D0",
                                "font-size": "14px",
                                "font-weight": "normal",
                                "height": "38px"
                            });
                        }
                    })

                function keyUpcheck() {
                    $(this).css({"font-size": "24px", "font-weight": "bold", "font-family": "Arial"});
                }

                $("#form\\:bankCardNo").val("请输入银行卡号");
                var cardValue = "请输入银行卡号";
                $("#form\\:bankCardNo").focus(
                    function () {
                        $(this).css({
                            "font-size": "14px",
                            "font-weight": "bold",
                            "font-family": "Arial",
                            "border": "1px solid #0caffe",
                            "color": "rgb(75, 73, 72)"
                        });
                        if ($("#form\\:bankCardNo").val() == cardValue) {
                            $("#form\\:bankCardNo").val("")
                            $(this).css({"font-size": "14px", "font-weight": "bold", "font-family": "Arial"});
                        }
                    }).blur(
                    function () {
                        $(this).css("border", "1px solid #D0D0D0");
                        if ($("#form\\:bankCardNo").val() == "") {
                            $("#form\\:bankCardNo").val("请输入银行卡号").css("color", "#D0D0D0");
                            $(this).css({"color": "#D0D0D0", "font-size": "14px", "font-weight": "normal"});
                        }
                    })
            </script>
        </div>
    </div>
</body>
</html>

<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
<jsp:include page="../common/bootstraptablejs.jsp"/>
</body>
</html>

