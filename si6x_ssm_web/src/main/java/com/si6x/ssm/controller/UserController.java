package com.si6x.ssm.controller;

import com.si6x.ssm.pojo.UserInfo;
import com.si6x.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Si6x
 */
@Controller
@RequestMapping("/user")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 添加数据在用户和角色关联表
     * @param userId
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRoleToUser")
    public String addRoleToUser(@RequestParam("userId") String userId,@RequestParam("roleId") String[] roleIds) throws Exception{
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAllUserInfo";
    }

    /**
     * 前往添加角色页面,并查询出该用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserByIdAndAllRole")
    public ModelAndView findUserByIdAndAllRole(@RequestParam("userId") String userId) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findUserByIdAndAllRole(userId);
        mv.addObject("user",userInfo);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 根据id查询用户详情
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findByUserId")
    public ModelAndView findByUserId(String userId) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findByUserId(userId);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 添加用户
     * @param userInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveUserInfo")
    @PreAuthorize("authentication.principal.username == 'admin'")
    public String saveUserInfo(UserInfo userInfo) throws Exception{
        userService.saveUserInfo(userInfo);
        return "redirect:findAllUserInfo";
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAllUserInfo")
    public ModelAndView findAllUserInfo() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userInfoList = userService.findAllUserInfo();
        mv.addObject("userList",userInfoList);
        mv.setViewName("user-list");
        return mv;
    }
}
