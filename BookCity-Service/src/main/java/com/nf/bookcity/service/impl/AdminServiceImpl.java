package com.nf.bookcity.service.impl;

import com.nf.bookcity.dao.AdminDao;
import com.nf.bookcity.entity.Admin;
import com.nf.bookcity.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Admin> getAdminPageAll(int pageNum, int pageSize) {
        return adminDao.getAdminPageAll(pageNum,pageSize);
    }

    @Override
    public List<Admin> getAdminAll() {
        return adminDao.getAdminAll();
    }

    @Override
    public Admin getAdminById(int adminId) {
        return adminDao.getAdminById(adminId);
    }

    @Override
    public boolean insertAdmin(Admin admin) {
        return adminDao.insertAdmin(admin) > 0 ? true : false;
    }

    @Override
    public boolean deleteAdminById(int adminId) {
        return adminDao.deleteAdminById(adminId) > 0 ? true : false;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin) > 0 ? true : false;
    }

    @Override
    public int getAdminCount() {
        return adminDao.getAdminCount();
    }
}
