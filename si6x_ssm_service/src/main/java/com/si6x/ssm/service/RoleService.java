package com.si6x.ssm.service;

import com.si6x.ssm.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Si6x
 *
 */
public interface RoleService {

    /**
     * 前往添加权限页面,然后查询出该用户未拥有的权限并选择添加
     * @param roleId
     * @return
     * @throws Exception
     */
    Role findRoleByIdAndAllPermission(String roleId) throws Exception;

    /**
     * 删除角色
     * @param roleId
     * @throws Exception
     */
    void deleteRoleById(String roleId) throws Exception;

    /**
     * 根据id查询角色详情
     * @param roleId
     * @return
     * @throws Exception
     */
    Role findByRoleId(String roleId) throws Exception;

    /**
     * 查询所有角色
     * @return
     * @throws Exception
     */
    public List<Role> findAllRole() throws Exception;

    /**
     * 添加角色
     * @param role
     * @throws Exception
     */
    void saveRole(Role role) throws Exception;


    /**
     * 添加数据在角色和权限关联表
     * @param roleId
     * @param permissionIds
     * @throws Exception
     */
    void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;
}
