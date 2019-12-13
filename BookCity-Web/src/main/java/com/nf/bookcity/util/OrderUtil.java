package com.nf.bookcity.util;

import java.util.UUID;

public class OrderUtil {

    public static String getOrderId(){  //获取订单号
        return UUID.randomUUID().toString();
    }

}
