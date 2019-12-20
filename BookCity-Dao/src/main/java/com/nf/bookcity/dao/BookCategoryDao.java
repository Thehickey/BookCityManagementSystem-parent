package com.nf.bookcity.dao;

import com.nf.bookcity.entity.BookCategory;

import java.util.List;

public interface BookCategoryDao {

    //查询所有类别
    List<BookCategory> getBookCategoryAll();

    //根据ID查询图书类别
    BookCategory getBookCategoryById(int categoryId);

    //添加类别
    int insertBookCategory(BookCategory bookCategory);

    //根据ID删除类别
    int deleteBookCategoryById(int categoryId);

    //修改类别信息
    int updateBookCategory(BookCategory bookCategory);

}
