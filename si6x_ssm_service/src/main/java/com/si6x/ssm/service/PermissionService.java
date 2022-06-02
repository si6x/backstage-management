package com.si6x.ssm.service;

import com.si6x.ssm.pojo.Permission;

import java.util.List;

/**
 * @author Si6x
 * 资源权限
 */
public interface PermissionService {

    /**
     * 添加资源权限
     * @param permission
     * @throws Exception
     */
    void savePermission(Permission permission) throws Exception;

    /**
     * 查询所有资源权限
     * @return
     * @throws Exception
     */
    public List<Permission> findAllPermission() throws Exception;


    /**
     * 删除资源权限
     * @param permissionId
     * @throws Exception
     */
    void deletePermissionById(String permissionId) throws Exception;
}
