package com.nf.bookCity.service.impl;

import com.nf.bookCity.dao.BookDao;
import com.nf.bookCity.entity.Book;
import com.nf.bookCity.service.BookService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> getBookPageAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize) {
        return bookDao.getBookPageAll(pageNum, pageSize);
    }

    @Override
    public List<Book> getBookAll() {
        return bookDao.getBookAll();
    }

    @Override
    public Book getBookById(int bookId) {
        return bookDao.getBookById(bookId);
    }

    @Override
    public boolean insertBook(Book book) {
        return bookDao.insertBook(book) > 0 ? true : false;
    }

    @Override
    public boolean deleteBookById(int bookId) {
        return bookDao.deleteBookById(bookId) > 0 ? true : false;
    }

    @Override
    public boolean updateBook(Book book) {
        return bookDao.updateBook(book) > 0 ? true : false;
    }

    @Override
    public int getBookCount() {
        return bookDao.getBookCount();
    }
}
