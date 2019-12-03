package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.Book;
import com.nf.bookcity.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class BookServiceImplTest {

    @Autowired
    private BookService bookService;

    @Test
    public void getBookPageAll() {
        List<Book> books = bookService.getBookPageAll(1,2);
        for (Book book : books) {
            System.out.println(book);
        }
    }

    @Test
    public void getBookAll() {
        List<Book> books = bookService.getBookAll();
        for (Book book : books) {
            System.out.println(book);
        }
    }

    @Test
    public void getBookById() {
        Book book = bookService.getBookById(1);
        System.out.println(book);
    }

    @Test
    public void insertBook() {
        Book book = new Book
                ("海底两万里",1,"一本好书","佚名","人民教育出版社","this is test",null,new BigDecimal(123.00));
        bookService.insertBook(book);
    }

    @Test
    public void deleteBookById() {
        bookService.deleteBookById(4);
    }

    @Test
    public void updateBook() {
        Book book = new Book
                (3,"钢铁是怎样炼成的",1,"一本好书","佚名","人民教育出版社","this is test",null,new BigDecimal(123.00));
        bookService.updateBook(book);
    }

    @Test
    public void getBookCount() {
        System.out.println(bookService.getBookCount());
    }
}