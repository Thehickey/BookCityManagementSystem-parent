package com.nf.bookcity.dao;

import com.nf.bookcity.entity.OrderMaster;

public interface OrderMasterDao {

    //根据订单编号获取订单
    OrderMaster getOrderMasterByOrderSn(String orderSn);

    //添加订单
    int insertOrder(OrderMaster orderMaster);

}