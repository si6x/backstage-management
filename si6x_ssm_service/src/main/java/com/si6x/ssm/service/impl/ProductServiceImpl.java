package com.si6x.ssm.service.impl;

import com.si6x.ssm.mapper.ProductMapper;
import com.si6x.ssm.pojo.Product;
import com.si6x.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Si6x
 */

@Service
public class ProductServiceImpl implements ProductService {

    private ProductMapper productMapper;

    @Autowired
    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    @Override
    public void saveProduct(Product product) throws Exception{
        productMapper.saveProduct(product);
    }

    /**
     * 查询所有的产品信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Product> findAllProduct() throws Exception {
        return productMapper.findAllProduct();
    }
}
