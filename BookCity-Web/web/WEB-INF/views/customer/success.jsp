<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/13
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功</title>
    <link rel="stylesheet"  type="text/css" href="/static/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="/static/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script src="/static/js/jquery-3.3.1.min.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="header-top">
    <div class="am-container header">
        <ul class="message-r">
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="/customer/index" target="_top">个人中心</a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="/home?customerUsername=${sessionScope.Customer.customerUsername}&customerPassword=${sessionScope.Customer.customerPassword}" target="_top"><span>书城首页</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
            </div>
        </ul>
    </div>
</div>

<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em>¥${total}</em></li>
                <div class="user-info">
                    <p>收货人：${sessionScope.Customer.customerUsername}</p>
                    <p>联系电话：${sessionScope.Customer.customerPhone}</p>
                    <p>收货地址：${sessionScope.Customer.customerAdress}</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服
            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="/static/person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
                <a href="/static/person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
            </div>
        </div>
    </div>
</div>


<div class="footer" >
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


</body>
</html>

