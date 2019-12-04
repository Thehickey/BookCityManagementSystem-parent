package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.BookCategory;
import com.nf.bookcity.service.BookCategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class BookCategoryServiceImplTest {

    @Autowired
    private BookCategoryService bookCategoryService;

    @Test
    public void getBookCategoryAll() {
        List<BookCategory> bookCategories = bookCategoryService.getBookCategoryAll();
        for (BookCategory bookCategory : bookCategories) {
            System.out.println(bookCategory);
        }
    }

    @Test
    public void getBookCategoryById() {
        BookCategory bookCategory = bookCategoryService.getBookCategoryById(1);
        System.out.println(bookCategory);
    }

    @Test
    public void insertBookCategory() {
        BookCategory bookCategory = new BookCategory("都市言情");
        bookCategoryService.insertBookCategory(bookCategory);
    }

    @Test
    public void deleteBookCategoryById() {
        bookCategoryService.deleteBookCategoryById(2);
    }

    @Test
    public void updateBookCategory() {
        BookCategory bookCategory = new BookCategory(2,"玄幻");
        bookCategoryService.updateBookCategory(bookCategory);
    }
}