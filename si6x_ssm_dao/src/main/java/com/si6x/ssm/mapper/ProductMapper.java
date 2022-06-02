package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Si6x
 * 产品
 */
@Repository
public interface ProductMapper {

    /**
     * 根据id查询产品
     * @param productId
     * @return
     * @throws Exception
     */
    @Select("select * from product where id = #{productId}")
    public Product findByIdProduct(String productId) throws Exception;

    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    @Insert("insert into ssm.product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus)" +
            " values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    public void saveProduct(Product product) throws Exception;

    /**
     * 查询所有的产品信息
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.product")
    public List<Product> findAllProduct() throws Exception;


}
