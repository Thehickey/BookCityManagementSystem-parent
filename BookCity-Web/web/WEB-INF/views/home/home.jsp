<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/3
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>书城首页</title>
    <link href="/static/amazeui/2.5.1/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/js/bookListByCategoryForHome.js?v=<%= System.currentTimeMillis()%>"></script>
    <script src="/static/amazeui/2.5.1/js/amazeui.min.js"></script>
</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <div class="header-top">
        <div class="am-container header">
            <ul class="message-l">
                <div class="topMessage">
                    <div class="menu-hd">
                        <c:choose>
                            <c:when test="${sessionScope.Customer != null}">
                                <span>欢迎您，${sessionScope.Customer.customerUsername}</span>
                                <a href="/customer/cancellation">注销</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/customer/login" target="_top" class="h">亲，请登录</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </ul>
            <ul class="message-r">
                <div class="topMessage my-shangcheng">
                    <div class="menu-hd MyShangcheng"><a href="/customer/index" target="_top">个人中心</a></div>
                </div>
                <div class="topMessage mini-cart">
                    <div class="menu-hd"><a id="mc-menu-hd" href="/customer/cart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                </div>
            </ul>
        </div>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="/static/images/logo.png" /></div>
        <div class="logoBig">
            <li><img src="/static/images/logobig.png" /></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form>
                <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
            </form>
        </div>
    </div>

    <div class="clear"></div>
</div>
<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1"><a href="introduction.html"><img src="/static/images/ad1.jpg" /></a></li>
            <li class="banner2"><a><img src="/static/images/ad2.jpg" /></a></li>
            <li class="banner3"><a><img src="/static/images/ad3.jpg" /></a></li>
            <li class="banner4"><a><img src="/static/images/ad4.jpg" /></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="shopNav">
    <div class="slideall">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
<%--        <div class="nav-cont">--%>
<%--            <ul>--%>
<%--                <li class="index"><a href="#">首页</a></li>--%>
<%--                <li class="qc"><a href="#">闪购</a></li>--%>
<%--                <li class="qc"><a href="#">限时抢</a></li>--%>
<%--                <li class="qc"><a href="#">团购</a></li>--%>
<%--                <li class="qc last"><a href="#">大包装</a></li>--%>
<%--            </ul>--%>
<%--            <div class="nav-extra">--%>
<%--                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利--%>
<%--                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">
                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <c:forEach var="bookCategory" items="${bookCategoryList}">
                                <li class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name"><i><img src="/static/images/cake.png"></i><a class="ml-22" title="${bookCategory.categoryName}">${bookCategory.categoryName}</a></h3>
                                        <em>&gt;</em></div>
                                    <div class="menu-item menu-in top">
                                        <div class="area-in">
                                            <div class="area-bg">
                                                <div class="menu-srot">
                                                    <div class="sort-side">
                                                        <dl class="dl-sort" data-id="${bookCategory.categoryId}">
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        //根据类别显示图书
        <script type="text/javascript">
            $(function () {
                $(".first").hover(function () {
                    $.ajax({
                        url:"/book/bookListByCategory?categoryId=" + $(this).find(".dl-sort").attr("data-id"),
                        type:"GET",
                        success:function (result) {
                            $(".dl-sort").html(result)
                        }
                    })
                })
            })
        </script>

        <!--轮播-->

        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>



        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="..//static/images/navsmall.jpg" />
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="..//static/images/huismall.jpg" />
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="..//static/images/mansmall.jpg" />
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="..//static/images/moneysmall.jpg" />
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>

        <!--走马灯 -->

        <div class="marqueen">
            <span class="marqueen-title">商城头条</span>
            <div class="demo">

                <ul>
                    <li class="title-first"><a target="_blank" href="#">
                        <img src="..//static/images/TJ2.jpg"></img>
                        <span>[特惠]</span>商城爆品1分秒
                    </a></li>
                    <li class="title-first"><a target="_blank" href="#">
                        <span>[公告]</span>商城与广州市签署战略合作协议
                        <img src="..//static/images/TJ.jpg"></img>
                        <p>XXXXXXXXXXXXXXXXXX</p>
                    </a></li>

                    <div class="mod-vip">
                        <div class="m-baseinfo">
                            <a href="../person/index.html">
                                <img src="..//static/images/getAvatar.do.jpg">
                            </a>
                            <em>
                                Hi,<span class="s-name">小叮当</span>
                                <a href="#"><p>点击更多优惠活动</p></a>
                            </em>
                        </div>
                        <div class="member-logout">
                            <a class="am-btn-warning btn" href="login.html">登录</a>
                            <a class="am-btn-warning btn" href="register.html">注册</a>
                        </div>
                        <div class="member-login">
                            <a href="#"><strong>0</strong>待收货</a>
                            <a href="#"><strong>0</strong>待发货</a>
                            <a href="#"><strong>0</strong>待付款</a>
                            <a href="#"><strong>0</strong>待评价</a>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
                    <li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
                    <li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>

                </ul>
                <div class="advTip"><img src="..//static/images/advTip.jpg"/></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">
    </div>
</div>

<!--引导 -->
<div class="navCir">
    <li class="active"><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="/customer/index"><i class="am-icon-user"></i>我的</a></li>
</div>


<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="# ">
                    <span class="setting "></span>
                </a>
                <div class="ibar_login_box status_login ">
                    <c:choose>
                        <c:when test="${Customer != null}">
                            <div class="avatar_box ">
                                <ul class="user_info ">
                                    <li>欢迎您，${Customer.customerUsername}</li>
                                </ul>
                            </div>
                            <div class="login_btnbox ">
                                <a href="# " class="login_order ">我的订单</a>
                                <a href="# " class="login_favorite ">我的收藏</a>
                            </div>
                            <i class="icon_arrow_white "></i>
                        </c:when>
                        <c:otherwise>
                            <div class="avatar_box ">
                                <p class="avatar_imgbox "><img src="/static/images/no-img_mid_.jpg " /></p>
                                <p>亲，您还没登录哦</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
            <div id="shopCart " class="item ">
                <a href="/customer/cart">
                    <span class="message "></span>
                </a>
                <p>
                    购物车
                </p>
                <p class="cart_num ">0</p>
            </div>
            <div id="asset " class="item ">
                <a href="# ">
                    <span class="view "></span>
                </a>
                <div class="mp_tooltip ">
                    我的资产
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="# ">
                    <span class="zuji "></span>
                </a>
                <div class="mp_tooltip ">
                    我的足迹
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="#">
                    <span class="wdsc "><img src="/static/images/wdsc.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="# ">
                    <span class="chongzhi "><img src="/static/images/chongzhi.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我要充值
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <li class="qtitem ">
                    <a href="# "><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li>
                <!--二维码 -->
                <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="/static/images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            我
        </div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a>
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">红包</div>
            </a>
            <a href="# " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            足迹
        </div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script type="text/javascript" src="/static/basic/js/quick_links.js "></script>
</body>

</html>
