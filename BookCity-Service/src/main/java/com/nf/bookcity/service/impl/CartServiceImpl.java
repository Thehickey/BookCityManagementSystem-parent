package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.CartDao;
import com.nf.bookcity.entity.Cart;
import com.nf.bookcity.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public List<Cart> getCartByCustomerId(int customerId) {
        return cartDao.getCartByCustomerId(customerId);
    }

    @Override
    public boolean insertCommodity(Cart cart) {
        return cartDao.insertCommodity(cart) > 0 ? true : false;
    }

    @Override
    public boolean addCommodityCnt(int count, String bookName) {
        return cartDao.addCommodityCnt(count, bookName) > 0 ? true : false;
    }

    @Override
    public boolean subCommodityCnt(int count, String bookName) {
        return cartDao.subCommodityCnt(count, bookName) > 0 ? true : false;
    }

    @Override
    public boolean deleteCommodity(String bookName) {
        return cartDao.deleteCommodity(bookName) > 0 ? true : false;
    }
}
