package com.nf.bookcity.service;

import com.nf.bookcity.entity.BookCategory;

import java.util.List;

public interface BookCategoryService {

    //查询所有书籍类别
    List<BookCategory> getBookCategoryAll();

    //根据ID查询书籍类别
    BookCategory getBookCategoryById(int categoryId);

    //添加书籍类别
    boolean insertBookCategory(BookCategory bookCategory);

    //根据ID删除书籍类别
    boolean deleteBookCategoryById(int categoryId);

    //修改书籍类别信息
    boolean updateBookCategory(BookCategory bookCategory);

}
