package com.sunshy.soms.service;

import com.sunshy.soms.pojo.OrderMaster;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:33
 */
public interface OrderMasterService {

    List<OrderMaster> findAll();

    OrderMaster findById(String id);

    OrderMaster createOrderMaster(OrderMaster orderMaster);

    List<OrderMaster> findByUserId(String id);

    Page<OrderMaster> findAllByPage(String id,Pageable pageable);

    Page<OrderMaster> findByUserIdAndAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc(String id,Pageable pageable,Integer statue,Integer statue1);

    Page<OrderMaster> findByUserIdAndOrderStatusOrderByUpdateTimeDesc(String id,Pageable pageable,Integer statue);


    Page<OrderMaster> findByDoctorIdAndAndOrderStatus(String id,Integer statue,Pageable pageable);


    Page<OrderMaster> findByOrderStatus(Integer statue,Pageable pageable);

    Page<OrderMaster> findByOrderStatusToupOrOrderStatusToupOOrOrderStatusToupOrderByUpdateTime(Integer statue,Integer statue2, Integer statue3, Pageable pageable);

    List<OrderMaster> findByUserIdAndPayStatus(String userId,Integer statue);

    List<OrderMaster> findByUserIdAndOrderStatusOrOrderStatus(String userId,Integer statue,Integer statue1);

    List<OrderMaster> findByOrderStatus(Integer statue);

    void delete(String orderMaserId);


    Page<OrderMaster> findAllOrOrderByUpdateTime(Pageable pageable);






}
