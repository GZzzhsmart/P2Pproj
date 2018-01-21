<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>运营数据-亿人宝</title>
    <link rel="stylesheet" href="<%=path%>/static/css/infoshow/about.css">
    <link href="<%=path%>/static/css/common.css" rel="stylesheet" />
    <link href="<%=path%>/static/css/about.css" rel="stylesheet" type="text/css">
<body onhashchange="hashChange()">
<%@include file="../common/header.jsp"%>
<!--关于我们-->
<div class="bg">
    <div class="contain" id="tabs" style="margin:0 auto;">
        <%@include file="../common/aboutLeft.jsp"%>
        <!-- begin -->
        <div class="about-right">
            <div class="about-right-nav">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="active" id="sssj">实时数据</a>
                    <a href="javascript:void(0);" id="yybg" class="">运营报告</a>
                </div>
                <em class="em-line" style="left: 0px;"></em>
            </div>
            <div class="about-content" id="sssjDiv" style="display: block;">
                <div class="btnDiv">
                    撮合交易总额（元）
                </div>
                <div class="moneyDiv counter" style="letter-spacing:50px;text-align: center">
                    ${nowYdate.tmoney}
                </div>
                <div class="btnDiv">平台数据总览</div>
                <div class="sjList sjList-1">
                    <div class="item">
                        <div class="item-icon icon-dealNumber"></div>
                        <div class="itemText">月交易总额（元）</div>
                        <div class="counter itemSJ" id="mmoney">${nowYdate.mmoney}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-repayAmount"></div>
                        <div class="itemText">总用户数</div>
                        <div class="counter itemSJ" id="tuser">${nowYdate.tuser}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-unRepayAmount"></div>
                        <div class="itemText">月用户数</div>
                        <div class="counter itemSJ" id="muser">${nowYdate.muser}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-unRepayNumber"></div>
                        <div class="itemText">总投资人数</div>
                        <div class="counter itemSJ" id="ttzno">${nowYdate.ttzno}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-hasInteres"></div>
                        <div class="itemText">月投资人数</div>
                        <div class="counter itemSJ" id="mtzno">${nowYdate.tdkno}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-compensatoryMoney"></div>
                        <div class="itemText">总贷款人数</div>
                        <div class="counter itemSJ" id="tdkno">${nowYdate.mtzno}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-compensatoryNumber"></div>
                        <div class="itemText">月贷款人数</div>
                        <div class="counter itemSJ" id="mdkno">${nowYdate.mdkno}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-overdueMoney"></div>
                        <div class="itemText">总贷款笔数</div>
                        <div class="counter itemSJ" id="tdkbno">${nowYdate.tdkbno}</div>
                    </div>
                    <div class="item">
                        <div class="item-icon icon-overdueNumber"></div>
                        <div class="itemText">月贷款笔数</div>
                        <div class="counter itemSJ" id="mdkbno">${nowYdate.mdkbno}</div>
                    </div>
                </div>
            </div>
            <div class="about-content" id="yybgDiv" style="display: none;">
                <div class="tableDiv">
                    <c:if test="${ydateList.size()>0}">
                        <c:forEach items="${ydateList}" var="ydate">
                            <div class="ydataBg">
                                <a href="<%=path%>/rundata/createPdf/${ydate.yid}" style="float: left"  title="点击下载报表"><span style="font-size: 30px;color: yellow">${ydate.date}</span></a>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <!-- end -->
        </div>
    </div>
</div>
</div>
<!-- 网站底部-->
<%@include file="../common/footer.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/infoshow/about.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.countup.min.js"></script>
</body></html>
<script type="text/javascript">
    $('.counter').countUp();
</script>


