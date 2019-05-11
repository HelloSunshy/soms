package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.DoctorInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:52
 */
public interface DoctorRespority extends JpaRepository<DoctorInfo,String> {

    DoctorInfo findByDoctorUsernameAndDoctorPassword(String username, String password);

    DoctorInfo findByDoctorId(String id);

    DoctorInfo findByDoctorUsername(String username);






}
