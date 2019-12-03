package com.nf.bookcity.entity;

import lombok.Data;

import java.math.BigDecimal;

//订单详情表
@Data
public class OrderDetail {

    //详细信息ID
    private Integer detailId;

    //订单ID
    private Integer detailOrderId;

    //图书ID
    private Integer detailBookId;

    //图书名称
    private String detailBookName;

    //购买数量
    private Integer detailBookCnt;

    //购买单价
    private BigDecimal detailBookPrice;

    //总价
    private BigDecimal detailBookTotail;

}
