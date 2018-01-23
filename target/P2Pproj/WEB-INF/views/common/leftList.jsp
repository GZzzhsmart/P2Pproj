<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="credit-ad">
    <img src="${request.getContextPath}/static/images/clist1.jpg" width="1200" height="96">
</div>
<div id="personal-left" class="personal-left">
    <ul>
        <li class="pleft-cur"><span><a href="${request.getContextPath}/page/user"><i class="dot dot1"></i>账户总览</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="${request.getContextPath}/page/zijin?pageNo=1">资金记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="${request.getContextPath}/page/touzi?pageNo=1">投资记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="${request.getContextPath}/page/huikuan">还款计划</a></span></li>
        <li class=""><span><a href="${request.getContextPath}/page/disanfang"><i class="dot dot02"></i>开通第三方</a> </span></li>
        <li><span><a href="${request.getContextPath}/page/chongzhi"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="${request.getContextPath}/page/tixian"><i class="dot dot04"></i>提现</a></span></li>
        <li style="position:relative;" class=""><span> <a href="${request.getContextPath}/page/hongbao"> <i class="dot dot06"></i> 我的红包 </a> </span></li>
        <li class=""><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="${request.getContextPath}/borrowapply/borrw">借款管理</a></span></li>
        <li style="position:relative;"><span> <a href="${request.getContextPath}/letter/listByUid/1/3"><i class="dot dot08"></i>系统信息 </a> </span></li>
        <li><span><a href="${request.getContextPath}/page/zhanghu"><i class="dot dot09"></i>账户设置</a></span></li>
        <li><span><a href="${request.getContextPath}/page/feedBackAdd"><i class="dot dot09"></i>我要反馈</a></span></li>
        <br/><br/>
        <li><a href="${request.getContextPath}/recommend/tuijian"><img src="${request.getContextPath}/static/images/tuijian.png"/></a></li>
    </ul>
</div>
