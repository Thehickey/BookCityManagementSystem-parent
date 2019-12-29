package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

//购物车表
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

    public Cart(Integer cartCustomerId, String cartBookName, String cartBookPicUrl, Integer cartBookCnt, BigDecimal cartBookPrice, Date cartCreateTime, Date cartModifiedTime) {
        this.cartCustomerId = cartCustomerId;
        this.cartBookName = cartBookName;
        this.cartBookPicUrl = cartBookPicUrl;
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

    //图书图片
    private String cartBookPicUrl;

    //商品数量
    private Integer cartBookCnt;

    //商品价格
    private BigDecimal cartBookPrice;

    //加入时间
    private Date cartCreateTime;

    //最后修改时间
    private Date cartModifiedTime;

}
