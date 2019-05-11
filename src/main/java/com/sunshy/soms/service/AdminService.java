package com.sunshy.soms.service;

import com.sunshy.soms.pojo.Admin;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:52
 */
public interface AdminService {


    /**
     * 管理员登陆
     * @param username：用户名
     * @param password：密码
     * @return
     */
   Admin login(String username, String password);


   Admin findById(Integer id);

}
