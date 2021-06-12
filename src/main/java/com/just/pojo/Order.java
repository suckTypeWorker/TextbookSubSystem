package com.just.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class Order implements Serializable {
    private Integer id;
    private Integer userId;
    private Integer tBookId;
    // 使用订单中教材的班级
    private String orderClass;
    private String orderDate;
    private Integer num;
    private BigDecimal sumPrice;
    /**
     * 0.待审核
     * 1.秘书确认
     * 2.主任通过审核
     * 3.主任不通过审核
     * 4.教材科已总结收录
     */
    private Integer orderState;
    private String note;
    private TextBook textBook;
    private User user;

    public Order() {
    }

    public Order(Integer id, Integer userId, Integer tBookId, String orderDate,
                 String orderClass, Integer num, BigDecimal sumPrice,
                 Integer orderState, String note, TextBook textBook, User user) {
        this.id = id;
        this.userId = userId;
        this.tBookId = tBookId;
        this.orderDate = orderDate;
        this.orderClass = orderClass;
        this.num = num;
        this.sumPrice = sumPrice;
        this.orderState = orderState;
        this.note = note;
        this.textBook = textBook;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer gettBookId() {
        return tBookId;
    }

    public void settBookId(Integer tBookId) {
        this.tBookId = tBookId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderClass() {
        return orderClass;
    }

    public void setOrderClass(String orderClass) {
        this.orderClass = orderClass;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public BigDecimal getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(BigDecimal sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public TextBook getTextBook() {
        return textBook;
    }

    public void setTextBook(TextBook textBook) {
        this.textBook = textBook;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", tBookId=" + tBookId +
                ", orderClass='" + orderClass + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", num=" + num +
                ", sumPrice=" + sumPrice +
                ", orderState=" + orderState +
                ", note='" + note + '\'' +
                ", textBook=" + textBook +
                ", user=" + user +
                '}';
    }
}
