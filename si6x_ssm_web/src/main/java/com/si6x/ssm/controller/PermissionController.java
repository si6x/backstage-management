package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.Permission;
import com.si6x.ssm.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Si6x
 * 资源权限
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {
    private PermissionService permissionService;

    @Autowired
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }


    /**
     * 删除资源权限
     * @param permissionId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deletePermissionById")
    public String deletePermissionById(@RequestParam("permissionId") String permissionId) throws Exception{
        permissionService.deletePermissionById(permissionId);
        return "redirect:findAllPermission";
    }

    /**
     * 添加资源权限
     * @param permission
     * @return
     * @throws Exception
     */
    @RequestMapping("/savePermission")
    public String savePermission(Permission permission) throws Exception{
        permissionService.savePermission(permission);
        return "redirect:findAllPermission";
    }

    /**
     * 查询所有资源权限
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllPermission")
    public ModelAndView findAllPermission() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Permission> permissionList = permissionService.findAllPermission();
        mv.addObject("permissionList",permissionList);
        mv.setViewName("permission-list");
        return mv;
    }
}
