package com.nf.bookcity.Interceptor;

import com.nf.bookcity.entity.Customer;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerLoginInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Customer customer = (Customer) request.getSession().getAttribute("Customer");
        if (customer == null){
            response.sendRedirect("/customer/login");
            return false;
        }
        return true;
    }
}
