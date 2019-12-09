package com.nf.bookcity.controller;

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

    @GetMapping("/bookListByCategory")
    public String bookListByCategory(@RequestParam(value = "categoryId",required = false)int categoryId,Model model){
        List<Book> books = bookService.getBookByCategoryId(categoryId);
        model.addAttribute("bookListByCategory",books);
        return "other/bookListByCategory";
    }

    @GetMapping("/bookListByCategoryForHome")
    @ResponseBody
    public ResponseVO bookListByCategoryForHome(String categoryId){
        List<Book> books = bookService.getBookByCategoryId(Integer.parseInt(categoryId));
        return ResponseVO.newBuilder().code("200").message("查询成功").data(books).build();
    }

    @GetMapping("/bookCategory")
    @ResponseBody
    public ResponseVO bookCategory(){
        List<BookCategory> bookCategories = bookCategoryService.getBookCategoryAll();
        return ResponseVO.newBuilder().code("200").message("图书类别添加成功").data(bookCategories).build();
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
