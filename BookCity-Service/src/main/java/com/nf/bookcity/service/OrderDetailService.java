package com.nf.bookcity.service;

import com.nf.bookcity.entity.OrderDetail;

import java.util.List;

public interface OrderDetailService {

    //根据订单ID获取订单详情
    List<OrderDetail> getOrderDetailByOrderId(int orderId);

    //添加订单详情
    boolean insertOrderDetail(OrderDetail orderDetail);

}
