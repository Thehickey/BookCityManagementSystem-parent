package com.nf.bookcity.controller;

import com.nf.bookcity.entity.BookCategory;
import com.nf.bookcity.service.BookCategoryService;
import com.nf.bookcity.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookCategoryService bookCategoryService;

    @GetMapping("/bookCategory")
    public String bookCategory(Model model){
        List<BookCategory> bookCategories = bookCategoryService.getBookCategoryAll();
        model.addAttribute("bookCategoryList",bookCategories);
        return "other/bookCategoryList";
    }

    @PostMapping("/bookCategory")
    @ResponseBody
    public ResponseVO bookCategory(@RequestBody BookCategory bookCategory){
        boolean bool = bookCategoryService.insertBookCategory(bookCategory);
        if (bool == true){
            return ResponseVO.newBuilder().code("200").message("图书类别添加成功").data(bool).build();
        }else {
            return ResponseVO.newBuilder().code("500").message("图书类别添加失败").data(null).build();
        }
    }

}
