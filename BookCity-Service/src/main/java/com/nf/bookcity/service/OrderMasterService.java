package com.nf.bookcity.service;

import com.nf.bookcity.entity.OrderMaster;

import java.util.List;

public interface OrderMasterService {

    //获取所有订单
    List<OrderMaster> getOrderMasterAll();

    //根据用户编号获取订单
    List<OrderMaster> getOrderMasterByCustomerId(int customerId);

    //根据订单状态获取订单
    List<OrderMaster> getOrderMasterByOrderStatus(int orderStatus);

    //根据订单编号获取订单
    OrderMaster getOrderMasterByOrderSn(String orderSn);

    //添加订单
    boolean insertOrder(OrderMaster orderMaster);

}
