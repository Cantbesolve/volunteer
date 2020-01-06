package com.ig.pojo;

public class Starcomment {
    private Integer id;

    private String userid;

    private String acode;

    private Integer starcount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAcode() {
        return acode;
    }

    public void setAcode(String acode) {
        this.acode = acode == null ? null : acode.trim();
    }

    public Integer getStarcount() {
        return starcount;
    }

    public void setStarcount(Integer starcount) {
        this.starcount = starcount;
    }
}