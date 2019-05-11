package com.sunshy.soms.service;

import com.sunshy.soms.pojo.DoctorInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:26
 */
public interface DoctorService {


    DoctorInfo doctorLogin(String username, String password);

    DoctorInfo findById(String id);

    Page<DoctorInfo> findAll(Pageable pageable);

    List<DoctorInfo> findAll();

    void delete(String doctorId);

    DoctorInfo save(DoctorInfo doctorInfo);

    DoctorInfo findByDoctorUsername(String username);

}
