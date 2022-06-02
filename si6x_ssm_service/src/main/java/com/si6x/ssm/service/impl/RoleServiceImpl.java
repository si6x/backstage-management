package com.si6x.ssm.service.impl;

import com.si6x.ssm.mapper.RoleMapper;
import com.si6x.ssm.pojo.Role;
import com.si6x.ssm.service.RoleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Si6x
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    private RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    /**
     * 前往添加权限页面,然后查询出该用户未拥有的权限并选择添加
     * @param roleId
     * @return
     * @throws Exception
     */
    @Override
    public Role findRoleByIdAndAllPermission(String roleId) throws Exception {
        return roleMapper.findRoleByIdAndAllPermission(roleId);
    }

    /**
     * 删除角色
     * @param roleId
     * @throws Exception
     */
    @Override
    public void deleteRoleById(String roleId) throws Exception {
        roleMapper.deleteRoleById(roleId);
    }

    /**
     * 根据id查询角色详情
     * @param roleId
     * @return
     * @throws Exception
     */
    @Override
    public Role findByRoleId(String roleId) throws Exception {
        return roleMapper.findByRoleId(roleId);
    }

    /**
     * 添加角色
     * @param role
     * @throws Exception
     */
    @Override
    public void saveRole(Role role) throws Exception {
        roleMapper.saveRole(role);
    }

    /**
     * 添加数据在角色和权限关联表
     * @param roleId
     * @param permissionIds
     * @throws Exception
     */
    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) throws Exception {
        for (String permissionId : permissionIds) {
            roleMapper.addPermissionToRole(roleId, permissionId);
        }

    }

    /**
     * 查询所有角色
     * @return
     * @throws Exception
     */
    @Override
    public List<Role> findAllRole() throws Exception {
        return roleMapper.findAllRole();
    }


}
