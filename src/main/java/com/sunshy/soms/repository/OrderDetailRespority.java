package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:49
 */
public interface OrderDetailRespority extends JpaRepository<OrderDetail,String> {


    List<OrderDetail> findByOrderMasterId(String orderMasterId);


}
