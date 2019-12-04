package com.nf.bookcity.dao;

import com.nf.bookcity.entity.BookCategory;

import java.util.List;

public interface BookCategoryDao {

    //查询所有书籍
    List<BookCategory> getBookCategoryAll();

    //根据ID查询书籍
    BookCategory getBookCategoryById(int categoryId);

    //添加书籍
    int insertBookCategory(BookCategory bookCategory);

    //根据ID删除书籍
    int deleteBookCategoryById(int categoryId);

    //修改书籍信息
    int updateBookCategory(BookCategory bookCategory);

}
