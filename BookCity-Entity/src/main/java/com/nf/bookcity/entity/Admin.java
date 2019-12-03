package com.nf.bookcity.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

//管理员表
@Data
@AllArgsConstructor
public class Admin {

    public Admin() {
    }

    public Admin(String adminUsername, String adminPassword, String adminIdcard) {
        this.adminUsername = adminUsername;
        this.adminPassword = adminPassword;
        this.adminIdcard = adminIdcard;
    }

    //管理员ID
    private Integer adminId;

    //管理员名
    private String adminUsername;

    //管理员密码
    private String adminPassword;

    //身份证号码
    private String adminIdcard;

}
