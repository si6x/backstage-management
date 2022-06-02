package com.si6x.ssm.mapper;

import com.si6x.ssm.pojo.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Si6x
 * 资源权限表
 */
public interface PermissionMapper {

    /**
     * 前往添加权限页面,然后查询出该用户未拥有的权限并选择添加
     * @param roleId
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.permission where id not in(select permissionId from ssm.role_permission where roleId = #{roleId})")
    List<Permission> goAddPermission(String roleId) throws Exception;

    /**
     * 根据角色Id查询出相应的资源权限
     * @param roleId
     * @throws Exception
     * @return
     */
    @Select("select * from ssm.permission where id in(select permissionId from ssm.role_permission where roleId = #{roleId})")
    public List<Permission> findPermissionByRoleId(String roleId) throws Exception;


    /**
     * 查询所有资源权限
     * @return
     * @throws Exception
     */
    @Select("select * from ssm.permission")
    List<Permission> findAllPermission() throws Exception;


    /**
     * 添加资源权限
     * @param permission
     * @throws Exception
     */
    @Insert("insert into ssm.permission(permissionName,url) values(#{permissionName},#{url})")
    void savePermission(Permission permission) throws Exception;


    /**
     * 删除资源权限
     * @param permissionId
     * @throws Exception
     */
    @Delete("delete from ssm.permission where id = #{permissionId}")
    void deletePermissionById(String permissionId) throws Exception;
}