package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.BookCategoryDao;
import com.nf.bookcity.entity.BookCategory;
import com.nf.bookcity.service.BookCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookCategoryServiceImpl implements BookCategoryService {

    @Autowired
    private BookCategoryDao bookCategoryDao;

    @Override
    public List<BookCategory> getBookCategoryAll() {
        return bookCategoryDao.getBookCategoryAll();
    }

    @Override
    public BookCategory getBookCategoryById(int categoryId) {
        return bookCategoryDao.getBookCategoryById(categoryId);
    }

    @Override
    public boolean insertBookCategory(BookCategory bookCategory) {
        return bookCategoryDao.insertBookCategory(bookCategory) > 0 ? true : false;
    }

    @Override
    public boolean deleteBookCategoryById(int categoryId) {
        return bookCategoryDao.deleteBookCategoryById(categoryId) > 0 ? true : false;
    }

    @Override
    public boolean updateBookCategory(BookCategory bookCategory) {
        return bookCategoryDao.updateBookCategory(bookCategory) > 0 ? true : false;
    }
}
