package com.nf.bookcity.service.impl;

import com.nf.bookcity.config.AppConfig;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class CustomerServiceImplTest {

    @Autowired
    private CustomerService customerService;

    @Test
    public void getCustomerPageAll(){
        List<Customer> customers = customerService.getCustomerPageAll(1,2);
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }

    @Test
    public void getCustomerAll() {
        List<Customer> customers = customerService.getCustomerAll();
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }

    @Test
    public void getCustomerById() {
        Customer customer = customerService.getCustomerById(3);
        System.out.println(customer);
    }

    @Test
    public void loginVerification(){
        Customer customer = new Customer("test2","123");
        System.out.println(customerService.loginVerification(customer));
    }

    @Test
    public void insertCustomer() {
        Customer customer = new Customer();
        customer.setCustomerUsername("test4");
        customer.setCustomerName("李四");
        customer.setCustomerPassword("123");
        customer.setCustomerGender("男");
        customer.setCustomerPhone("12377463382");
        customer.setCustomerIdcard("273648229392830098");
        customer.setCustomerAdress("广东省珠海市");
        customer.setCustomerEmail("287639876@qq.com");
        customerService.insertCustomer(customer);
    }

    @Test
    public void deleteCustomerById() {
        customerService.deleteCustomerById(3);
    }

    @Test
    public void updateCustomer() {
        Customer customer = new Customer
                (1, "test2","张三","123",
                        "男","12377463382",
                        "273648229392830098",
                        "广东省珠海市","287639876@qq.com");
        customerService.updateCustomer(customer);
    }

    @Test
    public void getCustomerCount() {
        System.out.println(customerService.getCustomerCount());
    }
}