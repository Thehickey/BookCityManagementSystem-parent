package com.nf.bookCity.dao;

import com.nf.bookCity.entity.Admin;
import com.nf.bookCity.entity.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {

    //分页查询所有管理员
    List<Admin> getAdminPageAll(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);

    //查询所有管理员
    List<Admin> getAdminAll();

    //根据ID查询管理员
    Admin getAdminById(int adminId);

    //添加管理员
    int insertAdmin(Admin admin);

    //根据ID删除管理员
    int deleteAdminById(int adminId);

    //修改管理员信息
    int updateAdmin(Admin admin);

    //查询管理员数量
    int getAdminCount();

}
