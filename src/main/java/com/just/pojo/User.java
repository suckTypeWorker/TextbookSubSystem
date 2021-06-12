package com.just.pojo;

import java.io.Serializable;

public class User implements Serializable {
    private Integer userId;
    private String userName;
    private String password;
    /**
     * 学号/工号
     */
    private String serialId;
    /**
     * 用户类型
     * 1.管理员(啥都能管)
     * 2.教材科(审核)
     * 3.系主任(查看、提交订单，修改还未支付的订单)
     * 4.教学秘书(查看、汇总订单)
     * 5.教师(提交订单)
     */
    private Integer userType;
    /**
     * 单位(系)
     */
    private String userDept;
    /**
     * 电话号码(不可重复)
     */
    private String userPhone;

    private int userState;

    public User() {
    }

    public User(Integer userId, String userName, String password, String serialId,
                Integer userType, String userDept, String userPhone, int userState) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.serialId = serialId;
        this.userType = userType;
        this.userDept = userDept;
        this.userPhone = userPhone;
        this.userState = userState;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSerialId() {
        return serialId;
    }

    public void setSerialId(String serialId) {
        this.serialId = serialId;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getUserDept() {
        return userDept;
    }

    public void setUserDept(String userDept) {
        this.userDept = userDept;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getUserState() {
        return userState;
    }

    public void setUserState(int userState) {
        this.userState = userState;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", serialId='" + serialId + '\'' +
                ", userType=" + userType +
                ", userDept='" + userDept + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userState=" + userState +
                '}';
    }
}
