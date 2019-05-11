package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.DrugCategory;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:50
 */
public interface DrugCategoryRespority extends JpaRepository<DrugCategory,String> {
}
