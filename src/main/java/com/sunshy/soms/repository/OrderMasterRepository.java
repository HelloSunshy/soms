package com.sunshy.soms.repository;

import com.sunshy.soms.pojo.OrderMaster;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   16:48
 */
public interface OrderMasterRepository extends JpaRepository<OrderMaster,String> {

    List<OrderMaster> findByUserId(String id);

    Page<OrderMaster> findByUserId(String id, Pageable pageable);

    Page<OrderMaster> findByUserIdAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc(String id, Pageable pageable,Integer statue,Integer statue2);

    Page<OrderMaster> findByUserIdAndOrderStatusOrderByUpdateTimeDesc(String id, Pageable pageable,Integer statue);


    Page<OrderMaster> findByDoctorIdAndAndOrderStatusOrderByCreateTimeDesc(String id,Integer statue,Pageable pageable);


    Page<OrderMaster> findByOrderStatusOrderByCreateTimeDesc(Integer statue,Pageable pageable);


    List<OrderMaster> findByUserIdAndPayStatus(String userId,Integer status);


    List<OrderMaster> findByOrderStatusOrderByCreateTimeDesc(Integer statue);

    Page<OrderMaster> findByOrderStatusToupOrOrderStatusToupOrOrderStatusToupOrderByUpdateTimeDesc(Integer statue, Integer statue2,Integer statue3,Pageable pageable);


    List<OrderMaster> findByUserIdAndOrderStatusOrOrderStatus(String userId,Integer statue,Integer statue1);


//    Page<OrderMaster> findAllOrderByCreateTimeDesc(Pageable pageable);

}
