package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.OrderMasterDao;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.service.OrderMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderMasterServiceImpl implements OrderMasterService {

    @Autowired
    private OrderMasterDao orderMasterDao;

    @Override
    public OrderMaster getOrderMasterByOrderSn(String orderSn) {
        return orderMasterDao.getOrderMasterByOrderSn(orderSn);
    }

    @Override
    public boolean insertOrder(OrderMaster orderMaster) {
        return orderMasterDao.insertOrder(orderMaster) > 0 ? true : false;
    }

}
