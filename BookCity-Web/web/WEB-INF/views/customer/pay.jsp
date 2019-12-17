<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/12
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>商品结算</title>
    <link href="https://cdn.bootcss.com/amazeui/2.5.1/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="/static/css/jsstyle.css" rel="stylesheet" type="text/css" />
    <script src="/static/js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript" src="/static/js/address.js"></script>

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

<div class="clear"></div>
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
            </div>
            <div class="clear"></div>
            <ul>
                <div class="per-border"></div>
                <li class="user-addresslist defaultAddr">

                    <div class="address-left">
                        <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">${sessionScope.Customer.customerUsername}</span>
										<span class="buy-phone">${sessionScope.Customer.customerPhone}</span>
										</span>
                        </div>
                        <div class="default-address DefaultAddr">
                            <span class="buy-line-title buy-line-title-type">收货地址：</span>
                            <span class="buy--address-detail">
                                <span>${sessionScope.Customer.customerAdress}</span>
                            </span>
                        </div>
                        <ins class="deftip">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <a href="/static/person/address.html">
                            <span class="am-icon-angle-right am-icon-lg"></span></a>
                    </div>
                    <div class="clear"></div>

                    <div class="new-addr-btn">
                        <a href="#" class="hidden">设为默认</a>
                        <span class="new-addr-bar hidden">|</span>
                        <a href="#">编辑</a>
                        <span class="new-addr-bar">|</span>
                        <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                    </div>
                </li>
            </ul>

            <div class="clear"></div>
        </div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                payTable_load();
            })

            function payTable_load() {
                $.ajax({
                    url:"/customer/payList",
                    type:"GET",
                    contentType:"application/json;charset=utf-8",
                    success:function (result) {
                        $("#payTable").empty().append(result);
                    }
                })
            }
        </script>

        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计（含运费） <span>¥</span><em class="pay-sum">${total}</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${total}</em>
											</span>
                    </div>

                    <div id="holyshit268" class="pay-address">

                        <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
								   <span>${sessionScope.Customer.customerAdress}</span>
                            </span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">
                                         <span class="buy-user">${sessionScope.Customer.customerUsername}</span>
												<span class="buy-phone">${sessionScope.Customer.customerPhone}</span>
												</span>
                        </p>
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="J_Go" href="/customer/success?total=${total}" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                    </div>
                </div>
                <div id="holyshit2691" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="J_Back" href="/customer/cart" class="btn-go" tabindex="0" title="点击此按钮，返回购物车">返回购物车</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
</div>
</div>
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
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="user-name" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" id="user-name" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="user-phone" placeholder="手机号必填" type="email">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <select data-am-selected>
                        <option value="a">浙江省</option>
                        <option value="b">湖北省</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">温州市</option>
                        <option value="b">武汉市</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">瑞安区</option>
                        <option value="b">洪山区</option>
                    </select>
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-intro" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                    <small>100字以内写出你的详细地址/static.</small>
                </div>
            </div>

            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <div class="am-btn am-btn-danger">保存</div>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="clear"></div>
</body>

</html>
