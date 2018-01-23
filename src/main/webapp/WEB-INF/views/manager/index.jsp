<%@ page import="top.zzh.bean.HUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    HUser hUser=(HUser)session.getAttribute("HUser");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>亿人宝后台管理系统</title>
    <jsp:include page="../common/css.jsp"/>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element" style="text-align: center">
                        <span>
                              <img alt="image" class="img-circle" src="<%=path%>/static/images/profile_small.jpg"/>
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0);">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold"><%=hUser.getHuname()%></strong>
                             </span> <span class="text-muted text-xs block"><b class="caret"></b></span> </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a class="J_menuItem" href="<%=path%>/Huser/findMessage">修改资料</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="<%=path%>/Huser/updatePwdView">修改密码</a>
                            </li>
                            <li>
                                <a href="<%=path%>/Huser/logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">宝
                    </div>
                </li>
                <shiro:hasRole name="超级管理员">
                    <li>
                        <a href="javascript:void(0);">
                            <i class="glyphicon glyphicon-link"></i>
                            <span class="nav-label">权限分配</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="<%=path %>/permission/permissionPage">权限管理</a></li>
                            <li><a a class="J_menuItem" href="<%=path %>/role/rolePage">角色管理</a></li>
                            <li><a a class="J_menuItem" href="<%=path %>/rolePermission/rolePermissionPage">角色权限管理</a></li>
                            <li><a a class="J_menuItem" href="<%=path %>/hUserRole/hUserRolePage">后台用户角色管理</a></li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <shiro:hasRole name="普通管理员">
                    <li>
                        <a href="javascript:void(0);">
                            <i class="fa fa-th-large"></i>
                            <span class="nav-label">用户管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="<%=path%>/luser/userList">用户信息</a></li>
                            <li><a class="J_menuItem" href="<%=path%>/recommend/page">推荐管理</a>
                            </li>
                            <li><a class="J_menuItem" href="<%=path%>/logMoney/list">资金流向管理</a>
                            </li>
                            <li><a class="J_menuItem" href="<%=path%>/logTx/init">用户提现记录</a>
                            </li>
                            <li><a class="J_menuItem" href="<%=path%>/option/page">用户反馈</a>
                            </li>
                            <li><a class="J_menuItem" href="<%=path%>/letter/page">站内信管理</a>
                            </li>
                            <li><a class="J_menuItem" href="<%=path%>/luser/loginlog">登录日志</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <i class="fa fa fa-globe"></i>
                            <span class="nav-label">审核管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="<%=path%>/page/users">借款审核</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/rzvip/rzvipList">认证审核</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/txCheck/init">提现审核</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            <i class="fa fa-edit"></i>
                            <span class="nav-label">金额管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="<%=path%>/reward/rewardList">奖励信息</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/tz/page">用户投资列表</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/userMoney/init">用户资金管理</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/ticket/page">优惠券管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <i class="fa fa-star"></i>
                            <span class="nav-label">类型管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li><a a class="J_menuItem" href="<%=path%>/sway/sway">还款方式类型管理</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/bz/bz">标种类型管理</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/jklx/jklx">借款类型管理</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/friend/friend">合作伙伴管理</a>
                            </li>
                            <li><a a class="J_menuItem" href="<%=path%>/notice/notice">最新公告列表</a>
                            </li>

                        </ul>
                    </li>
                </shiro:hasRole><!--普通管理员-->
                <shiro:hasRole name="普通员工">
                    <li>
                        <a href="javascript:void(0);">
                            <i class="fa fa-desktop"></i>
                            <span class="nav-label">宣传管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">

                            <shiro:hasPermission name="宣传管理:媒体报道列表">
                                <li><a a class="J_menuItem" href="<%=path%>/media/page">媒体报道</a></li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="宣传管理:公司动态列表">
                                <li><a a class="J_menuItem" href="<%=path%>/dynamic/page">公司动态</a></li>
                            </shiro:hasPermission>

                            <shiro:hasPermission name="宣传管理:首页信息列表">
                                <li><a a class="J_menuItem" href="<%=path%>/home/page">首页信息</a></li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                </shiro:hasRole><!--普通员工-->
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search"
                                   id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="" title="返回首页"><i
                                class="fa fa-home"></i></a>欢迎进入亿人宝管理员中心</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="" class="pull-left">
                                        <img alt="image" class="img-circle"
                                             src="<%=path%>/static/plugin/bootstrap/img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 项目已处理完结
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="" class="pull-left">
                                        <img alt="image" class="img-circle"
                                             src="<%=path%>/static/plugin/bootstrap/img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 这是一条测试信息
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%=path%>/Huser/logout">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>


        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:void(0);" class="active J_menuTab" data-id="">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="<%=path%>/Huser/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<%=path%>/page/managerindex"
                    frameborder="0" data-id=""></iframe>
            <div class="footer">
                <div class="pull-right">&copy; 2017-2018 <a href="" target="_blank">亿人宝理财平台</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/js.jsp"/>
</body>
</html>
