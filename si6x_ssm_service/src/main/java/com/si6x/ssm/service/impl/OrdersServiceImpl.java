package com.si6x.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.si6x.ssm.mapper.OrdersMapper;
import com.si6x.ssm.pojo.Orders;
import com.si6x.ssm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Si6x
 */
@Service
public class OrdersServiceImpl implements OrdersService {
    
    private OrdersMapper ordersMapper;

    @Autowired
    public void setOrdersMapper(OrdersMapper ordersMapper) {
        this.ordersMapper = ordersMapper;
    }

    /**
     * 查询所有订单信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @Override
    public List<Orders> findAllOrders(Integer page,Integer size) throws Exception {
        //参数pageNum是页码值,参数pageSize代表是每页显示条数
        PageHelper.startPage(page,size);
        return ordersMapper.findAllOrders();
    }

    /**
     * 查询订单详情
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Override
    public Orders findByIdOrders(String ordersId) throws Exception {
        return ordersMapper.findByIdOrders(ordersId);
    }
}
