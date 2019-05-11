package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.Admin;
import com.sunshy.soms.repository.AdminRespority;
import com.sunshy.soms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:54
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRespority adminRespority;


    @Override
    public Admin login(String username, String password) {

        Admin byAdminUsername = adminRespority.findByAdminUsername(username);

        return byAdminUsername;
    }

    @Override
    public Admin findById(Integer id) {

        Admin byId = adminRespority.findById(id);

        return byId;
    }
}
