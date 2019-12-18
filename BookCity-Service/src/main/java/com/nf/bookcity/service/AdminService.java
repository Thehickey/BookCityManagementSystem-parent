package com.nf.bookcity.service;

import com.nf.bookcity.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {

    //分页查询所有管理员
    List<Admin> getAdminPageAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);

    //查询所有管理员
    List<Admin> getAdminAll();

    //根据ID查询管理员
    Admin getAdminById(int adminId);

    //添加管理员
    boolean insertAdmin(Admin admin);

    //根据ID删除管理员
    boolean deleteAdminById(int adminId);

    //修改管理员信息
    boolean updateAdmin(Admin admin);

    //查询管理员数量
    int getAdminCount();

    //登录验证
    Admin loginVerification(Admin admin);

}
