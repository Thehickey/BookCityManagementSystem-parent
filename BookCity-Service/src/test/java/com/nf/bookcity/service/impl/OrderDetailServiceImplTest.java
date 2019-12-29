package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.OrderDetail;
import com.nf.bookcity.service.OrderDetailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class OrderDetailServiceImplTest {

    @Autowired
    private OrderDetailService orderDetailService;

    @Test
    public void getOrderDetailByOrderId() {
        List<OrderDetail> orderDetails = orderDetailService.getOrderDetailByOrderId(1);
        for (OrderDetail orderDetail : orderDetails) {
            System.out.println("===================" + orderDetail.getDetailBookPicUrl());
        }
    }

    @Test
    public void insertOrderDetail() {
    }
}