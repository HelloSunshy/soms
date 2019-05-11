package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.DrugInfo;
import com.sunshy.soms.repository.DrugInfoRespority;
import com.sunshy.soms.service.DrugInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   17:42
 */
@Service
public class DrugInfoServiceImpl implements DrugInfoService {


    @Autowired
    private DrugInfoRespority drugInfoRespority;

    @Override
    public List<DrugInfo> findAllByCategoryId(String categoryId) {

        List<DrugInfo> byDrugInfoType = drugInfoRespority.findByDrugInfoType(categoryId);

        return byDrugInfoType;
    }

    @Override
    public DrugInfo findByName(String name) {

        DrugInfo byDrugInfoName = drugInfoRespority.findByDrugInfoName(name);

        return byDrugInfoName;
    }

    @Override
    public Page<DrugInfo> findAllOrderByUpdateTimeDesc(Pageable pageable) {

        Page<DrugInfo> all = drugInfoRespority.findAll(pageable);

        return all;
    }

    @Override
    public List<DrugInfo> findByDrugInfoTypeAndDrugInfoStatue(String id, Integer statue) {

        List<DrugInfo> byDrugInfoTypeAndDrugInfoStatue = drugInfoRespority.findByDrugInfoTypeAndDrugInfoStatue(id, statue);

        return byDrugInfoTypeAndDrugInfoStatue;
    }

    @Override
    public DrugInfo findById(String id) {

        DrugInfo one = drugInfoRespority.findOne(id);

        return one;

    }

    @Override
    public DrugInfo createOrSave(DrugInfo drugInfo) {

        DrugInfo save = drugInfoRespority.save(drugInfo);

        return save;
    }

    @Override
    public Page<DrugInfo> findAll(Pageable pageable) {

        Page<DrugInfo> all = drugInfoRespority.findAll(pageable);

        return all;
    }
}
