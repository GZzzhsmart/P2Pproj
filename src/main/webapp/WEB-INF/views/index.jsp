<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>亿人宝理财平台</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
  <link href="<%=path%>/static/css/index.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
  <style>
    /*上下滚动*/
    #scrollDiv {
      width: 400px;
      height: 30px;
      line-height: 30px;
      overflow: hidden;
    }
    #scrollDiv li {
      height: 30px;
      padding-left: 10px;
    }
  </style>
  <script type="text/javascript">
      // 上下滚动
      function AutoScroll(obj) {
          $(obj).find("ul:first").animate({
                  marginTop: "-25px"
              },
              500,
              function() {
                  $(this).css({
                      marginTop: "0px"
                  }).find("li:first").appendTo(this);
              });
      }
      $(document).ready(function() {
          var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
          $("#scrollDiv").hover(function() {
                  clearInterval(myar);
              },
              function() {
                  myar = setInterval('AutoScroll("#scrollDiv")', 3000)
              }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始
      });
  </script>
</head>
<body>
<!-- 网站头部-->
<%@include file="./common/header.jsp"%>
<!--banner-->
<div class="flexslider">
  <ul class="slides">
    <c:forEach var="s" items="${homeList}">
      <li style="background-image: url(<%=path%>/${s.pic1}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="${s.l1}" target="_blank"></a></li>
      <li style="background-image: url(<%=path%>/${s.pic2}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="${s.l2}" target="_blank"></a></li>
      <li style="background-image: url(<%=path%>/${s.pic3}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="${s.l3}" target="_blank"></a></li>
      <li style="background-image: url(<%=path%>/${s.pic1}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="${s.l1}" target="_blank"></a></li>
      <li style="background-image: url(<%=path%>/${s.pic2}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;" class=""><a href="${s.l2}" target="_blank"></a></li>
    </c:forEach>
  </ul>
</div>
<script src="<%=path%>/static/js/jquery.flexslider-min.js"></script>
<script>
    $(function(){
        $('.flexslider').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
        //产品列表滚动
        var pLength = $('.pListContentBox > li').length;
        var cishu = pLength-4;
        var n = 0;
        $('.pListContentBox').css({'width':pLength*245+'px'});
        if(pLength>4){
            $('.pListRight').addClass('curr');
        }
        $('.pListRight').on('click',function(){
            if(cishu>0){
                //alert('1');
                n++;
                cishu--;
                $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
                if(cishu==0){
                    $('.pListRight').removeClass('curr');
                }
                if(n>0){
                    $('.pListLeft').addClass('curr');
                }
            }
        });
        $('.pListLeft').on('click',function(){
            if(n>0){
                n--;
                cishu++;
                $('.pListContentBox').animate({'left':'-'+n*244+'px'},500);
                if(n==0){
                    $('.pListLeft').removeClass('curr');
                }
                if(cishu>0){
                    $('.pListRight').addClass('curr');
                }
            }
        });
        //alert(pLength);
    });
</script>

<script type="text/javascript">
    var gaintop;
    $(function(){
        gaintop = $(".login_float").css("top");
        $(".login_float").css("top",-695);
        $(".login_float").show();
        $(".login_float").animate({top: gaintop,opacity:1},800);
        $(".login_float").animate({top: '-=12px',opacity:1},200);
        $(".login_float").animate({top: gaintop,opacity:1},200);
        $(".login_float").animate({top: '-=6px',opacity:1},200);
        $(".login_float").animate({top: gaintop,opacity:1},200);
        $(".login_float").animate({top: '-=2px',opacity:1},100);
        $(".login_float").animate({top: gaintop,opacity:1},100);
    });
</script>
<div class="new-announcement">
  <div class="new-announcement-title">最新公告</div>
  <div class="new-announcement-content">
    <div id="scrollDiv">
      <ul style="margin-top: 0px;">
        <c:if test="${requestScope.noticeList!=null}">
          <c:forEach var="a" items="${noticeList}" >
            <li><a  class="black-link" href="<%=path%>/notice/initNotice/${a.nid}" title="${a.title}">${a.title}</a></li>
          </c:forEach>
        </c:if>
      </ul>
    </div>
  </div>
  <a class="more" href="<%=path%>/page/ad/1">更多</a> </div>
<div class="ipubs"><span class="o1">投资总额:<strong>${list1.tmoney}</strong>元</span> <span class="o2">月投资总额:<strong>${list1.mmoney}</strong>元</span><span class="o4">总贷款人数:<strong>${tz}</strong>人</span><span class="o4">总用户:<strong>${user}</strong>人</span></div>
<div class="feature"> <a class="fea1" href="<%=path%>/page/help"> <i></i>
  <h3>高收益</h3>
  <span>年化收益率最高达20%<br>
  50元起投，助您轻松获收益</span> </a> <a class="fea2" href="<%=path%>/page/help"> <i></i>
  <h3>安全理财</h3>
  <span>100%本息保障<br>
  实物质押，多重风控审核</span> </a> <a class="fea3" href="<%=path%>/page/help"> <i></i>
  <h3>随时赎回</h3>
  <span>两步赎回您的资金<br>
  最快当日到账</span> </a> <a class="fea4" href="<%=path%>/page/help"> <i></i>
  <h3>随时随地理财</h3>
  <span>下载手机客户端<br>
  随时随地轻松理财</span> </a> </div>
<!--中间内容-->
<div class="main clearfix mrt30" data-target="sideMenu">
  <div class="wrap">
    <div class="page-left fn-left">
      <div class="mod-borrow">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-ttyx"></i>新手标</h2>
          <div class="fn-right f14 c-888">常规发标时间每天<span class="c-555">10:00，13:00和20:00</span>，其余时间根据需要随机发</div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-29天，期限短，收益见效快</span><a href="<%=path%>/page/list?pageNo=1" class="fn-right">查看更多</a></div>
          <div class="borrow-list">
            <ul>
              <c:forEach items="${borrow1}" var="d">
                <li>
                  <div class="title"><a href="<%=path%>/page/info/${d.baid}" target="_blank"><i class="icon icon-zhai" title="新手标"></i></a><a href="<%=path%>/page/info/${d.baid}" style="size: 5px" class="f18" title="${d.rname}借款${d.money}元" target="_blank">${d.rname}借款${d.money}元</a></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${d.money}</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${d.nprofit}% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${d.term}</span>月</td>
                      <td>
                        <div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar">${(d.mmoney/d.money)*100}% </div>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td align="right">
                        <c:if test="${d.mmoney==d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">还款中</a>
                        </c:if>
                        <c:if test="${d.mmoney<d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">立即投标</a>
                        </c:if>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-yyyz"></i>普金宝</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">61.37万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时24分11秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"><span class="fn-left">期限1-12月，收益更高</span><a href="<%=path%>/page/list?pageNo=1" class="fn-right">查看更多</a></div>
          <div class="borrow-list">
            <ul>
              <c:forEach items="${borrow2}" var="d">
                <li>
                  <div class="title"><a href="<%=path%>/page/info/${d.baid}" target="_blank"><i class="icon icon-zhai" title="普金宝"></i></a><a href="<%=path%>/page/info/${d.baid}" style="size: 5px" class="f18" title="${d.rname}借款${d.money}元" target="_blank">${d.rname}借款${d.money}元</a></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${d.money}</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${d.nprofit}% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${d.term}</span>月</td>
                      <td>
                        <div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar">${(d.mmoney/d.money)*100}% </div>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td align="right">
                        <c:if test="${d.mmoney==d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">还款中</a>
                        </c:if>
                        <c:if test="${d.mmoney<d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">立即投标</a>
                        </c:if>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-nnyy"></i>多金宝</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">8.35万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span class="c-555">1小时41分19秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"> <span class="fn-left">期限12-60月，打理更加容易</span><a href="<%=path%>/page/list?pageNo=1" class="fn-right">查看更多</a></div>
          <div class="borrow-list">
            <ul>
              <c:forEach items="${borrow3}" var="d">
                <li>
                  <div class="title"><a href="<%=path%>/page/info/${d.baid}" target="_blank"><i class="icon icon-zhai" title="多金宝"></i></a><a href="<%=path%>/page/info/${d.baid}" style="size: 5px" class="f18" title="${d.rname}借款${d.money}元" target="_blank">${d.rname}借款${d.money}元</a></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${d.money}</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${d.nprofit}% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${d.term}</span>月</td>
                      <td>
                        <div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar">${(d.mmoney/d.money)*100}% </div>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td align="right">
                        <c:if test="${d.mmoney==d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">还款中</a>
                        </c:if>
                        <c:if test="${d.mmoney<d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">立即投标</a>
                        </c:if>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod-borrow mrt20">
        <div class="hd">
          <h2 class="pngbg"><i class="icon icon-ssbx"></i>恒金宝</h2>
          <div class="fn-right f14 c-888">参与人次：<span class="c-555">8.06万次</span> &nbsp;&nbsp;&nbsp;平均转让用时：<span class="c-555">03小时06分22秒</span> </div>
        </div>
        <div class="bd">
          <div class="des"><span class="fl">其他投资人折价转让，转让项目会随时更新，惊喜不断</span><a href="<%=path%>/page/list?pageNo=1" class="fn-right">查看更多</a></div>
          <div class="borrow-list">
            <ul>
              <c:forEach items="${borrow4}" var="d">
                <li>
                  <div class="title"><a href="<%=path%>/page/info/${d.baid}" target="_blank"><i class="icon icon-zhai" title="恒金宝"></i></a><a href="<%=path%>/page/info/${d.baid}" style="size: 5px" class="f18" title="${d.rname}借款${d.money}元" target="_blank">${d.rname}借款${d.money}元</a></div>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                    <tr>
                      <td width="260">借款金额<span class="f24 c-333">${d.money}</span>元</td>
                      <td width="165">年利率<span class="f24 c-333">${d.nprofit}% </span></td>
                      <td width="180" align="center">期限<span class="f24 c-orange">${d.term}</span>月</td>
                      <td>
                        <div class="circle">
                          <div class="left progress-bar">
                            <div class="progress-bgPic progress-bfb10">
                              <div class="show-bar">${(d.mmoney/d.money)*100}% </div>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td align="right">
                        <c:if test="${d.mmoney==d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">还款中</a>
                        </c:if>
                        <c:if test="${d.mmoney<d.money}">
                          <a class="ui-btn btn-gray" href="<%=path%>/page/info/${d.baid}">立即投标</a>
                        </c:if>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="page-right fn-right" style="top: 0px;">
      <div class="mod-risk-tip"><i class="icon icon-tip"></i><a href="<%=path%>/" class="c-orange">收益与风险并存，请理性选择平台</a></div>
      <div class="mod mod-notice mrt20">
        <div class="hd">
          <h3>网站公告</h3>
          <a href="<%=path%>/page/ad/1" class="fn-right">更多&gt;</a></div>
        <div class="bd">
          <div class="article-list clearfix">
            <ul>
              <c:if test="${requestScope.noticeList!=null}">
                <c:forEach var="a" items="${noticeList}" >
                  <li><a href="<%=path%>/notice/initNotice/${a.nid}" title="${a.title}">${a.title}</a><span class="date"><fmt:formatDate value="${a.date}" pattern="yyyy-MM-dd"/></span></li>
                </c:forEach>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod mod-rank clearfix ui-tab mrt20">
        <div class="hd">
          <h3>媒体报道</h3>
          <a href="<%=path%>/page/report/1" class="fn-right">更多&gt;</a></div>
        <div class="bd">
          <div class="article-list clearfix">
            <ul>
              <c:if test="${requestScope.mediaPager!=null}">
                <c:forEach var="a" items="${mediaPager.rows}" >
                  <li><a href="<%=path%>/media/initMedia/${a.mid}" title="${a.title}" target="_blank">${a.title}</a></li>
                </c:forEach>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
      <div class="mod mod-notice mrt20">
        <div class="hd">
          <h3>公司动态</h3>
          <a href="<%=path%>/page/dynamic/1" class="fn-right">更多&gt;</a></div>
        <div class="bd">
          <div class="article-list clearfix">
            <ul>
              <c:if test="${requestScope.dynamicPager!=null}">
                <c:forEach var="b" items="${dynamicPager.rows}" >
                  <li><a href="<%=path%>/dynamic/initDynamic/${b.dyid}" title="${b.title}" target="_blank"> ${b.title}</a><span style="align:right;" class="date">${b.date}</span></li>
                </c:forEach>
              </c:if>
            </ul>
          </div>
        </div>
      </div>
      <!-- 收益计算器-->
      <div class="mrt20 mod"> <a target="_blank" href="<%=path%>/page/cal"><img src="<%=path%>/static/images/pic_home_js.jpg" width="300" height="80" alt="收益计算器" class="pic"></a></div>
    </div>
  </div>
</div>
<script src="<%=path%>/static/js/index.js"></script>
<div class="partners wrap clearfix mrb30">
  <div class="partners-inner ui-tab">
    <div class="hd">
      <div class="ui-tab-nav"> <i class="icon icon-cur" style="left: 151px;"></i>
        <ul>
          <li class=""><a href="#">合作机构</a></li>
          <li class="active"><a href="#">友情链接</a></li>
        </ul>
      </div>
    </div>
    <div class="bd">
      <div class="ui-tab-cont">
        <div class="ui-tab-item active">
          <div class="img-scroll">
            <div class="container">
              <ul>
                <c:if test="${requestScope.friendList!=null}">
                  <c:forEach var="s" items="${friendList}" >
                    <li><a href="${s.furl}"><img src="<%=path%>${s.fpic}" width="152" height="52" alt="软银"></a></li>
                  </c:forEach>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
        <div class="ui-tab-item">
          <div class="links">
            <a target="_blank" href="<%=path%>/">网贷互联</a>
            <a target="_blank" href="http://www.bjzq.com.cn">北京证券网</a>
            <a target="_blank" href="http://v.yidai.com/">易贷微理财</a>
            <a target="_blank" href="http://www.wangdaicaifu.com">P2P</a>
            <a target="_blank" href="http://www.p2pchina.com">网贷中国</a>
            <a target="_blank" href="http://www.wangdaibangshou.com">网贷帮手</a>
            <a target="_blank" href="https://www.okcoin.cn">比特币网</a>
            <a target="_blank" href="http://www.p2p110.com">网贷110</a>
            <a target="_blank" href="http://www.zcmall.com">招财猫理财</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 网站底部-->
<%@include file="./common/footer.jsp" %>

</body>
</html>