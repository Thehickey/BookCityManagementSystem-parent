package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.Cart;
import com.nf.bookcity.service.CartService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class CartServiceImplTest {

    @Autowired
    private CartService cartService;

    @Test
    public void getCartByCustomerId() {
        List<Cart> carts = cartService.getCartByCustomerId(1);
        for (Cart cart : carts) {
            System.out.println(cart);
        }
    }

    @Test
    public void insertCommodity() {
        Cart cart = new Cart(1,"校花的贴身高手3", 2, new BigDecimal(12.2), new Date(),new Date());
        cartService.insertCommodity(cart);
    }

    @Test
    public void addCommodityCnt() {
        cartService.addCommodityCnt(2,"校花的贴身高手1");
    }

    @Test
    public void subCommodityCnt() {
        cartService.subCommodityCnt(2,"校花的贴身高手1");
    }

    @Test
    public void deleteCommodity() {
        cartService.deleteCommodity("校花的贴身高手1");
    }
}