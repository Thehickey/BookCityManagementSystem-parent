package com.nf.bookcity.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//购物车表
@Data
public class Cart {

    //购物车ID
    private Integer cartId;

    //用户ID
    private Integer cartCustomerId;

    //图书ID
    private Integer cartBookId;

    //商品数量
    private Integer cartBookCnt;

    //商品价格
    private BigDecimal cartBookPrice;

    //加入时间
    private Date cartCreateTime;

    //最后修改时间
    private Date cartModifiedTime;

}
