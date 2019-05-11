package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.DrugCategory;
import com.sunshy.soms.repository.DrugCategoryRespority;
import com.sunshy.soms.service.DrugCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   17:34
 */
@Service
public class DrugCategoryImpl implements DrugCategoryService {


    @Autowired
   private DrugCategoryRespority drugCategoryRespority;

    @Override
    public List<DrugCategory> findAll() {

        List<DrugCategory> all = drugCategoryRespority.findAll();

        return all;
    }
}
