package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.CustomerDao;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<Customer> getCustomerPageAll(int pageNum, int pageSize) {
        return customerDao.getCustomerPageAll(pageNum, pageSize);
    }

    @Override
    public List<Customer> getCustomerAll() {
        return customerDao.getCustomerAll();
    }

    @Override
    public Customer getCustomerById(int customerId) {
        return customerDao.getCustomerById(customerId);
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return customerDao.insertCustomer(customer) > 0 ? true : false;
    }

    @Override
    public boolean deleteCustomerById(int customerId) {
        return customerDao.deleteCustomerById(customerId) > 0 ? true : false;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer) > 0 ? true : false;
    }

    @Override
    public int getCustomerCount() {
        return customerDao.getCustomerCount();
    }

    @Override
    public Customer loginVerification(Customer customer) {
        return customerDao.loginVerification(customer);
    }
}
