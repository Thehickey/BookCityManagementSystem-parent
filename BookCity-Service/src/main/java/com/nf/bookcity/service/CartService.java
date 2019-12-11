package com.nf.bookcity.service;

import com.nf.bookcity.entity.Cart;

import java.util.List;

public interface CartService {

    //根据用户ID查询购物车
    List<Cart> getCartByCustomerId(int customerId);

    //添加商品
    boolean insertCommodity(Cart cart);

    //添加商品数量
    boolean addCommodityCnt(int count,String bookName);

    //减少商品数量
    boolean subCommodityCnt(int count,String bookName);

    //删除商品
    boolean deleteCommodity(String bookName);

}
