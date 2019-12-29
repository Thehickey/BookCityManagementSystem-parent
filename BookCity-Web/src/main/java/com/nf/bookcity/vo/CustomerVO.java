package com.nf.bookcity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerVO {

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
