package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.OrderMasterDao;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.service.OrderMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderMasterServiceImpl implements OrderMasterService {

    @Autowired
    private OrderMasterDao orderMasterDao;

    @Override
    public List<OrderMaster> getOrderMasterAll() {
        return orderMasterDao.getOrderMasterAll();
    }

    @Override
    public List<OrderMaster> getOrderMasterByCustomerId(int customerId) {
        return orderMasterDao.getOrderMasterByCustomerId(customerId);
    }

    @Override
    public List<OrderMaster> getOrderMasterByOrderStatus(int orderStatus) {
        return orderMasterDao.getOrderMasterByOrderStatus(orderStatus);
    }

    @Override
    public OrderMaster getOrderMasterByOrderSn(String orderSn) {
        return orderMasterDao.getOrderMasterByOrderSn(orderSn);
    }

    @Override
    public boolean insertOrder(OrderMaster orderMaster) {
        return orderMasterDao.insertOrder(orderMaster) > 0 ? true : false;
    }

}
