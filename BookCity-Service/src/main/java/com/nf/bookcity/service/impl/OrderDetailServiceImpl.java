package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.OrderDetailDao;
import com.nf.bookcity.entity.OrderDetail;
import com.nf.bookcity.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailDao orderDetailDao;


    @Override
    public List<OrderDetail> getOrderDetailByOrderId(int orderId) {
        return orderDetailDao.getOrderDetailByOrderId(orderId);
    }

    @Override
    public boolean insertOrderDetail(OrderDetail orderDetail) {
        return orderDetailDao.insertOrderDetail(orderDetail) > 0 ? true : false;
    }
}
