<%--
  Created by IntelliJ IDEA.
  User: 清淡欢颜
  Date: 2019/12/11
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="cartTable">
    <div class="cart-table-th">
        <div class="wp">
            <div class="th th-chk">
                <div id="J_SelectAll1" class="select-all J_SelectAll">
                </div>
            </div>
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
            <div class="th th-op">
                <div class="td-inner">操作</div>
            </div>
        </div>
    </div>
    <div class="clear"></div>

    <c:forEach var="cart" items="${Carts}">
        <tr class="item-list">
            <div class="bundle  bundle-last ">
                <div class="bundle-main">
                    <ul class="item-content clearfix">
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                                <input data-cartId="${cart.cartId}" data-Total=${cart.cartBookCnt*cart.cartBookPrice} class="check" id="J_CheckBox_170769542747" name="items[]" value="170769542747" type="checkbox">
                                <label for="J_CheckBox_170769542747"></label>
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="#" target="_blank" data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint" data-point="tbcart.8.12">
                                    <img src="${cart.cartBookPicUrl}" class="itempic J_ItemImg"></a>
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="#" target="_blank" title="${cart.cartBookName}" class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.cartBookName}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                            <div class="item-props item-props-can">
                                <span class="sku-line">颜色：10#蜜橘色</span>
                                <span class="sku-line">包装：两支手袋装（送彩带）</span>
                                <span tabindex="0" class="btn-edit-sku theme-login">修改</span>
                                <i class="theme-login am-icon-sort-desc"></i>
                            </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0">${cart.cartBookPrice}</em>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <input class="min" data-bookName="${cart.cartBookName}" type="button" value="-" />
                                        <input class="text_box" name="" type="text" value="${cart.cartBookCnt}" style="width:30px;" />
                                        <input class="add" data-bookName="${cart.cartBookName}" type="button" value="+" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <em tabindex="0" class="J_ItemSum number">${cart.cartBookCnt*cart.cartBookPrice}</em>
                            </div>
                        </li>
                        <li class="td td-op">
                            <div class="td-inner">
                                <a data-bookName="${cart.cartBookName}" href="javascript:;" data-point-url="#" class="delete">
                                    删除</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </tr>
    </c:forEach>
</div>

<div class="clear"></div>

<div class="float-bar-wrapper">
    <div class="operations">
        <a href="javascript:;" class="btn btn-success check-3">全选</a>
        <a href="javascript:;" class="btn btn-primary check-1">反选</a>
        <a href="javascript:;" class="btn btn-danger check-2">取消全选</a>
    </div>
    <div class="float-bar-right">
        <div class="amount-sum">
            <span class="txt">已选商品</span>
            <em id="J_SelectedItemsCount"></em><span class="txt">件</span>
            <div class="arrow-box">
                <span class="selected-items-arrow"></span>
                <span class="arrow"></span>
            </div>
        </div>
        <div class="price-sum">
            <span class="txt">合计:</span>
            <strong class="price">¥<em id="J_Total">0.00</em></strong>
        </div>
        <div class="btn-area">
            <a href="javascript:;" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                <span>结&nbsp;算</span></a>
        </div>
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
