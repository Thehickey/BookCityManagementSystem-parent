package com.nf.bookcity.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//图书信息表
@Data
@AllArgsConstructor
public class Book {

    public Book() {
    }

    public Book(Integer bookId, String bookName, Integer bookCategoryId, String bookDescript, String bookAuthor, String bookPress, String bookPicUrl, Date bookDate, BigDecimal bookPrice) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookCategoryId = bookCategoryId;
        this.bookDescript = bookDescript;
        this.bookAuthor = bookAuthor;
        this.bookPress = bookPress;
        this.bookPicUrl = bookPicUrl;
        this.bookDate = bookDate;
        this.bookPrice = bookPrice;
    }

    public Book(Integer bookId, String bookName, Integer bookCategoryId, String bookDescript, String bookAuthor, String bookPress, Date bookDate, BigDecimal bookPrice) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookCategoryId = bookCategoryId;
        this.bookDescript = bookDescript;
        this.bookAuthor = bookAuthor;
        this.bookPress = bookPress;
        this.bookDate = bookDate;
        this.bookPrice = bookPrice;
    }



    public Book(String bookName, Integer bookCategoryId, String bookDescript, String bookAuthor, String bookPress, String bookPicUrl, Date bookDate, BigDecimal bookPrice) {
        this.bookName = bookName;
        this.bookCategoryId = bookCategoryId;
        this.bookDescript = bookDescript;
        this.bookAuthor = bookAuthor;
        this.bookPress = bookPress;
        this.bookPicUrl = bookPicUrl;
        this.bookDate = bookDate;
        this.bookPrice = bookPrice;
    }

    //图书ID
    private Integer bookId;

    //图书名称
    private String bookName;

    //类别ID
    private Integer bookCategoryId;

    //图书简介
    private String bookDescript;

    //作者
    private String bookAuthor;

    //出版社
    private String bookPress;

    //图片地址
    private String bookPicUrl;

    //上架日期
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date bookDate;

    //图书价格
    private BigDecimal bookPrice;

    //图书类别名称
    private String bookCategoryName;

}
