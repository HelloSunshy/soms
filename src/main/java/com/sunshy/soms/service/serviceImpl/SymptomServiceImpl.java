package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.Symptom;
import com.sunshy.soms.repository.SymptomRespority;
import com.sunshy.soms.service.SymptomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-22   20:36
 */
@Service
public class SymptomServiceImpl implements SymptomService {

    @Autowired
    private SymptomRespority symptomRespority;

    @Override
    public List<Symptom> findALl() {


        return symptomRespority.findAll();
    }
}
