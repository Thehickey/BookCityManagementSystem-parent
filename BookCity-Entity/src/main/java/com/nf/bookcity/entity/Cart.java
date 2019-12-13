package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//购物车表
@Data
@AllArgsConstructor
public class Cart {

    public Cart() {
    }

    public Cart(Integer cartCustomerId, String cartBookName, Integer cartBookCnt, BigDecimal cartBookPrice, Date cartCreateTime, Date cartModifiedTime) {
        this.cartCustomerId = cartCustomerId;
        this.cartBookName = cartBookName;
        this.cartBookCnt = cartBookCnt;
        this.cartBookPrice = cartBookPrice;
        this.cartCreateTime = cartCreateTime;
        this.cartModifiedTime = cartModifiedTime;
    }

    //购物车ID
    private Integer cartId;

    //用户ID
    private Integer cartCustomerId;

    //图书名称
    private String cartBookName;

    //商品数量
    private Integer cartBookCnt;

    //商品价格
    private BigDecimal cartBookPrice;

    //加入时间
    private Date cartCreateTime;

    //最后修改时间
    private Date cartModifiedTime;

}
