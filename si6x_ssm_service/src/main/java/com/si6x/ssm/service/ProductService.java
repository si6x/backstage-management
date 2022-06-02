package com.si6x.ssm.service;

import com.si6x.ssm.pojo.Product;

import java.util.List;

/**
 * @author Si6x
 */
public interface ProductService {
    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    public void saveProduct(Product product) throws Exception;

    /**
     * 查询所有的产品信息
     * @return
     * @throws Exception
     */
    public List<Product> findAllProduct() throws Exception;
}
