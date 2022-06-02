package com.si6x.ssm.service;

import com.si6x.ssm.pojo.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author Si6x
 */
public interface UserService extends UserDetailsService {

    /**
     * 添加用户
     * @param userInfo
     * @throws Exception
     */
    public void saveUserInfo(UserInfo userInfo) throws Exception;


    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    public List<UserInfo> findAllUserInfo() throws Exception;


    /**
     * 根据id查询用户详情
     * @param userId
     * @return
     * @throws Exception
     */
    public UserInfo findByUserId(String userId) throws Exception;

    /**
     * 前往添加角色页面,并查询出该用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    UserInfo findUserByIdAndAllRole(String userId) throws Exception;

    /**
     * 添加数据在用户和角色关联表
     * @param userId
     * @param roleIds
     * @throws Exception
     */
    void addRoleToUser(String userId, String[] roleIds) throws Exception;
}
