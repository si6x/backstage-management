package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.Role;
import com.si6x.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Si6x
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    private RoleService roleService;

    @Autowired
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    /**
     * 添加数据在角色和权限关联表
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermissionToRole")
    public String addPermissionToRole(@RequestParam("roleId") String roleId, @RequestParam("permissionId") String[] permissionIds) throws Exception{
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAllRole";
    }

    /**
     * 前往添加权限页面,然后查询出该用户未拥有的权限并选择添加
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRoleByIdAndAllPermission")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam("roleId") String roleId) throws Exception{
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findRoleByIdAndAllPermission(roleId);
        mv.addObject("role",role);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 删除角色
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteRoleById")
    public String deleteRoleById(@RequestParam("roleId") String roleId) throws Exception{
        roleService.deleteRoleById(roleId);
        return "redirect:findAllRole";
    }

    /**
     * 根据Id查询角色详情
     * @return
     * @throws Exception
     */
    @RequestMapping("/findByRoleId")
    public ModelAndView findByRoleId(@RequestParam("roleId") String roleId) throws Exception{
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findByRoleId(roleId);
        mv.addObject("role",role);
        mv.setViewName("role-show");

        return mv;
    }

    /**
     * 添加角色
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveRole")
    public String saveRole(Role role) throws Exception{
        roleService.saveRole(role);
        return "redirect:findAllRole";
    }

    /**
     * 查询所有角色
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllRole")
    public ModelAndView findAllRole() throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAllRole();
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }
}
