<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--网站底部-->
<div id="footer" class="ft">
    <div class="ft-inner clearfix">
        <div class="ft-helper clearfix">
            <dl>
                <dt>关于我们</dt>
                <dd><a href="<%=path%>/page/about">公司简介</a><a href="<%=path%>/page/managerTuandui">管理团队</a><a
                        href="<%=path%>/page/ad/1">网站公告</a></dd>
            </dl>
            <dl>
                <dt>相关业务</dt>
                <dd><a href="<%=path%>/page/list?pageNo=1">我要投资</a><a href="<%=path%>/">我要借款</a></dd>
            </dl>
            <dl>
                <dt>帮助中心</dt>
                <dd><a href="<%=path%>/page/help">新手入门</a><a href="<%=path%>/page/user">我的账户</a><a href="<%=path%>/page/list?pageNo=1">债权转让</a></dd>
            </dl>
            <dl>
                <dt>联系我们</dt>
                <dd><a href="<%=path%>/page/contract">联系我们</a></dd>
            </dl>
        </div>
        <div class="ft-service">
            <dl>
                <dd>
                    <p><strong>400-660-1268</strong><br>
                        工作日 9:00-22:00<br>
                        官方交流群:<em>12345678</em><br>
                        工作日 9:00-22:00 / 周六 9:00-18:00<br>
                    </p>
                    <div class="ft-serv-handle clearfix"><a class="icon-hdSprite icon-ft-sina a-move a-moveHover"
                                                            title="亿人宝新浪微博" target="_blank" href="#"></a><a
                            class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover" title="亿人宝腾讯微博" target="_blank"
                            href="#"></a><a class="icon-ft-qun a-move a-moveHover" title="亿人宝QQ群" target="_blank"
                                            href="#"></a><a class="icon-hdSprite icon-ft-email a-move a-moveHover mrn"
                                                            title="阳光易贷email" target="_blank"
                                                            href="mailto:xz@yirenbao.com"></a></div>
                </dd>
            </dl>
        </div>
        <div class="ft-wap clearfix">
            <dl>
                <dt>手机APP下载二维码</dt>
                <dd>
                    <span class="icon-ft-erweima">
                        <c:forEach var="s" items="${homeList}">
                            <img src="<%=path%>/${s.ewm}" style="display: inline;">
                        </c:forEach>
                    </span>
                </dd>
            </dl>
        </div>
    </div>
    <div class="ft-record">
        <div class="ft-approve clearfix"><a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="#"></a><a
                class="icon-approve approve-1 fadeIn-2s" target="_blank" href="#"></a><a
                class="icon-approve approve-2 fadeIn-2s" target="_blank" href="#"></a><a
                class="icon-approve approve-3 fadeIn-2s" target="_blank" href="#"></a></div>
        <div class="ft-identity">©2018 亿人宝 All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;江西省亿人宝投资管理有限公司&nbsp;&nbsp;&nbsp;<span
                class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn/">赣ICP备12345678号-1</a>
        </div>
    </div>
</div>
