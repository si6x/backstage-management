package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.Product;
import com.si6x.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @author Si6x
 */
@Controller
@RequestMapping("/product")
@RolesAllowed(value = {"ROLE_USER","ROLE_ADMIN"})
public class ProductController {

    private ProductService productService;

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }


    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    @RequestMapping("/saveProduct")
    public String saveProduct(Product product) throws Exception{
        productService.saveProduct(product);
        return "redirect:findAllProduct";
    }

    /**
     * 查询全部产品信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllProduct")

    public ModelAndView findAllProduct() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> ps = productService.findAllProduct();
        mv.addObject("productList",ps);
        mv.setViewName("product-list1");
        return mv;
    }




}
