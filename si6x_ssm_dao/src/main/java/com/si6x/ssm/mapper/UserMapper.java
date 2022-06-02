package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Si6x
 * 用户表
 */
public interface UserMapper {

    /**
     * 根据用户名查询数据库的用户名,用户登录
     * @param username
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.users where username = #{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.si6x.ssm.mapper.RoleMapper.findRoleByUserId"))
    })
    public UserInfo findByUsernameUsers(String username) throws Exception;


    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.users")
    public List<UserInfo> findAllUserInfo() throws Exception;


    /**
     * 添加用户
     * @param userInfo
     * @throws Exception
     */
    @Insert("insert into ssm.users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    public void saveUserInfo(UserInfo userInfo) throws Exception;

    /**
     * 根据id查询用户详情
     * @param userId
     * @throws Exception
     * @return
     */
    @Select("select * from ssm.users where id = #{userId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.si6x.ssm.mapper.RoleMapper.findRoleByUserId")),
    })
    public UserInfo findByUserId(String userId) throws Exception;

    /**
     * 前往添加角色页面,并查询出该用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.users where id = #{userId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",many = @Many(select = "com.si6x.ssm.mapper.RoleMapper.findUserByIdAndAllRole"))
    })
    UserInfo findUserByIdAndAllRole(String userId) throws Exception;

    /**
     * 添加数据在用户和角色关联表
     * @param userId
     * @param roleId
     * @throws Exception
     */
    @Insert("insert into ssm.users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId) throws Exception;
}
