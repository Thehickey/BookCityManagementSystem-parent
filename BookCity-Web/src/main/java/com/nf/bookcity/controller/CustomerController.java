package com.nf.bookcity.controller;

import com.nf.bookcity.entity.Cart;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.entity.OrderDetail;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.service.CartService;
import com.nf.bookcity.service.CustomerService;
import com.nf.bookcity.service.OrderDetailService;
import com.nf.bookcity.service.OrderMasterService;
import com.nf.bookcity.util.OrderUtil;
import com.nf.bookcity.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController{

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderMasterService orderMasterService;

    @Autowired
    private OrderDetailService orderDetailService;

    //登录页面
    @GetMapping("/login")
    public String login(){
        return "customer/login";
    }

    //登录
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

    //注册
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

    //个人主页
    @RequestMapping("/index")
    public String index(){
        return "customer/index";
    }

    //购物车页面
    @RequestMapping("/cart")
    public String cart(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        session.removeAttribute("confirmCart");
        return "customer/cart";
    }

    //查询购物车内容
    @GetMapping("/cartList")
    public String cartList(HttpServletRequest httpServletRequest){
        Customer customer = (Customer) httpServletRequest.getSession().getAttribute("Customer");
        List<Cart> carts = cartService.getCartByCustomerId(customer.getCustomerId());
        httpServletRequest.setAttribute("Carts",carts);
        return "other/cartList";
    }

    //添加商品
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

    //添加商品数量
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

    //减少商品数量
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

    //删除商品
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

    //支付页面
    @GetMapping("/pay")
    public String pay(@RequestParam(value = "total",required = false)String total, Model model){
        model.addAttribute("total",Integer.parseInt(total));
        return "customer/pay";
    }

    //确认支付商品
    @PostMapping("/confirmCommodity")
    @ResponseBody
    public ResponseVO confirmCommodity(int cartId,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        Cart cart = cartService.getCartByCartId(cartId);
        if (cart != null){
            if (session.getAttribute("confirmCart") == null){
                List<Cart> carts = new ArrayList<>();
                carts.add(cart);
                httpServletRequest.getSession().setAttribute("confirmCart",carts);
            }else {
                List<Cart> carts = (List<Cart>) session.getAttribute("confirmCart");
                carts.add(cart);
                httpServletRequest.getSession().setAttribute("confirmCart",carts);
            }
            return ResponseVO.newBuilder().code("200").message("添加成功").data(cart).build();
        }else{
            return ResponseVO.newBuilder().code("500").message("添加成功").data(null).build();
        }
    }

    //获取支付商品内容
    @GetMapping("/payList")
    public String payList(){
        return "other/payList";
    }

    //付款成功
    @RequestMapping("/success")
    public String success(@RequestParam(value = "total",required = false)String total,
                          HttpServletRequest httpServletRequest){
        String orderSn = OrderUtil.getOrderId();
        httpServletRequest.setAttribute("total",Integer.parseInt(total));
        HttpSession session = httpServletRequest.getSession();
        Customer customer = (Customer) session.getAttribute("Customer");
        OrderMaster insertorderMaster = new OrderMaster(orderSn,customer.getCustomerId(),customer.getCustomerUsername(),customer.getCustomerPhone(),customer.getCustomerAdress(),new BigDecimal(total),new BigDecimal(total),new Date(),1,new Date());
        boolean bool = orderMasterService.insertOrder(insertorderMaster);
        if (bool == true){
            OrderMaster orderMaster = orderMasterService.getOrderMasterByOrderSn(orderSn);
            List<Cart> carts = (List<Cart>) session.getAttribute("confirmCart");
            for (Cart cart : carts) {
                double detailTotail = cart.getCartBookCnt()*Double.valueOf((cart.getCartBookPrice()).toString());
                OrderDetail orderDetail = new OrderDetail(orderMaster.getOrderId(),cart.getCartBookName(),cart.getCartBookCnt(),cart.getCartBookPrice(),new BigDecimal(detailTotail));
                orderDetailService.insertOrderDetail(orderDetail);//生成订单
                cartService.deleteCommodity(cart.getCartBookName());//从购物车中移除
            }
        }
        return "customer/success";
    }

}
