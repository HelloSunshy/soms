package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.UserInfo;
import com.sunshy.soms.repository.UserInfoRepository;
import com.sunshy.soms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:01
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserInfoRepository usersRepository;


    /**
     *
     * @param username：账号
     * @param password：密码
     * @return
     */
    @Override
    public UserInfo userLogin(String username, String password) {

        UserInfo user = usersRepository.findByUserUsernameAndUserPassword(username,password);

        return user;
    }


    @Override
    public UserInfo findOneUser(String id) {

        UserInfo users = usersRepository.findOne(id);

        return users;
    }

    @Override
    public UserInfo save(UserInfo userInfo) {

        UserInfo save = usersRepository.save(userInfo);

        return save;
    }


    @Override
    public List<UserInfo> findAll() {

        List<UserInfo> all = usersRepository.findAll();

        return all;
    }

    @Override
    public Page<UserInfo> findAll(Pageable pageable) {

        Page<UserInfo> all = usersRepository.findAll(pageable);

        return all;
    }

    @Override
    public void deleteUserId(String id) {

        usersRepository.delete(id);

    }

    @Override
    public Page<UserInfo> findByUserStatue(Integer statue, Pageable pageable) {

        Page<UserInfo> byUserStatue = usersRepository.findByUserStatue(statue, pageable);

        return byUserStatue;
    }

    @Override
    public UserInfo findByUserUsername(String username) {

        UserInfo byUserUsername = usersRepository.findByUserUsername(username);

        return byUserUsername;
    }
}
