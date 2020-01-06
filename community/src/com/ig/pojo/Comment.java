package com.ig.pojo;

import java.util.Date;

public class Comment {
    private Integer id;

    private String content;
    private User beforeUser;
    private User afterUser;


    public User getBeforeUser() {
        return beforeUser;
    }

    public void setBeforeUser(User beforeUser) {
        this.beforeUser = beforeUser;
    }

    public User getAfterUser() {
        return afterUser;
    }

    public void setAfterUser(User afterUser) {
        this.afterUser = afterUser;
    }

    private Logger logger;

    private Date createtime;

    public Logger getLogger() {
        return logger;
    }

    public void setLogger(Logger logger) {
        this.logger = logger;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}