package com.sunshy.soms.service;

import com.sunshy.soms.pojo.DrugInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   17:41
 */
public interface DrugInfoService {


    List<DrugInfo> findAllByCategoryId(String categoryId);

    DrugInfo findByName(String name);

    Page<DrugInfo> findAllOrderByUpdateTimeDesc(Pageable pageable);

    Page<DrugInfo> findAll(Pageable pageable);

    List<DrugInfo> findByDrugInfoTypeAndDrugInfoStatue(String id,Integer statue);

    DrugInfo findById(String id);


    DrugInfo createOrSave(DrugInfo drugInfo);




}
