package com.ig.pojo;

import java.util.HashSet;
import java.util.Set;

public class Dictionary {
    private Integer id;

    private String typename;

    private Integer parentid;

    private Set<Activity> atype = new HashSet<>();
    private Set<Activity> transport = new HashSet<>();

    public Set<Activity> getAtype() {
        return atype;
    }

    public void setAtype(Set<Activity> atype) {
        this.atype = atype;
    }

    public Set<Activity> getTransport() {
        return transport;
    }

    public void setTransport(Set<Activity> transport) {
        this.transport = transport;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    @Override
    public String toString() {
        return "Dictionary{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                ", parentid=" + parentid +
                '}';
    }
}