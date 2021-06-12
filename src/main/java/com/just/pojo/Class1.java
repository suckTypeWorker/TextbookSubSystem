package com.just.pojo;

import java.io.Serializable;

public class Class1 implements Serializable {

    private int id;
    private String classId;
    private String dept;
    private int num;

    public Class1() {
    }

    public Class1(int id, String classId, String dept, int num) {
        this.id = id;
        this.classId = classId;
        this.dept = dept;
        this.num = num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", classId='" + classId + '\'' +
                ", dept='" + dept + '\'' +
                ", num=" + num +
                '}';
    }
}
