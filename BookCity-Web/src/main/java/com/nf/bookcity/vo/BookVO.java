package com.nf.bookcity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookVO {

    private Integer bookId;

    private String bookPicUrl;

    private String bookName;

    private Integer bookCategoryId;

    private String bookDescript;

    private String bookAuthor;

    private String bookPress;

    private String bookDate;

    private Integer bookPrice;

}
