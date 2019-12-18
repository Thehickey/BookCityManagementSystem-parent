package com.nf.bookcity.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.nf.bookcity.entity.Admin;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.service.AdminService;
import com.nf.bookcity.service.OrderMasterService;
import com.nf.bookcity.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private OrderMasterService orderMasterService;

    //登录页面
    @GetMapping("/login")
    public String login(){
        return "admin/login";
    }

    //登录
    @PostMapping("/login")
    @ResponseBody
    public ResponseVO login(@RequestBody Admin admin,HttpServletRequest httpServletRequest){
        Admin admin1 = adminService.loginVerification(admin);
        httpServletRequest.getSession().setAttribute("Admin",admin1);
        if (admin1 != null){
            return ResponseVO.newBuilder().code("200").message("登录成功").data(admin1).build();
        }
        return ResponseVO.newBuilder().code("500").message("登录失败").data(null).build();
    }

    //后台主页
    @RequestMapping("/index")
    public String index(@RequestParam(required = false,value = "adminUsername")String adminUsername,
                        @RequestParam(required = false,value = "adminPassword")String adminPassword){
        return "admin/index";
    }

    @RequestMapping("/order")
    public String order(@RequestParam(value = "pageNum",required = false,defaultValue = "1")int pageNum,
                        @RequestParam(value = "pageSize",required = false,defaultValue = "3")int pageSize,
                        Model model){
        List<OrderMaster> orderMasters =orderMasterService.getOrderMasterPageAll(pageNum, pageSize);
        PageInfo<OrderMaster> pageInfo = new PageInfo<>(orderMasters,3);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/order";
    }

    //发货
    @PostMapping("/consignment")
    @ResponseBody
    public ResponseVO consignment(@RequestParam(required = false,value = "orderId")String orderId){
        boolean bool = orderMasterService.updateOrderStatusByOrderId(Integer.parseInt(orderId),2);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

}
