package com.nf.bookcity.controller;

import com.nf.bookcity.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    //登录页面
    @GetMapping("/login")
    public String login(){
        return "customer/login";
    }

}
