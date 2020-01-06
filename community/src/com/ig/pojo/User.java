package com.ig.pojo;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
public class User {
    private Integer id;

    private String usercode;

    private String username;

    private String password;

    private String email;

    private Float level;

    private Date birth;

    private Long phone;

    private String emp;

    private String address;

    private Integer status;

    private Integer gender;

    private Date createtime;
    private Set<Activity> hasInActivities = new HashSet<>();
    private Set<Comment> hasPutComment = new HashSet<>();
    private Set<Comment> hasGetComment = new HashSet<>();

    public Set<Comment> getHasGetComment() {
        return hasGetComment;
    }

    public void setHasGetComment(Set<Comment> hasGetComment) {
        this.hasGetComment = hasGetComment;
    }

    public Set<Comment> getHasPutComment() {
        return hasPutComment;
    }

    public void setHasPutComment(Set<Comment> hasPutComment) {
        this.hasPutComment = hasPutComment;
    }

    public Set<Activity> getHasInActivities() {
        return hasInActivities;
    }

    public void setHasInActivities(Set<Activity> hasInActivities) {
        this.hasInActivities = hasInActivities;
    }

    private Set<Activity> putActivities = new HashSet<>();
    public Set<Activity> getPutActivities() {
        return putActivities;
    }

    public void setPutActivities(Set<Activity> putActivities) {
        this.putActivities = putActivities;
    }

    private Set<Logger> hasPutLogger = new HashSet<>();

    public Set<Logger> getHasPutLogger() {
        return hasPutLogger;
    }

    public void setHasPutLogger(Set<Logger> hasPutLogger) {
        this.hasPutLogger = hasPutLogger;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode == null ? null : usercode.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Float getLevel() {
        return level;
    }

    public void setLevel(Float level) {
        this.level = level;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getEmp() {
        return emp;
    }

    public void setEmp(String emp) {
        this.emp = emp == null ? null : emp.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

}