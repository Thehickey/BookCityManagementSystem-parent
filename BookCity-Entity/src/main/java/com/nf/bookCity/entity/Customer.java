package com.nf.bookCity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

//用户表
@Data
@AllArgsConstructor
public class Customer {

    public Customer() {
    }

    public Customer(String customerUsername, String customerName, String customerPassword, String customerGender, String customerPhone, String customerIdcard, String customerAdress, String customerEmail) {
        this.customerUsername = customerUsername;
        this.customerName = customerName;
        this.customerPassword = customerPassword;
        this.customerGender = customerGender;
        this.customerPhone = customerPhone;
        this.customerIdcard = customerIdcard;
        this.customerAdress = customerAdress;
        this.customerEmail = customerEmail;
    }

    //用户ID
    private Integer customerId;

    //用户名
    private String customerUsername;

    //真实姓名
    private String customerName;

    //密码
    private String customerPassword;

    //性别
    private String customerGender;

    //电话
    private String customerPhone;

    //身份证号码
    private String customerIdcard;

    //地址
    private String customerAdress;

    //邮箱
    private String customerEmail;

}
