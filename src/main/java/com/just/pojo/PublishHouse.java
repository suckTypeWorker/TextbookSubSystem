package com.just.pojo;

import java.io.Serializable;
import java.util.List;

public class PublishHouse implements Serializable {
    private Integer publishId;
    private String publishName;
    private String publishCity;
    private String publishAddress;

    private List<com.just.pojo.TextBook> textBookList;

    public PublishHouse() {
    }

    public PublishHouse(Integer publishId, String publishName, String publishCity,
                        String publishAddress
            , List<com.just.pojo.TextBook> textBookList) {
        this.publishId = publishId;
        this.publishName = publishName;
        this.publishCity = publishCity;
        this.publishAddress = publishAddress;
        this.textBookList = textBookList;
    }

    public Integer getPublishId() {
        return publishId;
    }

    public void setPublishId(Integer publishId) {
        this.publishId = publishId;
    }

    public String getPublishName() {
        return publishName;
    }

    public void setPublishName(String publishName) {
        this.publishName = publishName;
    }

    public String getPublishCity() {
        return publishCity;
    }

    public void setPublishCity(String publishCity) {
        this.publishCity = publishCity;
    }

    public String getPublishAddress() {
        return publishAddress;
    }

    public void setPublishAddress(String publishAddress) {
        this.publishAddress = publishAddress;
    }


    public List<com.just.pojo.TextBook> getTextBookList() {
        return textBookList;
    }

    public void setTextBookList(List<com.just.pojo.TextBook> textBookList) {
        this.textBookList = textBookList;
    }

    @Override
    public String toString() {
        return "PublishHouse{" +
                "publishId=" + publishId +
                ", publishName='" + publishName + '\'' +
                ", publishCity='" + publishCity + '\'' +
                ", publishAddress='" + publishAddress + '\'' +
                ", textBookList=" + textBookList +
                '}';
    }
}
