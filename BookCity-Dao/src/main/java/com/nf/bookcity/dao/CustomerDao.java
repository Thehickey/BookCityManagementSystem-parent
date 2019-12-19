package com.nf.bookcity.dao;

import com.nf.bookcity.entity.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {

    //分页查询所有用户
    List<Customer> getCustomerPageAll(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);

    //查询所有用户
    List<Customer> getCustomerAll();

    //根据ID查询用户
    Customer getCustomerById(int customerId);

    //添加用户
    int insertCustomer(Customer customer);

    //根据ID删除用户
    int deleteCustomerById(int customerId);

    //修改用户信息
    int updateCustomer(Customer customer);

    //修改密码
    int updateCustomerPassword(int customerId,String password);

    //查询用户数量
    int getCustomerCount();

    //登录验证
    Customer loginVerification(Customer customer);

}
