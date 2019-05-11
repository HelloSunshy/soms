package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.Admin;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:47
 */
public interface AdminRespority extends JpaRepository<Admin,Integer> {

    /**
     * 根据用户名查找用户
     * @param username：用户名
     * @return
     */
    Admin findByAdminUsername(String username);


    Admin findById(Integer id);





}
