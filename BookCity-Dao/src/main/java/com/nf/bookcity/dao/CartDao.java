package com.nf.bookcity.dao;

import com.nf.bookcity.entity.Cart;

import java.util.List;

public interface CartDao {

    //根据用户ID查询购物车
    List<Cart> getCartByCustomerId(int customerId);

    //添加商品
    int insertCommodity(Cart cart);

    //添加商品数量
    int addCommodityCnt(int count,String bookName);

    //减少商品数量
    int subCommodityCnt(int count,String bookName);

    //删除商品
    int deleteCommodity(String bookName);

}
