package com.nf.bookcity.service;

import com.nf.bookcity.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {

    //分页查询所有书籍
    List<Book> getBookPageAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);

    //查询所有书籍
    List<Book> getBookAll();

    //根据ID查询书籍
    Book getBookById(int bookId);

    //根据类别ID查询书籍
    List<Book> getBookByCategoryId(int bookCategoryId);

    //添加书籍
    boolean insertBook(Book book);

    //根据ID删除书籍
    boolean deleteBookById(int bookId);

    //修改书籍信息
    boolean updateBook(Book book);

    //查询书籍数量
    int getBookCount();

}
