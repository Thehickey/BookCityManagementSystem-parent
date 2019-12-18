package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.OrderDetail;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.service.OrderMasterService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class OrderMasterServiceImplTest {

    @Autowired
    private OrderMasterService orderMasterService;

    @Test
    public void getOrderMasterPageAll(){
        List<OrderMaster> orderMasters = orderMasterService.getOrderMasterPageAll(1,2);
        for (OrderMaster orderMaster : orderMasters) {
            System.out.println(orderMaster);
        }
    }


    @Test
    public void getOrderMasterAll(){
        List<OrderMaster> orderMasters = orderMasterService.getOrderMasterAll();
        System.out.println(orderMasters);
    }

    @Test
    public void getOrderMasterByCustomerId(){
        List<OrderMaster> orderMasters = orderMasterService.getOrderMasterByCustomerId(1);
        for (OrderMaster orderMaster : orderMasters) {
            System.out.println(orderMaster);
        }
    }

    @Test
    public void getOrderMasterByOrderStatus() {
        List<OrderMaster> orderMasters = orderMasterService.getOrderMasterByOrderStatus(1);
        for (OrderMaster orderMaster : orderMasters) {
            System.out.println(orderMaster);
        }
    }

    @Test
    public void getOrderMasterByOrderSn() {
    }

    @Test
    public void insertOrder() {
    }

    @Test
    public void updateOrderStatusByOrderId() {
        orderMasterService.updateOrderStatusByOrderId(1,2);
    }

}