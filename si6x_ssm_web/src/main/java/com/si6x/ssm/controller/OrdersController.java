package com.si6x.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.si6x.ssm.pojo.Orders;
import com.si6x.ssm.service.OrdersService;
import com.si6x.ssm.service.impl.OrdersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Si6x
 */
@Controller
@RequestMapping("/orders")
@Secured(value = {"ROLE_USER","ROLE_ADMIN"})
public class OrdersController {
    private OrdersService ordersService;

    @Autowired
    public void setOrdersService(OrdersService ordersService) {
        this.ordersService = ordersService;
    }

    /*//查询全部订单--未分页
    @RequestMapping("/findAllOrders")
    public ModelAndView findAllOrders() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Orders> ordersList = ordersService.findAllOrders();
        mv.addObject("ordersList",ordersList);
        mv.setViewName("orders-list");
        return mv;
    }*/

    /**
     * 查询全部订单
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllOrders")
    public ModelAndView findAllOrders(@RequestParam(name = "page",defaultValue = "1") Integer page,@RequestParam(name = "size",defaultValue = "4") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Orders> ordersList = ordersService.findAllOrders(page, size);
        //PageInfo就是一个分页Beam
        PageInfo pageInfo = new PageInfo(ordersList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orders-page-list");
        return mv;
    }

    /**
     * 查询订单详情
     * @return
     * @throws Exception
     */
    @RequestMapping("/findByIdOrders")
    public ModelAndView findByIdOrders(@RequestParam(name = "id",required = true) String ordersId) throws Exception{
        ModelAndView mv = new ModelAndView();
        Orders order = ordersService.findByIdOrders(ordersId);
        mv.addObject("orders",order);
        mv.setViewName("orders-show");
        return mv;
    }
}
