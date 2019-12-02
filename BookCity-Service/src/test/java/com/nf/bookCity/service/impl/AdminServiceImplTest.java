package com.nf.bookCity.service.impl;

import com.nf.bookCity.config.AppConfig;
import com.nf.bookCity.entity.Admin;
import com.nf.bookCity.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class AdminServiceImplTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void getAdminPageAll() {
        List<Admin> admins = adminService.getAdminPageAll(1,2);
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }

    @Test
    public void getAdminAll() {
        List<Admin> admins = adminService.getAdminAll();
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }

    @Test
    public void getAdminById() {
        Admin admin = adminService.getAdminById(1);
        System.out.println(admin);
    }

    @Test
    public void insertAdmin() {
        Admin admin = new Admin("admin1","123","43273688739987");
        adminService.insertAdmin(admin);
    }

    @Test
    public void deleteAdminById() {
        adminService.deleteAdminById(3);
    }

    @Test
    public void updateAdmin() {
        Admin admin = new Admin(3,"admin3","123","43273688739987");
        adminService.updateAdmin(admin);
    }

    @Test
    public void getAdminCount() {
        System.out.println(adminService.getAdminCount());
    }
}