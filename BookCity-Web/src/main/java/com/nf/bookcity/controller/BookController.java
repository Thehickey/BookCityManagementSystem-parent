package com.nf.bookcity.controller;

import com.github.pagehelper.PageInfo;
import com.nf.bookcity.entity.Book;
import com.nf.bookcity.entity.BookCategory;
import com.nf.bookcity.service.BookCategoryService;
import com.nf.bookcity.service.BookService;
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
    private BookService bookService;

    @Autowired
    private BookCategoryService bookCategoryService;

    //根据类别加载图书
    @GetMapping("/bookListByCategory")
    public String bookListByCategory(@RequestParam(value = "categoryId",required = false)int categoryId,Model model){
        List<Book> books = bookService.getBookByCategoryId(categoryId);
        model.addAttribute("bookListByCategory",books);
        return "other/bookListByCategory";
    }

    //根据书名查询图书
    @GetMapping("/bookListByCategoryForHome")
    @ResponseBody
    public ResponseVO bookListByCategoryForHome(String categoryId,String pageNum){
        List<Book> books = bookService.getBookPageByCategoryId(Integer.parseInt(categoryId),Integer.parseInt(pageNum),6);
        PageInfo<Book> pageInfo = new PageInfo<>(books,5);
        return ResponseVO.newBuilder().code("200").message("查询成功").data(pageInfo).build();
    }

    //查询图书类别
    @GetMapping("/bookCategory")
    @ResponseBody
    public ResponseVO bookCategory(){
        List<BookCategory> bookCategories = bookCategoryService.getBookCategoryAll();
        return ResponseVO.newBuilder().code("200").message("图书类别查询成功").data(bookCategories).build();
    }

    //查询图书类别
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
