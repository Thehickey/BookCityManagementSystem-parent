package com.nf.bookcity.controller;

import com.nf.bookcity.entity.Cart;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.service.CartService;
import com.nf.bookcity.service.CustomerService;
import com.nf.bookcity.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController{

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CartService cartService;

    @GetMapping("/login")
    public String login(){
        return "customer/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseVO login(@RequestBody Customer customer){
        System.out.println("customer = " + customer);
        Customer customer1 = customerService.loginVerification(customer);
        System.out.println("customer1 = " + customer1);
        if (customer1 != null){
            return ResponseVO.newBuilder().code("200").message("登录成功").data(customer1).build();
        }
        return ResponseVO.newBuilder().code("500").message("登录失败").data(null).build();
    }

    @PostMapping("/register")
    @ResponseBody
    public ResponseVO register(@RequestBody Customer customer){
        boolean bool = customerService.insertCustomer(customer);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("注册成功").data(customer).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("注册失败").data(null).build();
        }
    }

    @RequestMapping("/cart")
    public String cart(){
        return "customer/cart";
    }

    @GetMapping("/cartList")
    public String cartList(HttpServletRequest httpServletRequest){
        Customer customer = (Customer) httpServletRequest.getSession().getAttribute("Customer");
        List<Cart> carts = cartService.getCartByCustomerId(customer.getCustomerId());
        httpServletRequest.setAttribute("Carts",carts);
        return "other/cartList";
    }

    @PostMapping("/insertCommodity")
    @ResponseBody
    public ResponseVO insertCommodity(String bookName, String bookPrice,
                                   HttpServletRequest httpServletRequest){
        Customer customer = (Customer) httpServletRequest.getSession().getAttribute("Customer");
        Cart cart = new Cart(customer.getCustomerId(), bookName, 1, new BigDecimal(bookPrice), new Date(), new Date());
        if (cart != null){
            cartService.insertCommodity(cart);
            return ResponseVO.newBuilder().code("200").message("添加成功").data(cart).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("添加失败").data(null).build();
        }
    }

    @PostMapping("/addCommodity")
    @ResponseBody
    public ResponseVO addCommodity(String bookName){
        boolean bool = cartService.addCommodityCnt(1,bookName);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("添加成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("添加失败").data(null).build();
        }
    }

    @PostMapping("/subCommodity")
    @ResponseBody
    public ResponseVO subCommodity(String bookName){
        boolean bool = cartService.subCommodityCnt(1,bookName);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("添加成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("添加失败").data(null).build();
        }
    }

    @PostMapping("/deleteCommodity")
    @ResponseBody
    public ResponseVO deleteCommodity(String bookName){
        boolean bool = cartService.deleteCommodity(bookName);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("删除成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("删除失败").data(null).build();
        }
    }

    @RequestMapping("/index")
    public String index(){
        return "customer/index";
    }
}
