<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/13
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>我的订单管理</title>
    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.bootcss.com/amazeui/2.5.1/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/static/css/orstyle.css" rel="stylesheet" type="text/css">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/amazeui/2.5.1/js/amazeui.min.js"></script>
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
    </article>
</header>
<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="/customer/index">首页</a></li>
        </ul>
    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">所有订单</a></li>
                        <li><a href="#tab2">待付款</a></li>
                        <li><a href="#tab3">待发货</a></li>
                        <li><a href="#tab4">待收货</a></li>
                        <li><a href="#tab5">已收货</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <c:forEach var="order" items="${orderByCustomer}">
                                <div class="order-main">
                                    <div class="order-list">
                                        <div class="order-status5">
                                            <div class="order-title">
                                                <div class="dd-num">订单编号：<a href="javascript:;">${order.orderSn}</a></div>
                                                <span>成交时间：${order.orderCreateTime}</span>
                                            </div>
                                            <c:forEach var="orderDetail" items="${order.orderDetailList}">
                                                <div class="order-content">
                                                    <div class="order-left">
                                                        <ul class="item-list">
                                                            <li class="td td-item">
                                                                <div class="item-pic">
                                                                    <a href="#" class="J_MakePoint">
                                                                        <img src="/static/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                                    </a>
                                                                </div>
                                                                <div class="item-info">
                                                                    <div class="item-basic-info">
                                                                        <a href="#">
                                                                            <p>${orderDetail.detailBookName}</p>
                                                                            <p class="info-little">颜色：12#川南玛瑙
                                                                                <br/>包装：裸装 </p>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li class="td td-price">
                                                                <div class="item-price">
                                                                        ${orderDetail.detailBookPrice}
                                                                </div>
                                                            </li>
                                                            <li class="td td-number">
                                                                <div class="item-number">
                                                                    <span>×</span>${orderDetail.detailBookCnt}
                                                                </div>
                                                            </li>
                                                            <li class="td td-operation">
                                                                <div class="item-operation">

                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="order-right">
                                                        <li class="td td-amount">
                                                            <div class="item-amount">
                                                                合计：${orderDetail.detailBookTotail}
                                                            </div>
                                                        </li>
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus">交易成功</p>
                                                                    <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                                    <p class="order-info"><a href="logistics.html">查看物流</a></p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    删除订单</div>
                                                            </li>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${order == null}">
                                    <h1>亲，您还没有订单哦</h1>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab2">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <c:forEach var="order" items="${orderByCustomer}">
                                <c:if test="${order.orderStatus == 0}">
                                    <div class="order-main">
                                        <div class="order-list">
                                            <div class="order-status1">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a href="javascript:;">${order.orderSn}</a></div>
                                                    <span>成交时间：${order.orderCreateTime}</span>
                                                </div>
                                                <c:forEach var="orderDetail" items="${order.orderDetailList}">
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <ul class="item-list">
                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="/static/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${orderDetail.detailBookName}</p>
                                                                                <p class="info-little">颜色：12#川南玛瑙
                                                                                    <br/>包装：裸装 </p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${orderDetail.detailBookPrice}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${orderDetail.detailBookCnt}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">

                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${orderDetail.detailBookTotail}
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">等待买家付款</p>
                                                                        <p class="order-info"><a href="#">取消订单</a></p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <a href="pay.html">
                                                                        <div class="am-btn am-btn-danger anniu">
                                                                            一键支付</div></a>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="nopay" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${nopay == null}">
                                <h1 align="center">亲，您还没有待付款的订单呢</h1>
                            </c:if>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab3">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <c:forEach var="order" items="${orderByCustomer}">
                                <c:if test="${order.orderStatus == 1}">
                                    <div class="order-main">
                                        <div class="order-list">
                                            <div class="order-status2">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a href="javascript:;">${order.orderSn}</a></div>
                                                    <span>成交时间：${order.orderCreateTime}</span>
                                                </div>
                                                <c:forEach var="orderDetail" items="${order.orderDetailList}">
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <ul class="item-list">
                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="/static/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${orderDetail.detailBookName}</p>
                                                                                <p class="info-little">颜色：12#川南玛瑙
                                                                                    <br/>包装：裸装 </p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${orderDetail.detailBookPrice}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${orderDetail.detailBookCnt}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">
                                                                        <a href="refund.html">退款</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${orderDetail.detailBookTotail}
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">买家已付款</p>
                                                                        <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <div class="am-btn am-btn-danger anniu">
                                                                        提醒发货</div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="noconsignment" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${noconsignment == null}">
                                <h1 align="center">亲，您还没有待发货的订单呢</h1>
                            </c:if>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab4">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <c:forEach var="order" items="${orderByCustomer}">
                                <c:if test="${order.orderStatus == 2}">
                                    <div class="order-main">
                                        <div class="order-list">
                                            <div class="order-status3">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a href="javascript:;">${order.orderSn}</a></div>
                                                    <span>成交时间：${order.orderCreateTime}</span>
                                                </div>
                                                <c:forEach var="orderDetail" items="${order.orderDetailList}">
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <ul class="item-list">
                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="/static/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${orderDetail.detailBookName}</p>
                                                                                <p class="info-little">颜色：12#川南玛瑙
                                                                                    <br/>包装：裸装 </p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${orderDetail.detailBookPrice}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${orderDetail.detailBookCnt}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">
                                                                        <a href="refund.html">退款/退货</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${orderDetail.detailBookTotail}
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">卖家已发货</p>
                                                                        <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                                        <p class="order-info"><a href="logistics.html">查看物流</a></p>
                                                                        <p class="order-info"><a href="#">延长收货</a></p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <div class="am-btn am-btn-danger anniu">
                                                                        <a data-orderId="${order.orderId}" class="takegoods" href="javascript:;">确认收货</a>
                                                                    </div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="notake" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${notake == null}">
                                <h1 align="center">亲，您还没有待收货的订单呢</h1>
                            </c:if>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab5">
                            <div class="order-top">
                                <div class="th th-item">
                                    <td class="td-inner">商品</td>
                                </div>
                                <div class="th th-price">
                                    <td class="td-inner">单价</td>
                                </div>
                                <div class="th th-number">
                                    <td class="td-inner">数量</td>
                                </div>
                                <div class="th th-operation">
                                    <td class="td-inner">商品操作</td>
                                </div>
                                <div class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                                <div class="th th-status">
                                    <td class="td-inner">交易状态</td>
                                </div>
                                <div class="th th-change">
                                    <td class="td-inner">交易操作</td>
                                </div>
                            </div>
                            <c:forEach var="order" items="${orderByCustomer}">
                                <c:if test="${order.orderStatus == 3}">
                                    <div class="order-main">
                                        <div class="order-list">
                                            <div class="order-status4">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a href="javascript:;">${order.orderSn}</a></div>
                                                    <span>成交时间：${order.orderCreateTime}</span>
                                                </div>
                                                <c:forEach var="orderDetail" items="${order.orderDetailList}">
                                                    <div class="order-content">
                                                        <div class="order-left">
                                                            <ul class="item-list">
                                                                <li class="td td-item">
                                                                    <div class="item-pic">
                                                                        <a href="#" class="J_MakePoint">
                                                                            <img src="/static/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                                        </a>
                                                                    </div>
                                                                    <div class="item-info">
                                                                        <div class="item-basic-info">
                                                                            <a href="#">
                                                                                <p>${orderDetail.detailBookName}</p>
                                                                                <p class="info-little">颜色：12#川南玛瑙
                                                                                    <br/>包装：裸装 </p>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-price">
                                                                    <div class="item-price">
                                                                            ${orderDetail.detailBookPrice}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-number">
                                                                    <div class="item-number">
                                                                        <span>×</span>${orderDetail.detailBookCnt}
                                                                    </div>
                                                                </li>
                                                                <li class="td td-operation">
                                                                    <div class="item-operation">
                                                                        <a href="refund.html">退款/退货</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${orderDetail.detailBookTotail}
                                                                </div>
                                                            </li>
                                                            <div class="move-right">
                                                                <li class="td td-status">
                                                                    <div class="item-status">
                                                                        <p class="Mystatus">卖家已发货</p>
                                                                        <p class="order-info"><a href="orderinfo.html">订单详情</a></p>
                                                                        <p class="order-info"><a href="logistics.html">查看物流</a></p>
                                                                        <p class="order-info"><a href="#">延长收货</a></p>
                                                                    </div>
                                                                </li>
                                                                <li class="td td-change">
                                                                    <div class="am-btn am-btn-danger anniu">
                                                                        确认收货</div>
                                                                </li>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <c:set var="notakegoods" value="1"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${notakegoods == null}">
                                <h1 align="center">亲，您还没有已收货的订单呢</h1>
                            </c:if>
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
            <li class="person">
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
                    <li class="active"><a href="order.html">订单管理</a></li>
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

</body>
<script type="text/javascript">
    $(function () {
        takegoods();
    })

    function takegoods() {
        $(".takegoods").click(function () {
            var orderId = $(this).attr("data-orderId");
            $.ajax({
                url:"/customer/takegoods?orderId=" + orderId,
                type:"POST",
                contentType:"application/json;charset=utf-8",
                success:function (result) {
                    if (result.data == true){
                        alert("收货成功")
                        window.location.href = "/customer/order";
                    }else {
                        alert("收货失败");
                    }
                }
            })
        })
    }
</script>

</html>
