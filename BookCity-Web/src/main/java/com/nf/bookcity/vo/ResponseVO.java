package com.nf.bookcity.vo;

public class ResponseVO {

    public String message;

    public String code;

    public Object data;

    private ResponseVO(Builder builder) {
        message = builder.message;
        code = builder.code;
        data = builder.data;
    }

    public static Builder newBuilder() {
        return new Builder();
    }


    public static final class Builder {
        private String message;
        private String code;
        private Object data;

        private Builder() {
        }

        public Builder message(String val) {
            message = val;
            return this;
        }

        public Builder code(String val) {
            code = val;
            return this;
        }

        public Builder data(Object val) {
            data = val;
            return this;
        }

        public ResponseVO build() {
            return new ResponseVO(this);
        }
    }
}
