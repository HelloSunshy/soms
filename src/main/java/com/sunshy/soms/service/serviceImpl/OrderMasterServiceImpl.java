package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.OrderMaster;
import com.sunshy.soms.repository.OrderMasterRepository;
import com.sunshy.soms.service.OrderMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-10   17:33
 */
@Service
public class OrderMasterServiceImpl implements OrderMasterService {

    @Autowired
    private OrderMasterRepository orderMasterRepository;


    @Override
    public List<OrderMaster> findAll() {

        List<OrderMaster> allOrdermaseter = orderMasterRepository.findAll();

        return allOrdermaseter;
    }



    @Override
    public OrderMaster findById(String id) {

        OrderMaster master = orderMasterRepository.findOne(id);

        return master;
    }


    @Override
    public OrderMaster createOrderMaster(OrderMaster orderMaster) {

        OrderMaster save = orderMasterRepository.save(orderMaster);

        return save;
    }

    @Override
    public List<OrderMaster> findByUserId(String id) {

        List<OrderMaster> byUserId = orderMasterRepository.findByUserId(id);


        return byUserId;
    }

    @Override
    public Page<OrderMaster> findAllByPage(String id,Pageable pageable) {

        Page<OrderMaster> all = orderMasterRepository.findByUserId(id,pageable);

        return all;
    }

    @Override
    public Page<OrderMaster> findByDoctorIdAndAndOrderStatus(String id, Integer statue, Pageable pageable) {

        Page<OrderMaster> byDoctorIdAndAndOrderStatus = orderMasterRepository.findByDoctorIdAndAndOrderStatusOrderByCreateTimeDesc(id, statue, pageable);

        return byDoctorIdAndAndOrderStatus;
    }


    @Override
    public List<OrderMaster> findByUserIdAndPayStatus(String userId, Integer statue) {


        List<OrderMaster> byUserIdAndPayStatus = orderMasterRepository.findByUserIdAndPayStatus(userId, statue);


        return byUserIdAndPayStatus;
    }

    @Override
    public List<OrderMaster> findByOrderStatus(Integer statue) {

        List<OrderMaster> byOrderStatus = orderMasterRepository.findByOrderStatusOrderByCreateTimeDesc(statue);

        return byOrderStatus;
    }


    @Override
    public Page<OrderMaster> findByOrderStatus(Integer statue, Pageable pageable) {

        Page<OrderMaster> byOrderStatus = orderMasterRepository.findByOrderStatusOrderByCreateTimeDesc(statue, pageable);

        return byOrderStatus;
    }

    @Override
    public Page<OrderMaster> findByUserIdAndAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc(String id, Pageable pageable, Integer statue,Integer statue1) {

        Page<OrderMaster> byUserIdAndAndOrderStatus = orderMasterRepository.findByUserIdAndOrderStatusOrOrderStatusOrderByUpdateTimeDesc(id, pageable, statue,statue1);

        return byUserIdAndAndOrderStatus;
    }


    @Override
    public Page<OrderMaster> findByUserIdAndOrderStatusOrderByUpdateTimeDesc(String id, Pageable pageable, Integer statue) {

        Page<OrderMaster> byUserIdAndOrderStatusOrderByUpdateTimeDesc = orderMasterRepository.findByUserIdAndOrderStatusOrderByUpdateTimeDesc(id, pageable, statue);

        return byUserIdAndOrderStatusOrderByUpdateTimeDesc;

    }

    @Override
    public void delete(String orderMaserId) {

        orderMasterRepository.delete(orderMaserId);

    }



    @Override
    public List<OrderMaster> findByUserIdAndOrderStatusOrOrderStatus(String userId, Integer statue, Integer statue1) {
        return
                orderMasterRepository.findByUserIdAndOrderStatusOrOrderStatus(userId,statue,statue1);
    }

    @Override
    public Page<OrderMaster> findByOrderStatusToupOrOrderStatusToupOOrOrderStatusToupOrderByUpdateTime(Integer statue, Integer statue2, Integer statue3, Pageable pageable) {

        Page<OrderMaster> byOrderStatusToupOrOrderStatusToup = orderMasterRepository.findByOrderStatusToupOrOrderStatusToupOrOrderStatusToupOrderByUpdateTimeDesc(statue, statue2, statue3, pageable);

        return byOrderStatusToupOrOrderStatusToup;
    }

    @Override
    public Page<OrderMaster> findAllOrOrderByUpdateTime(Pageable pageable) {

//        Page<OrderMaster> allOrOrderByUpdateTime = orderMasterRepository.findAllOrderByCreateTimeDesc(pageable);

        return null;
    }
}
