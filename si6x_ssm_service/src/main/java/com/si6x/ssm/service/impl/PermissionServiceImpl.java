package com.si6x.ssm.service.impl;

import com.si6x.ssm.mapper.PermissionMapper;
import com.si6x.ssm.pojo.Permission;
import com.si6x.ssm.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Si6x
 * 资源权限
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    private PermissionMapper permissionMapper;

    @Autowired
    public void setPermissionMapper(PermissionMapper permissionMapper) {
        this.permissionMapper = permissionMapper;
    }


    /**
     * 添加资源权限
     * @param permission
     * @throws Exception
     */
    @Override
    public void savePermission(Permission permission) throws Exception {
        permissionMapper.savePermission(permission);
    }

    /**
     * 查询所有资源权限
     * @return
     * @throws Exception
     */
    @Override
    public List<Permission> findAllPermission() throws Exception {
        return permissionMapper.findAllPermission();
    }

    /**
     * 删除资源权限
     * @param permissionId
     * @throws Exception
     */
    @Override
    public void deletePermissionById(String permissionId) throws Exception {
        permissionMapper.deletePermissionById(permissionId);
    }
}
