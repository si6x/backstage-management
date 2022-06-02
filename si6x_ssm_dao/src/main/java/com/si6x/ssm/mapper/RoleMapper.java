package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Si6x
 * 角色表
 */
public interface RoleMapper {


    /**
     * 前往添加角色页面,并查询出该用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.role where id not in(select roleId from ssm.users_role where userId = #{userId})")
    List<Role> findUserByIdAndAllRole(String userId) throws Exception;

    /**
     * 前往添加权限页面,然后查询出该用户未拥有的权限并选择添加
     * @param roleId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.role where id = #{roleId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",many = @Many(select = "com.si6x.ssm.mapper.PermissionMapper.goAddPermission"))
    })
    Role findRoleByIdAndAllPermission(String roleId) throws Exception;

    /**
     * 根据用户id查询出所有对应的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.role where id in(select roleId from users_role where userId = #{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.si6x.ssm.mapper.PermissionMapper.findPermissionByRoleId")),
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;


    /**
     * 查询所有角色
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.role")
    public List<Role> findAllRole() throws Exception;

    /**
     * 添加角色
     * @param role
     * @throws Exception
     */
    @Insert("insert into ssm.role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void saveRole(Role role) throws Exception;

    /**
     * 删除角色
     * @param roleId
     * @throws Exception
     */
    @Delete("delete from ssm.role where id = #{roleId}")
    void deleteRoleById(String roleId) throws Exception;

    /**
     * 根据id查询角色详情
     * @param roleId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.role where id = #{roleId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",many = @Many(select = "com.si6x.ssm.mapper.PermissionMapper.findPermissionByRoleId"))
    })
    Role findByRoleId(String roleId) throws Exception;


    /**
     * 添加数据在角色和权限关联表
     * @param roleId
     * @param permissionId
     * @throws Exception
     */
    @Insert("insert into ssm.role_permission(permissionId,roleId) values(#{permissionId},#{roleId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId")String permissionId) throws Exception;
}
