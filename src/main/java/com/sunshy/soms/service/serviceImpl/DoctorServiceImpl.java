package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.DoctorInfo;
import com.sunshy.soms.repository.DoctorRespority;
import com.sunshy.soms.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:28
 */
@Service
public class DoctorServiceImpl implements DoctorService {


    @Autowired
    private DoctorRespority doctorRespority;


    @Override
    public DoctorInfo doctorLogin(String username, String password) {


        DoctorInfo doctor = doctorRespority.findByDoctorUsernameAndDoctorPassword(username,password);

        return doctor;
    }


    @Override
    public DoctorInfo findById(String id) {

        DoctorInfo byDoctorId = doctorRespority.findByDoctorId(id);

        return byDoctorId;
    }

    @Override
    public Page<DoctorInfo> findAll(Pageable pageable) {

        Page<DoctorInfo> all = doctorRespority.findAll(pageable);

        return all;
    }

    @Override
    public void delete(String doctorId) {

        doctorRespority.delete(doctorId);

    }

    @Override
    public List<DoctorInfo> findAll() {

        List<DoctorInfo> all = doctorRespority.findAll();

        return all ;
    }

    @Override
    public DoctorInfo save(DoctorInfo doctorInfo) {

        DoctorInfo save = doctorRespority.save(doctorInfo);

        return save;
    }

    @Override
    public DoctorInfo findByDoctorUsername(String username) {

        DoctorInfo byDoctorUsername = doctorRespority.findByDoctorUsername(username);

        return byDoctorUsername;
    }
}
