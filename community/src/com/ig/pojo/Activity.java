package com.ig.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Activity {


    private String endTimeStr;

    public String getEndTimeStr() {
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    private Integer id;
    /**
     * 活动代码
     */
    private String acode;
    /**
     * 活动标题
     */
    private String atitle;
    /**
     * 活动类型
     */
    private Dictionary atype;
    /**
     * 已有人数
     */
    private Integer hascount;
    /**
     * 最大人数
     */
    private Integer acount;
    /**
     * 报名结束时间
     */
    private Date apply_endtime;
    /**
     * 开始时间
     */
    private Date starttime;
    /**
     * 活动结束时间
     */
    private Date endtime;
    /**
     * 是否付费
     */
    private boolean pay;
    /**
     * 支付费用
     */
    private Float apply_fee;
    /**
     * 活动地点
     */
    private String site;
    /**
     * 交通方式
     */
    private Dictionary transport;
    /**
     * 活动内容
     */
    private String content;
    /**
     * 备注
     */
    private String remark;
    /**
     * 发布时间
     */
    private Date createtime;
    /**
     * 创建人
     */
    private User createby;

    /**
     * 状态
     */
    private Integer status;
    /**
     * 图片地址
     */
    private String picture;
    /**
     * 是否被举报0未被1被
     */
    private boolean report;
    /**
     * 是否被禁止0未被1被
     */
    private boolean ban;

    /**
     * 1星
     */
    private Integer onestar_count;
    /**
     * 2星
     */
    private Integer twostar_count;
    /**
     * 3星
     */
    private Integer threestar_count;
    /**
     * 4星
     */
    private Integer fourstar_count;
    /**
     * 5星
     */
    private Integer fivestar_count;
    private Set<Logger> loggers = new HashSet<>();
    private Set<Comment> comments = new HashSet<>();

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<Logger> getLoggers() {
        return loggers;
    }

    public void setLoggers(Set<Logger> loggers) {
        this.loggers = loggers;
    }

    private Set<User> users = new HashSet<>();

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Dictionary getAtype() {
        return atype;
    }

    public void setAtype(Dictionary atype) {
        this.atype = atype;
    }

    public Dictionary getTransport() {
        return transport;
    }

    public void setTransport(Dictionary transport) {
        this.transport = transport;
    }

    public boolean isPay() {
        return pay;
    }

    public void setPay(boolean pay) {
        this.pay = pay;
    }

    public boolean isReport() {
        return report;
    }

    public void setReport(boolean report) {
        this.report = report;
    }

    public boolean isBan() {
        return ban;
    }

    public void setBan(boolean ban) {
        this.ban = ban;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAcode() {
        return acode;
    }

    public void setAcode(String acode) {
        this.acode = acode == null ? null : acode.trim();
    }

    public String getAtitle() {
        return atitle;
    }

    public void setAtitle(String atitle) {
        this.atitle = atitle == null ? null : atitle.trim();
    }

    public Integer getHascount() {
        return hascount;
    }

    public void setHascount(Integer hascount) {
        this.hascount = hascount;
    }

    public Integer getAcount() {
        return acount;
    }

    public void setAcount(Integer acount) {
        this.acount = acount;
    }



    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public User getCreateby() {
        return createby;
    }

    public void setCreateby(User createby) {
        this.createby = createby;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Date getApply_endtime() {
        return apply_endtime;
    }

    public void setApply_endtime(Date apply_endtime) {
        this.apply_endtime = apply_endtime;
    }

    public Float getApply_fee() {
        return apply_fee;
    }

    public void setApply_fee(Float apply_fee) {
        this.apply_fee = apply_fee;
    }

    public Integer getOnestar_count() {
        return onestar_count;
    }

    public void setOnestar_count(Integer onestar_count) {
        this.onestar_count = onestar_count;
    }

    public Integer getTwostar_count() {
        return twostar_count;
    }

    public void setTwostar_count(Integer twostar_count) {
        this.twostar_count = twostar_count;
    }

    public Integer getThreestar_count() {
        return threestar_count;
    }

    public void setThreestar_count(Integer threestar_count) {
        this.threestar_count = threestar_count;
    }

    public Integer getFourstar_count() {
        return fourstar_count;
    }

    public void setFourstar_count(Integer fourstar_count) {
        this.fourstar_count = fourstar_count;
    }

    public Integer getFivestar_count() {
        return fivestar_count;
    }

    public void setFivestar_count(Integer fivestar_count) {
        this.fivestar_count = fivestar_count;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", acode='" + acode + '\'' +
                ", atitle='" + atitle + '\'' +
                ", atype=" + atype +
                ", hascount=" + hascount +
                ", acount=" + acount +
                ", apply_endtime=" + apply_endtime +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", pay=" + pay +
                ", apply_fee=" + apply_fee +
                ", site='" + site + '\'' +
                ", transport=" + transport +
                ", content='" + content + '\'' +
                ", remark='" + remark + '\'' +
                ", createtime=" + createtime +
                ", createby=" + createby +
                ", status=" + status +
                ", picture='" + picture + '\'' +
                ", report=" + report +
                ", ban=" + ban +
                ", onestar_count=" + onestar_count +
                ", twostar_count=" + twostar_count +
                ", threestar_count=" + threestar_count +
                ", fourstar_count=" + fourstar_count +
                ", fivestar_count=" + fivestar_count +
                '}';
    }
}