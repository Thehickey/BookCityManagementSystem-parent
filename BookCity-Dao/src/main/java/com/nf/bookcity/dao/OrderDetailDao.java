package com.nf.bookcity.dao;

import com.nf.bookcity.entity.OrderDetail;

import java.util.List;

public interface OrderDetailDao {

    //根据订单ID获取订单详情
    List<OrderDetail> getOrderDetailByOrderId(int orderId);

    //添加订单详情
    int insertOrderDetail(OrderDetail orderDetail);

}
