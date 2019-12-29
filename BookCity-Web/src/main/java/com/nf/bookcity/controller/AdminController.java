package com.nf.bookcity.controller;

import com.github.pagehelper.PageInfo;
import com.nf.bookcity.entity.*;
import com.nf.bookcity.service.*;
import com.nf.bookcity.vo.ResponseVO;
import com.nf.bookcity.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private BookService bookService;

    @Autowired
    private BookCategoryService bookCategoryService;

    @Autowired
    private OrderDetailService orderDetailService;

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

    //查看订单详情
    @RequestMapping("/getDetail")
    public String getDeteil(Model model,@RequestParam(required = false,value = "orderId")int orderId){
        List<OrderDetail> orderDetails = orderDetailService.getOrderDetailByOrderId(orderId);
        model.addAttribute("orderDetails",orderDetails);
        return "admin/detailList";
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

    //会员管理
    @RequestMapping("/customerManagement")
    public String customerManagement(){
        return "admin/customerManagement";
    }


    //获取所有用户
    @GetMapping("/customerList")
    @ResponseBody
    public ResponseVO customerList(@RequestParam(value = "pageNum",required = false,defaultValue = "1")int pageNum,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "3")int pageSize){
        List<Customer> customers = customerService.getCustomerPageAll(pageNum,pageSize);
        PageInfo<Customer> pageInfo = new PageInfo(customers,3);
        if (customers != null){
            return ResponseVO.newBuilder().code("200").message("成功").data(pageInfo).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

    //修改密码
    @GetMapping("/updateCustomerPassword")
    public String updateCustomerPassword(@RequestParam(value = "customerId",required = false)int customerId,
                                         Model model){
        Customer customer = customerService.getCustomerById(customerId);
        model.addAttribute("customer",customer);
        return "admin/updateCustomerPassword";
    }

    //修改用户密码
    @PostMapping("/updateCustomerPassword")
    @ResponseBody
    public ResponseVO updateCustomerPassword(@RequestBody Customer customer){
        boolean bool = customerService.updateCustomerPassword(customer.getCustomerId(),customer.getCustomerPassword());
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

    //删除用户
    @PostMapping("/deleteCustomer")
    @ResponseBody
    public ResponseVO updateCustomerPassword(@RequestParam(value = "customerId",required = false) String customerId){
        boolean bool = customerService.deleteCustomerById(Integer.parseInt(customerId));
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

    //图书管理页面
    @GetMapping("/bookManagement")
    public String bookManagement(){
        return "admin/bookManagement";
    }

    //获取所有图书
    @GetMapping("/bookList")
    @ResponseBody
    public ResponseVO bookList(@RequestParam(value = "pageNum",required = false,defaultValue = "1")int pageNum,
                               @RequestParam(value = "pageSize",required = false,defaultValue = "5")int pageSize){
        List<Book> books = bookService.getBookPageAll(pageNum,pageSize);
        PageInfo<Book> pageInfo = new PageInfo(books,3);
        if (books != null){
            return ResponseVO.newBuilder().code("200").message("成功").data(pageInfo).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

    //获取所有图书类别
    @GetMapping("/bookCategoryList")
    @ResponseBody
    public ResponseVO bookCategoryList(){
        List<BookCategory> categories = bookCategoryService.getBookCategoryAll();
        if (categories != null){
            return ResponseVO.newBuilder().code("200").message("成功").data(categories).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

    //获取修改页面
    @GetMapping("/updateBook")
    public String updateBook(@RequestParam(value = "bookId",required = false)int bookId,Model model){
        Book book = bookService.getBookById(bookId);
        model.addAttribute("book",book);
        return "admin/updateBook";
    }

    //修改图书信息
    @PostMapping("/updateBook")
    @ResponseBody
    public ResponseVO updateBook(@RequestBody BookVO bookVO) throws Exception{
        int bookId = bookVO.getBookId();
        String bookPicUrl = bookVO.getBookPicUrl();
        String bookName = bookVO.getBookName();
        int bookCategoryId = bookVO.getBookCategoryId();
        String bookDescript = bookVO.getBookDescript();
        String bookAuthor = bookVO.getBookAuthor();
        String bookPress = bookVO.getBookPress();
        Date bookDate = new SimpleDateFormat("yyyy-MM-dd").parse(bookVO.getBookDate());
        BigDecimal bookPrice = new BigDecimal(bookVO.getBookPrice());
        Book book = new Book(bookId,bookName,bookCategoryId,bookDescript,bookAuthor,bookPress,bookPicUrl,bookDate,bookPrice);
        boolean bool = bookService.updateBook(book);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("失败").data(null).build();
        }
    }

}
