package com.nf.bookcity.controller;

import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.service.CustomerService;
import com.nf.bookcity.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/customer")
public class CustomerController{

    @Autowired
    private CustomerService customerService;

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

    @RequestMapping("/index")
    public String index(){
        return "customer/index";
    }
}
