package com.nf.bookcity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class UpdateBookVO {

    private Integer bookId;

    private String bookName;

    private Integer bookCategoryId;

    private String bookDescript;

    private String bookAuthor;

    private String bookPress;

    private String bookDate;

    private String bookPrice;

    private UpdateBookVO(Builder builder) {
        bookId = builder.bookId;
        bookName = builder.bookName;
        bookCategoryId = builder.bookCategoryId;
        bookDescript = builder.bookDescript;
        bookAuthor = builder.bookAuthor;
        bookPress = builder.bookPress;
        bookDate = builder.bookDate;
        bookPrice = builder.bookPrice;
    }

    public static Builder newBuilder() {
        return new Builder();
    }


    public static final class Builder {
        private Integer bookId;
        private String bookName;
        private Integer bookCategoryId;
        private String bookDescript;
        private String bookAuthor;
        private String bookPress;
        private String bookDate;
        private String bookPrice;

        private Builder() {
        }

        public Builder bookId(Integer val) {
            bookId = val;
            return this;
        }

        public Builder bookName(String val) {
            bookName = val;
            return this;
        }

        public Builder bookCategoryId(Integer val) {
            bookCategoryId = val;
            return this;
        }

        public Builder bookDescript(String val) {
            bookDescript = val;
            return this;
        }

        public Builder bookAuthor(String val) {
            bookAuthor = val;
            return this;
        }

        public Builder bookPress(String val) {
            bookPress = val;
            return this;
        }

        public Builder bookDate(String val) {
            bookDate = val;
            return this;
        }

        public Builder bookPrice(String val) {
            bookPrice = val;
            return this;
        }

        public UpdateBookVO build() {
            return new UpdateBookVO(this);
        }
    }
}
