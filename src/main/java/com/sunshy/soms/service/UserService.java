package com.sunshy.soms.service;

import com.sunshy.soms.pojo.UserInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:58
 */
public interface UserService {

    /**
     * 用户登陆
     * @param username：账号
     * @param password：密码
     * @return Users：对象
     */
    UserInfo userLogin(String username, String password);


    UserInfo findOneUser(String id);

    UserInfo save(UserInfo userInfo);

    List<UserInfo> findAll();


    Page<UserInfo> findAll(Pageable pageable);

    void deleteUserId(String id);

    Page<UserInfo> findByUserStatue(Integer statue,Pageable pageable);

    UserInfo findByUserUsername(String username);




}
