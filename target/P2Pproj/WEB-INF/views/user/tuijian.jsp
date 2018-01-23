<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>推荐中心</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="<%=path%>/static/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/user.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
    <script src="<%=path%>/static/js/user.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/static/css/fenxiang.css"/>
    <style type="text/css">
        .bdsharebuttonbox a { width: 60px!important; height: 60px!important; margin: 0 auto 10px!important; float: none!important; padding: 0!important; display: block; }
        .bdsharebuttonbox a img { width: 60px; height: 60px; }
        .bd_weixin_popup .bd_weixin_popup_foot { position: relative; top: -12px; }
    </style>
</head>
<body>
<!-- 网站头部-->
<%@include file="../common/header.jsp" %>
<!--个人中心-->
<div class="wrapper wbgcolor">
    <div class="w1200 personal">
        <%@include file="../common/leftList.jsp" %>
        <div class="personal-main">
            <div class="personal-back">
                <div style="position: relative;font-size: 18px;color: #333;border-bottom: 1px solid #DCDCDC;width: 880px;padding-top: 25px;height: 35px;">
                        <span style="font-size: 18px;border-bottom: 2px solid #28A7E1;padding-bottom: 10px;">
                            <a href="/recommend/tuijian/">推荐好友</a>
                        </span>
                    <span style="font-size:18px;padding-left: 15px;">
                            <a href="/recommend/listByUid/1/0">推荐列表</a>
                        </span>
                </div>
                <br/>
                <img src="/static/images/banner_tuijian.png"/>
                <div style="padding-top: 30px;font-size: 16px;color:#777;">
                    <p style="font-size: 18px;">尊敬的用户，你的推荐码是:
                        <span style="color:orange">${tzm}</span>
                    </p><br/>
                    截止时间：${date}<br/>
                    活动对象：活动期间新注册用户的推荐人<br/>
                    活动说明：<br/>
                    <span style="padding-left: 50px">
                            1、活动期间邀请好友注册并累计投资10000元，得50元现金券奖励</span><br/>
                    <span style="padding-left: 50px">
                        2、活动期间内成功邀请5位以上好友注册投资成功累计投资10000元，可额外获得500元现金券奖励，可在【我的账户-我的赠券】中查看。</span>
                    <br/><span style="padding-left: 50px">（满足活动条件的用户在活动结束后的3个工作日奖励以现金劵形式发放至用户账户）</span>
                    <br/>注：需将自己的邀请链接地址或推荐号发给你的好友，这样你才能成为他们的邀请者。
                    <br/><br/>
                    <input style="float: left;width: 560px;height: 30px;border: 1px solid #d9d9d9;border-right: none;color: #777777;line-height: 30px;text-indent: 10px;"
                           id="text" name="text" readonly
                           value="http://localhost:8080/page/register?userCode=${tzm}"/>
                    <button style="float: left;width: 80px;height: 32px;background-color: #319bff;color: #fff;text-align: center;position: relative;cursor: pointer;"
                            onclick="myCopy()">
                        复制链接
                    </button>
                    <br/><br/>
                    <div class="gb_resLay">
                        <div class="gb_res_t"><span>分享到</span><i></i></div>
                        <div class="bdsharebuttonbox">
                            <ul class="gb_resItms">
                                <li> <a title="分享到微信" href="#" style="background: url(/static/images/fenxiang/gbRes_2.png) no-repeat center center/60px 60px;" data-cmd="weixin" ></a>微信好友 </li>
                                <li> <a title="分享到QQ好友" href="#" style="background: url(/static/images/fenxiang/gbRes_3.png) no-repeat center center/60px 60px;" class="bds_sqq" data-cmd="sqq" ></a>QQ好友 </li>
                                <li> <a title="分享到QQ空间" href="#" style="background: url(/static/images/fenxiang/gbRes_4.png) no-repeat center center/60px 60px;" data-cmd="qzone" ></a>QQ空间 </li>
                                <li> <a title="分享到腾讯微博" href="#" style="background: url(/static/images/fenxiang/gbRes_5.png) no-repeat center center/60px 60px; " data-cmd="tqq" ></a>腾讯微博 </li>
                                <li> <a title="分享到新浪微博" href="#" style="background: url(/static/images/fenxiang/gbRes_6.png) no-repeat center center/60px 60px;" data-cmd="tsina" ></a>新浪微博 </li>
                                <li> <a title="分享到人人网" href="#" style="background: url(/static/images/fenxiang/gbRes_1.png) no-repeat center center/60px 60px;" data-cmd="renren" ></a>人人网 </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
</body>
</html>

<script src="<%=path%>/static/js/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=path%>/static/js/datepicker.js" type="text/javascript"></script>
<script>
    function myCopy() {
        var ele = document.getElementById("text");
        ele.select();
        document.execCommand("Copy");
        alert("复制成功！");
    }

    //全局变量，动态的文章ID
    var ShareURL = "";
    //绑定所有分享按钮所在A标签的鼠标移入事件，从而获取动态ID
    $(function () {
        $(".bdsharebuttonbox a").mouseover(function () {
            ShareURL = $(this).attr("data-url");
        });
    });

    /*
    * 动态设置百度分享URL的函数,具体参数
    * cmd为分享目标id,此id指的是插件中分析按钮的ID
    *，我们自己的文章ID要通过全局变量获取
    * config为当前设置，返回值为更新后的设置。
    */
    function SetShareUrl(cmd, config) {
        if (ShareURL) {
            config.bdUrl = ShareURL;
        }
        return config;
    }

    //插件的配置部分，注意要记得设置onBeforeClick事件，主要用于获取动态的文章ID
    window._bd_share_config = {
        common : {
            bdText : '亿人宝--亿人宝-轻松理财 乐享收益',
            bdDesc : '自定义分享摘要',
            bdUrl : 'http://localhost:8080/page/register?userCode=${tzm}',
            bdPic : '自定义分享图片'
        },
        share : [{
            "bdSize" : 16
        }],
        slide : [{
            bdImg : 0,
            bdPos : "right",
            bdTop : 100
        }]
    };
    //插件的JS加载部分
    with (document) 0[(getElementsByTagName('head')[0] || body)
        .appendChild(createElement('script'))
        .src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
        + ~(-new Date() / 36e5)];
</script>
</body>
</html>

