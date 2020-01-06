package com.ig.pojo;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public class PageBean {

    //当前页码
    private int currentPage = 5;
    //每页显示记录数
    private int pageSize = 5;
    //查询条件
    private DetachedCriteria detachedCriteria;
    //总记录数
    private int total;
    //当前页面需要展示的集合
    private List rows;
    public int getTotalPage(){
       return (int) Math.ceil(1.0*this.total/this.pageSize);
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public DetachedCriteria getDetachedCriteria() {
        return detachedCriteria;
    }
    public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
        this.detachedCriteria = detachedCriteria;
    }
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }
    public List getRows() {
        return rows;
    }
    public void setRows(List rows) {
        this.rows = rows;
    }
   
}
