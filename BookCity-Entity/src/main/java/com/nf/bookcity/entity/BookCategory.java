package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

//图书类别表
@Data
@AllArgsConstructor
public class BookCategory {

    public BookCategory() {
    }

    public BookCategory(String categoryName) {
        this.categoryName = categoryName;
    }

    //类别ID
    private Integer categoryId;

    //类别名
    private String categoryName;

}
