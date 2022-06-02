package com.si6x.ssm.service.impl;

import com.si6x.ssm.mapper.UserMapper;
import com.si6x.ssm.pojo.Role;
import com.si6x.ssm.pojo.UserInfo;
import com.si6x.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Si6x
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 根据id查询用户详情
     * @param userId
     * @return
     * @throws Exception
     */
    @Override
    public UserInfo findByUserId(String userId) throws Exception {
        return userMapper.findByUserId(userId);
    }

    /**
     * 前往添加角色页面,并查询出该用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @Override
    public UserInfo findUserByIdAndAllRole(String userId) throws Exception {
        return userMapper.findUserByIdAndAllRole(userId);
    }

    /**
     * 添加数据在用户和角色关联表
     * @param userId
     * @param roleIds
     * @throws Exception
     */
    @Override
    public void addRoleToUser(String userId, String[] roleIds) throws Exception {
        for (String roleId: roleIds) {
            userMapper.addRoleToUser(userId,roleId);
        }
    }

    /**
     * 添加用户
     * @param userInfo
     * @throws Exception
     */
    @Override
    public void saveUserInfo(UserInfo userInfo) throws Exception {
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userMapper.saveUserInfo(userInfo);
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @Override
    public List<UserInfo> findAllUserInfo() throws Exception{
        return userMapper.findAllUserInfo();
    }
    
    /**
     * 用户登录操作
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userMapper.findByUsernameUsers(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
//        User user = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),getAuthority(userInfo.getRoles()));
        User user = new User(userInfo.getUsername(),userInfo.getPassword(), userInfo.getStatus() != 0,true,true,true,getAuthority(userInfo.getRoles()));
        return user;
    }

    /**
     * 作用就是返回一个list集合,集合中装入的是角色描述
     * @param roles
     * @return
     */
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles){
            list.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return list;
    }




}
