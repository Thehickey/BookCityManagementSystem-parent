<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/12
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>确认订单信息</h3>
<div class="cart-table-th">
    <div class="wp">
        <div class="th th-item">
            <div class="td-inner">商品信息</div>
        </div>
        <div class="th th-price">
            <div class="td-inner">单价</div>
        </div>
        <div class="th th-amount">
            <div class="td-inner">数量</div>
        </div>
        <div class="th th-sum">
            <div class="td-inner">金额</div>
        </div>
    </div>
</div>
<div class="clear"></div>
<c:forEach var="cart" items="${sessionScope.confirmCart}">
    <tr class="item-list">
        <div class="bundle  bundle-last">

            <div class="bundle-main">
                <ul class="item-content clearfix">
                    <div class="pay-phone">
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" class="J_MakePoint">
                                    <img src="${cart.cartBookPicUrl}" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.cartBookName}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <em class="J_Price price-now">${cart.cartBookPrice}</em>
                                </div>
                            </div>
                        </li>
                    </div>
                    <li class="td td-amount">
                        <div class="amount-wrapper ">
                            <div class="item-amount ">
                                <span class="phone-title">购买数量</span>
                                <div class="sl">
                                    <input class="text_box" name="" type="text" value="${cart.cartBookCnt}" style="width:30px;" />
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="td td-sum">
                        <div class="td-inner">
                            <em tabindex="0" class="J_ItemSum number">${cart.cartBookCnt*cart.cartBookPrice}</em>
                        </div>
                    </li>
                </ul>
                <div class="clear"></div>

            </div>
        </div>
    </tr>
    <div class="clear"></div>
</c:forEach>
