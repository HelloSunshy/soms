package com.sunshy.soms.controller;

import com.sunshy.soms.pojo.UserInfo;
import com.sunshy.soms.repository.UserInfoRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-11   09:38
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserControllerTest {

    @Autowired
    private UserInfoRepository usersRepository;

    @Test
    public  void login(){

        UserInfo byUserName = usersRepository.findByUserUsernameAndUserPassword("111","111");



    }

}