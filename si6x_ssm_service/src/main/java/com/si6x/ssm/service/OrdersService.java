package com.si6x.ssm.service;

import com.si6x.ssm.pojo.Orders;

import java.util.List;

/**
 * @author Si6x
 */
public interface OrdersService {

    /**
     * 查询所有订单信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    public List<Orders> findAllOrders(Integer page,Integer size) throws Exception;

    /**
     * 查询订单详情
     * @param ordersId
     * @return
     * @throws Exception
     */
    public Orders findByIdOrders(String ordersId) throws Exception;
}
