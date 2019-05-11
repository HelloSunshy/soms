package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.DrugInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:50
 */
public interface DrugInfoRespority extends JpaRepository<DrugInfo,String> {


    List<DrugInfo> findByDrugInfoType(String id);

    DrugInfo findByDrugInfoName(String name);

    List<DrugInfo> findByDrugInfoTypeAndDrugInfoStatue(String id, Integer statue);


//    @Query(value = "select  got* from    order by updatetime desc")
//    Page<DrugInfo> findAllOrderByUpdateTime(Pageable pageable);


}
