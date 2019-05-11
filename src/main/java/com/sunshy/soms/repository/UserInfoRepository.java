package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.UserInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:46
 */
public interface UserInfoRepository extends JpaRepository<UserInfo,String> {

    /**
     * 根据用户名查找用户
     * @param username；用户名
     * @return：返回一个用户的对象
     */
    UserInfo findByUserUsernameAndUserPassword(String username,String password);


    Page<UserInfo> findByUserStatue(Integer statue, Pageable pageable);

    UserInfo findByUserUsername(String username);



}
