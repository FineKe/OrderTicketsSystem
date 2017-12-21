package com.litesky.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class SysPermission implements Serializable {


    private static final long serialVersionUID = -8176114968687411667L;

    @Id@GeneratedValue
    private Long pid;

    private String name;

    private String resouceType;//资源类型[menu/button]

    private String url;//资源路径

    private String permission;//权限字符，role:*

    private Long parentId;//父编号

    private String parentIds;//父编号列表

    private Boolean avaliable=Boolean.FALSE;

    @ManyToMany
    @JoinTable(name = "SysRolePermission",joinColumns = {@JoinColumn(name = "pid")},inverseJoinColumns = {@JoinColumn(name = "roleId")})
    private List<SysRole> roles;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResouceType() {
        return resouceType;
    }

    public void setResouceType(String resouceType) {
        this.resouceType = resouceType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public Boolean getAvaliable() {
        return avaliable;
    }

    public void setAvaliable(Boolean avaliable) {
        this.avaliable = avaliable;
    }

    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "SysPermission{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", resouceType='" + resouceType + '\'' +
                ", url='" + url + '\'' +
                ", permission='" + permission + '\'' +
                ", parentId=" + parentId +
                ", parentIds='" + parentIds + '\'' +
                ", avaliable=" + avaliable +
                ", roles=" + roles +
                '}';
    }
}
