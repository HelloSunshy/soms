package com.sunshy.soms.service;

import com.sunshy.soms.pojo.OrderDetail;

import java.util.List;

/**
 * Demo Class
 *
 * @author sunshy
 * @date 2019-04-15   11:08
 */
public interface OrderDetailService {


    OrderDetail createOrderDetail(OrderDetail orderDetail);


    List<OrderDetail> findByOrderMasterId(String orderMasterId);

}
