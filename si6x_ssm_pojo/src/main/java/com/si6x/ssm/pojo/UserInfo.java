package com.si6x.ssm.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * @author Si6x
 * 与数据库的users对应
 */
public class UserInfo implements Serializable {
    private String id;
    private String email;
    private String username;
    private String password;
    private String phoneNum;
    private Integer status;
    private String ststusStr;
    private List<Role> roles;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStstusStr() {
        if (status != null){
            //状态0 未开启 1 开启
            if (status == 0){
                ststusStr = "未开启";
            }else if (status == 1){
                ststusStr = "开启";
            }
        }
        return ststusStr;
    }

    public void setStstusStr(String ststusStr) {
        this.ststusStr = ststusStr;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
