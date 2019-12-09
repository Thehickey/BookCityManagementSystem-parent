package com.nf.bookcity.controller;

import com.nf.bookcity.entity.BookCategory;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.service.BookCategoryService;
import com.nf.bookcity.service.BookService;
import com.nf.bookcity.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private BookCategoryService bookCategoryService;

    @RequestMapping("/home")
    public String home(@RequestParam(required = false,value = "customerUsername",defaultValue = "null")String customerUsername,
                       @RequestParam(required = false,value = "customerPassword",defaultValue = "null")String customerPassword,
                       Model model,HttpServletRequest httpServletRequest){
        List<BookCategory> bookCategories = bookCategoryService.getBookCategoryAll();
        if (customerUsername != null && customerPassword != null){
            Customer customer = new Customer(customerUsername,customerPassword);
            httpServletRequest.getSession().setAttribute("Customer",customerService.loginVerification(customer));
        }
        model.addAttribute("bookCategoryList",bookCategories);
        return "home/home";
    }

}
