package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Member;
import com.si6x.ssm.pojo.Orders;
import com.si6x.ssm.pojo.Product;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Si6x
 * 订单信息
 */
@Repository
public interface OrdersMapper {

    /**
     * 查询所有订单信息
     * @return
     * @throws Exception
     */
    @Select("select * from orders")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.si6x.ssm.mapper.ProductMapper.findByIdProduct"))

    })
    public List<Orders> findAllOrders() throws Exception;

    /**
     * 多表操作
     * 查询订单详情
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Select("select * from orders where id = #{ordersId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.si6x.ssm.mapper.ProductMapper.findByIdProduct")),
            @Result(property = "member",column = "memberId",javaType = Member.class,one = @One(select = "com.si6x.ssm.mapper.MemberMapper.findByIdMember")),
            @Result(property = "travellers",column = "id",javaType = java.util.List.class,many = @Many(select = "com.si6x.ssm.mapper.TravellerMapper.findByOrdersId"))

    })
    public Orders findByIdOrders(String ordersId) throws Exception;
}
