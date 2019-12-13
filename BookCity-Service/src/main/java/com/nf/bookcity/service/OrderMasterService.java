package com.nf.bookcity.service;

import com.nf.bookcity.entity.OrderMaster;

public interface OrderMasterService {

    //根据订单编号获取订单
    OrderMaster getOrderMasterByOrderSn(String orderSn);

    //添加订单
    boolean insertOrder(OrderMaster orderMaster);

}
