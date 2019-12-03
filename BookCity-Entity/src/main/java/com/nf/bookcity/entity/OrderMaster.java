package com.nf.bookcity.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//订单信息表
@Data
public class OrderMaster {

    //订单ID
    private Integer orderId;

    //订单编号
    private String orderSn;

    //用户ID
    private Integer orderCustomerId;

    //收货人姓名
    private String orderCustomerName;

    //收货人电话
    private String orderCustomerPhone;

    //收货人地址
    private String orderCustomerAddress;

    //订单金额
    private BigDecimal orderMoney;

    //支付金额
    private BigDecimal orderPaymentMoney;

    //下单时间
    private Date orderCreateTime;

    //订单状态
    private Integer orderStatus;

    //最后修改时间
    private Date orderModifiedTime;

}
