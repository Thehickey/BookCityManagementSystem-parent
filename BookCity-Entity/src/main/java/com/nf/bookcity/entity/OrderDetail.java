package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

//订单详情表
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {

    public OrderDetail(Integer detailOrderId, String detailBookName, String detailBookPicUrl, Integer detailBookCnt, BigDecimal detailBookPrice, BigDecimal detailBookTotail) {
        this.detailOrderId = detailOrderId;
        this.detailBookName = detailBookName;
        this.detailBookPicUrl = detailBookPicUrl;
        this.detailBookCnt = detailBookCnt;
        this.detailBookPrice = detailBookPrice;
        this.detailBookTotail = detailBookTotail;
    }

    //详细信息ID
    private Integer detailId;

    //订单ID
    private Integer detailOrderId;

    //图书名称
    private String detailBookName;

    //图书图片
    private String detailBookPicUrl;

    //购买数量
    private Integer detailBookCnt;

    //购买单价
    private BigDecimal detailBookPrice;

    //总价
    private BigDecimal detailBookTotail;

}
