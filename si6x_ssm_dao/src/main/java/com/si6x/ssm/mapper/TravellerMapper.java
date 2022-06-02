package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Si6x
 * 旅客信息
 */
public interface TravellerMapper {

    /**
     * 根据订单表的ID查询到旅客的信息
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Select("select * from traveller where id in(select travellerId from order_traveller where orderId = #{ordersId})")
    public List<Traveller> findByOrdersId(String ordersId) throws Exception;
}
