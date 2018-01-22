<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    Long userId=(Long)session.getAttribute(Constants.USER_ID_SESSION);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>亿人宝-我要投资</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/static/css/detail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script type="text/javascript"  src="<%=path%>/static/js/ablumn.js"></script>
    <script type="text/javascript"  src="<%=path%>/static/js/plugins.js"></script>
    <script type="text/javascript"  src="<%=path%>/static/js/detail.js"></script>
    <link href="<%=path%>/static/plugin/bootstrap/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp"%>
<!--信息详细-->
<input type="hidden" id="uid" name="uid" value="${borrow.uid}">
<input type="hidden" id="userId" name="userId" value="<%=userId%>">
<input type="hidden" id="maxMoney" name="maxMoney" value="${borrow.money-borrow.mmoney}">

<div class="item-detail wrap">
    <div class="breadcrumbs"> <a href="<%=path%>/">首页</a>&gt; <a href="#">投资列表</a>&gt; <span class="cur">项目详情</span> </div>
    <div class="item-detail-head clearfix" data-target="sideMenu">
        <div class="hd">
            <h2><a style="color: red">${borrow.bzname}</a>/${borrow.cpname}</h2>
        </div>
        <div class="bd clearfix">
            <div class="data">
                <ul>
                    <li> <span class="f16">募集总金额</span><br>
                        <span class="f30 c-333" id="account">${borrow.money}</span>元 </li>
                    <li class="relative"><span class="f16">年利率</span><br>
                        <span class="f30 c-orange">${borrow.nprofit}%</span> </li>
                    <li><span class="f16">借款期限</span><br>
                        <span class="f30 c-333">${borrow.term}</span>个月 </li>
                    <li><span class="c-888">还款方式：</span>${borrow.way}</li>
                    <li><span class="c-888">最小投标金额：</span> 100.00元 </li>
                    <li><span class="c-888">借款用途：</span>${borrow.mpurpose}</li>
                    <li class="colspan"><span class="c-888 fl">投标进度：</span>
                        <div class="progress-bar fl"> <span style="width:${(borrow.mmoney/borrow.money)*100}%"></span> </div>
                        <span class="c-green">${(borrow.mmoney/borrow.money)*100}%</span>
                    </li>
                    <li><span class="c-888">最大投标金额：</span> <span > ${borrow.money-borrow.mmoney}元</span> </li>
                    <li><span class="c-888">可投标时间：</span> <span id="account_range"> ${borrow.deadline}</span> </li>
                </ul>
            </div>
            <div class="mod-right mod-status">
                <div class="inner">
                    <div class="input">
                        <div class="subject-s-r-c">
                            <c:if test="${users==null}">
                                <p>可用余额：<span >登录后才可查看余额</span></p>
                            </c:if>
                            <c:if test="${users!=null}">
                                <p>可用余额：<span class="f24 c-333">${users.kymoney}</span>元</p>
                            </c:if>
                            <p>已投金额：<span class="f24 c-333">${borrow.mmoney}</span>元</p>
                        </div>
                    </div>
                    <div class="subject-s-r-c">
                        <p>剩余可投：<span class="f24 c-333">${borrow.money-borrow.mmoney}</span>元</p>
                    </div>
                    <div class="input">
                        <form method="post" action="">
                            <input type="text" style="display: none" id="kymoney" value="${borrow.kymoney}">
                            <input type="text" style="display: none" id="nprofit" value="${borrow.nprofit}">
                            <input type="text" style="display: none" id="term" value="${borrow.term}">
                            <input type="text" style="display: none" id="sid" value="${borrow.sid}">
                            <input type="text" style="display: none" id="baid" value="${borrow.baid}">
                            <c:if test="${borrow.mmoney<borrow.money}">
                                <input style="width: 60px;height: 23px;background-color:#66ffff;size: 14px"  type="button" value="投标" onclick="prompt()">
                                <a href="<%=path%>/page/cal" target="_blank" class="icon icon-cal">收益明细</a>
                            </c:if>
                            <c:if test="${borrow.mmoney==borrow.money}">
                                <font size="6" color="red">正在还款中</font>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item-detail-body clearfix mrt30 ui-tab">
            <div class="ui-tab-nav hd"> <i class="icon-cur" style="left: 39px;"></i>
                <ul>
                    <li class="nav_li active" id="nav_1"><a href="javascript:void(0);">借款信息</a></li>
                    <li class="nav_li" id="nav_2"><a href="javascript:void(0);">投资记录</a> <i class="icon icon-num1" style="margin-left: -15px;"> <span id="tender_times">23</span> <em></em> </i> </li>
                    <li class="nav_li" id="nav_3"><a href="javascript:void(0);">还款列表</a></li>
                </ul>
            </div>
            <div class="bd">
                <div class="ui-tab-item active" style="display: block;">
                    <div class="borrow-info">
                        <dl class="item">
                            <dt>
                            <h3>投资详情</h3>
                            </dt>
                            <dd>
                                <div class="text">
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 产品名称：${borrow.cpname}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 募集资金：${borrow.money}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 预期年化收益：<a style="color: red;size: 4px">${borrow.nprofit}%</a></p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 起息时间：满标起息</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 资金用途：${borrow.mpurpose}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 收益方式：${borrow.way}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 还款来源：${borrow.hksource}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 借款人介绍：${borrow.suggest}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 项目描述：${borrow.xmdescrip}</p>
                                    <p class="MsoNormal" style="margin-left:0cm;text-indent:0cm;"> 保障措施：${borrow.guarantee}</p>
                                </div>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt>
                            <h3>审核信息</h3>
                            </dt>
                            <dd>
                                <div class="verify clearfix">
                                    <ul>
                                        <li><i class="icon icon-4"></i><br>
                                            身份证</li>
                                        <li><i class="icon icon-5"></i><br>
                                            户口本</li>
                                        <li><i class="icon icon-7"></i><br>
                                            工作证明</li>
                                        <li><i class="icon icon-8"></i><br>
                                            工资卡流水</li>
                                        <li><i class="icon icon-9"></i><br>
                                            收入证明</li>
                                        <li><i class="icon icon-10"></i><br>
                                            征信报告</li>
                                        <li><i class="icon icon-11"></i><br>
                                            亲属调查</li>
                                    </ul>
                                </div>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt>
                            <h3>风控步骤</h3>
                            </dt>
                            <dd>
                                <div class="step clearfix">
                                    <ul>
                                        <li><i class="icon icon-1"></i>资料审核</li>
                                        <li><i class="icon icon-2"></i>实地调查</li>
                                        <li><i class="icon icon-3"></i>资产评估</li>
                                        <li class="no"><i class="icon icon-4"></i>发布借款</li>
                                    </ul>
                                </div>
                                <div class="conclusion f16"> 结论：经风控部综合评估， <span class="c-orange">同意放款${borrow.money}元；</span>
                                    <i class="icon icon-status icon-status1"></i> </div>
                            </dd>
                        </dl>

                        <dl class="item">
                            <dt>
                            <h3>相关文件</h3>
                            </dt>
                        </dl>
                        <dd>
                            <div class="warrant"> <span class="f14 c-888">（注：为保护借款人的个人隐私信息，实物材料对部分信息进行了隐藏处理,下面展示法人身份证，营业执照副本，企业银行账户，其他资料）</span>
                                <div class="album" id="album">
                                    <div class="album-show">
                                        <div class="loading" style="display: none;"></div>
                                        <img src="<%=path%>/static/uploads/${borrow.ypic}"> </div>
                                    <div class="album-thumb"> <a href="javascript:void(0);" class="btn btn-prev"></a> <a href="javascript:;" class="btn btn-next"></a>
                                        <div style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 1070px;" class="container" id="albumThumb">
                                            <ul style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 1926px; left: 0px;">
                                                <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" alt="法人身份证" title="法人身份证" id="<%=path%>/static/uploads/${borrow.fpic}"><img src="<%=path%>/static/uploads/${borrow.fpic}"></a></li>
                                                <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" alt="营业执照副本" title="营业执照副本" id="<%=path%>/static/uploads/${borrow.ypic}"><img src="<%=path%>/static/uploads/${borrow.ypic}"></a></li>
                                                <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" alt="企业银行账户" title="企业银行账户" id="<%=path%>/static/uploads/${borrow.qpic}"><img src="<%=path%>/static/uploads/${borrow.qpic}"></a></li>
                                                <li style="overflow: hidden; float: left; width: 164px; height: 108px;"><a class="small_img" alt="其他资料" title="其他资料" id="<%=path%>/static/uploads/${borrow.tpic}"><img src="<%=path%>/static/uploads/${borrow.tpic}"></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dd>
                        </dl>
                    </div>
                </div>
                <div class="ui-tab-item" style="display: none;">
                    <div class="repayment-list"> 目前投标总额：<span class="c-orange">${borrow.money} 元</span>&nbsp;&nbsp;
                        剩余可投标金额：<span class="c-orange">${borrow.money-borrow.mmoney} 元</span>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <th>投标人</th>
                                <th>已投金额</th>
                                <th>投资产品</th>
                                <th>投标利率</th>
                                <th>投标时间</th>
                                <th>投标方式</th>
                            </tr>
                            </tbody>
                            <tbody id="repayment_content">
                            <c:forEach items="${tzbVOList}" var="d">
                                <tr>
                                    <td>${d.uname}</td>
                                    <td><span class="c-orange">￥${d.mmoney}</span>元</td>
                                    <td>${d.cpname}</td>
                                    <td>${d.nprofit}</td>
                                    <td>${d.dateToStr}</td>
                                    <td>自动</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="page-outer">
                                <td colspan="4" align="center">
                                    <div class="pagination clearfix mrt30">
                                    <span class="page">
                                        <a href="javascript:void(0);">页码</a>
                                        <a class="active" href="javascript:void(0);" onclick="">首页</a>
                                        <a  href="javascript:void(0);" onclick="">上一页</a>
                                        <a  href="javascript:void(0);" onclick="">下一页</a>
                                        <a  href="javascript:void(0);" onclick="">尾页</a>
                                        <a href="javascript:void(0);">共条</a>
                                    </span>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="ui-tab-item" style="display: none;">
                    <div class="repayment-list"> 已还本息：<span class="c-orange">0.00元</span>&nbsp;&nbsp;
                        待还本息：<span class="c-orange">40,400.00元</span>&nbsp;&nbsp;(待还本息因算法不同可能会存误差，实际金额以到账金额为准！)
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th>合约还款日期</th>
                                <th>期数</th>
                                <th>应还本金</th>
                                <th>应还利息</th>
                                <th>应还本息</th>
                                <th>还款状态</th>
                            </tr>
                            <tr>
                                <td>2015-10-13</td>
                                <td>1</td>
                                <td>40,000.00元</td>
                                <td>400.00元</td>
                                <td>40,400.00元</td>
                                <td>还款中</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 网站底部-->
    <%@include file="../common/footer.jsp" %>
    <script src="<%=path%>/static/plugin/bootstrap/js/plugins/layer/layer.js"></script>
    <script  type="text/javascript">
        function prompt() {
            var userId =$('#userId').val();
            if(userId=="null"){
                window.location.href = "/page/user";
            }else{
                layer.prompt({title: '输入投资金额', formType: 3}, function(money, index){
                    layer.close(index);
                    var xmoney=money;
                    layer.prompt({title: '支付密码', formType: 1}, function(pass, index){
                        layer.close(index);
                        options(pass,xmoney);
                    });
                });
            }
        }

        function options(pass,xmoney){
            var uid =$('#uid').val();
            var maxMoney =$('#maxMoney').val();
            var baid=$('#baid').val();
            layer.confirm('你确定要投资', {
                btn: ['确定','取消'] //按钮
            }, function(){
                layer.msg('正在投资中。。', {icon: 1});
                touzi(uid,pass,xmoney,maxMoney,baid);
            }, function(){
                layer.msg('取消中。。。', {
                    time: 20000, //2s后自动关闭
                    btn: ['明白了', '知道了']
                });
            });
        }

        function touzi(uid,pass,xmoney,maxMoney,baid) {
            if(xmoney<100){
                layer.msg("投资金额不能少于100！", {icon: 2, time: 2000});
                return;
            }
            $.post(
                "/tz/save/"+uid+"/"+xmoney+"/"+pass+"/"+maxMoney+"/"+baid,
                function (data) {
                    if (data.result == "ok") {

                        layer.msg(data.message, {icon: 2, time: 2000});

                    }else if(data.result == "login"){
                        window.location.href ="/page/login";
                    }else {
                        layer.msg(data.message, {icon: 2, time: 2000});

                    }
                },
                "json"
            );
        }

    </script>
</body>
</html>
