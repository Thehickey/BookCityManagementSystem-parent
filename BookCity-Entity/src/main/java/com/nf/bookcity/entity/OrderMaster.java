package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//订单信息表
@Data
@AllArgsConstructor
public class OrderMaster {

    public OrderMaster() {
    }

    public OrderMaster(String orderSn, Integer orderCustomerId, String orderCustomerName, String orderCustomerPhone, String orderCustomerAddress, BigDecimal orderMoney, BigDecimal orderPaymentMoney, Date orderCreateTime, Integer orderStatus, Date orderModifiedTime) {
        this.orderSn = orderSn;
        this.orderCustomerId = orderCustomerId;
        this.orderCustomerName = orderCustomerName;
        this.orderCustomerPhone = orderCustomerPhone;
        this.orderCustomerAddress = orderCustomerAddress;
        this.orderMoney = orderMoney;
        this.orderPaymentMoney = orderPaymentMoney;
        this.orderCreateTime = orderCreateTime;
        this.orderStatus = orderStatus;
        this.orderModifiedTime = orderModifiedTime;
    }

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
