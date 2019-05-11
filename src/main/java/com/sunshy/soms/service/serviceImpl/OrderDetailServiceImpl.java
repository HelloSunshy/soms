package com.sunshy.soms.service.serviceImpl;

import com.sunshy.soms.pojo.OrderDetail;
import com.sunshy.soms.repository.OrderDetailRespority;
import com.sunshy.soms.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   11:09
 */

@Service
public class OrderDetailServiceImpl implements OrderDetailService {



    @Autowired
    private OrderDetailRespority orderDetailRespority;


    @Override
    public OrderDetail createOrderDetail(OrderDetail orderDetail) {

        OrderDetail save = orderDetailRespority.save(orderDetail);

        return save;
    }

    @Override
    public List<OrderDetail> findByOrderMasterId(String orderMasterId) {

        List<OrderDetail> byOrderMasterId = orderDetailRespority.findByOrderMasterId(orderMasterId);

        return byOrderMasterId;
    }
}
