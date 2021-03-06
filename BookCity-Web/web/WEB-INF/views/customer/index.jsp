<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/9
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>个人中心</title>
    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/static/amazeui/2.5.1/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/static/css/systyle.css" rel="stylesheet" type="text/css">

</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="/home?customerUsername=${sessionScope.Customer.customerUsername}&customerPassword=${sessionScope.Customer.customerPassword}" target="_top" class="h">书城首页</a></div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="/customer/cart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                    </div>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="#">首页</a></li>
        </ul>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="wrap-left">
                <div class="wrap-list">
                    <div class="m-user">
                        <!--个人信息 -->
                        <div class="m-bg"></div>
                        <div class="m-userinfo">
                            <div class="m-baseinfo">
                                <a href="information.html">
                                    <img src="/static/images/getAvatar.do.jpg">
                                </a>
                                <em class="s-name">${sessionScope.Customer.customerUsername}<span class="vip1"></span></em>
                                <div class="s-prestige am-btn am-round">
                                    </span>会员福利</div>
                            </div>
                            <div class="m-right">
                                <div class="m-new">
                                    <a href="news.html"><i class="am-icon-bell-o"></i>消息</a>
                                </div>
                                <div class="m-address">
                                    <a href="address.html" class="i-trigger">我的收货地址</a>
                                </div>
                            </div>
                        </div>

                        <!--个人资产-->
                        <div class="m-userproperty">
                            <div class="s-bar">
                                <i class="s-icon"></i>个人资产
                            </div>
                            <p class="m-bonus">
                                <a href="bonus.html">
                                    <i><img src="/static/images/bonus.png"/></i>
                                    <span class="m-title">红包</span>
                                    <em class="m-num">2</em>
                                </a>
                            </p>
                            <p class="m-coupon">
                                <a href="coupon.html">
                                    <i><img src="/static/images/coupon.png"/></i>
                                    <span class="m-title">优惠券</span>
                                    <em class="m-num">2</em>
                                </a>
                            </p>
                            <p class="m-bill">
                                <a href="bill.html">
                                    <i><img src="/static/images/wallet.png"/></i>
                                    <span class="m-title">钱包</span>
                                    <em class="m-num">2</em>
                                </a>
                            </p>
                            <p class="m-big">
                                <a href="#">
                                    <i><img src="/static/images/day-to.png"/></i>
                                    <span class="m-title">签到有礼</span>
                                </a>
                            </p>
                            <p class="m-big">
                                <a href="#">
                                    <i><img src="/static/images/72h.png"/></i>
                                    <span class="m-title">72小时发货</span>
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="box-container-bottom"></div>

                    <!--订单 -->
                    <div class="m-order">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的订单
                            <a class="i-load-more-item-shadow" href="order.html">全部订单</a>
                        </div>
                        <ul>
                            <li><a href="order.html"><i><img src="/static/images/pay.png"/></i><span>待付款</span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/send.png"/></i><span>待发货<em class="m-num">1</em></span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/receive.png"/></i><span>待收货</span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/comment.png"/></i><span>待评价<em class="m-num">3</em></span></a></li>
                            <li><a href="change.html"><i><img src="/static/images/refund.png"/></i><span>退换货</span></a></li>
                        </ul>
                    </div>
                    <!--九宫格-->
                    <div class="user-patternIcon">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的常用
                        </div>
                        <ul>

                            <a href="/static/home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="/static/images/iconbig.png"/><p>购物车</p></li></a>
                            <a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="/static/images/iconsmall1.png"/><p>我的收藏</p></li></a>
                            <a href="/static/home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="/static/images/iconsmall0.png"/><p>为你推荐</p></li></a>
                            <a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="/static/images/iconsmall3.png"/><p>好评宝贝</p></li></a>
                            <a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="/static/images/iconsmall2.png"/><p>我的足迹</p></li></a>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap-right">

                <!-- 日历-->
                <div class="day-list">
                    <div class="s-bar">
                        <a class="i-history-trigger s-icon" href="#"></a>我的日历
                        <a class="i-setting-trigger s-icon" href="#"></a>
                    </div>
                    <div class="s-care s-care-noweather">
                        <div class="s-date">
                            <em>21</em>
                            <span>星期一</span>
                            <span>2015.12</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--底部-->
        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="#">恒望科技</a>
                    <b>|</b>
                    <a href="#">商城首页</a>
                    <b>|</b>
                    <a href="#">支付宝</a>
                    <b>|</b>
                    <a href="#">物流</a>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="#">关于恒望</a>
                    <a href="#">合作伙伴</a>
                    <a href="#">联系我们</a>
                    <a href="#">网站地图</a>
                    <em>© 2016-2026 XXXX 版权所有 <a href="http://www.cssmoban.com/" target="_blank" title="版权所有">版权所有</a> - Collect from</em>
                </p>
            </div>
        </div>

    </div>

    <aside class="menu">
        <ul>
            <li class="person active">
                <a href="index.html">个人中心</a>
            </li>
            <li class="person">
                <a href="#">个人资料</a>
                <ul>
                    <li> <a href="information.html">个人信息</a></li>
                    <li> <a href="safety.html">安全设置</a></li>
                    <li> <a href="address.html">收货地址</a></li>
                </ul>
            </li>
            <li class="person">
                <a href="#">我的交易</a>
                <ul>
                    <li><a href="/customer/order">订单管理</a></li>
                    <li> <a href="change.html">退款售后</a></li>
                </ul>
            </li>
            <li class="person">
                <a href="#">我的资产</a>
                <ul>
                    <li> <a href="coupon.html">优惠券 </a></li>
                    <li> <a href="bonus.html">红包</a></li>
                    <li> <a href="bill.html">账单明细</a></li>
                </ul>
            </li>

            <li class="person">
                <a href="#">我的小窝</a>
                <ul>
                    <li> <a href="collection.html">收藏</a></li>
                    <li> <a href="foot.html">足迹</a></li>
                    <li> <a href="comment.html">评价</a></li>
                    <li> <a href="news.html">消息</a></li>
                </ul>
            </li>

        </ul>

    </aside>
</div>
<!--引导 -->
<div class="navCir">
    <li><a href="/static/home/home.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="/static/home/sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="/static/home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>
