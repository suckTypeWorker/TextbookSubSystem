package com.just.pojo;

import java.io.Serializable;

public class TextBook implements Serializable {
    private Integer bookId;
    private String bookName;
    private String ISBNId;
    private String CIPId;
    private String seriesName;
    private Integer publishId;
    private String author;
    private String publishDate;
    private Double price;
    // 分类
    private String classification;
    //主题词
    private String theme;

    public TextBook() {
    }

    public TextBook(Integer bookId, String bookName, String ISBNId, String CIPId,
                    String seriesName, Integer publishId, String author,
                    String publishDate, Double price, String classification, String theme) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.ISBNId = ISBNId;
        this.CIPId = CIPId;
        this.seriesName = seriesName;
        this.publishId = publishId;
        this.author = author;
        this.publishDate = publishDate;
        this.price = price;
        this.classification = classification;
        this.theme = theme;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getISBNId() {
        return ISBNId;
    }

    public void setISBNId(String ISBNId) {
        this.ISBNId = ISBNId;
    }

    public String getCIPId() {
        return CIPId;
    }

    public void setCIPId(String CIPId) {
        this.CIPId = CIPId;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public Integer getPublishId() {
        return publishId;
    }

    public void setPublishId(Integer publishId) {
        this.publishId = publishId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    @Override
    public String toString() {
        return "TextBook{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", ISBNId='" + ISBNId + '\'' +
                ", CIPId='" + CIPId + '\'' +
                ", seriesName='" + seriesName + '\'' +
                ", publishId=" + publishId +
                ", author='" + author + '\'' +
                ", publishDate='" + publishDate + '\'' +
                ", price=" + price +
                ", classification='" + classification + '\'' +
                ", theme='" + theme + '\'' +
                '}';
    }
}
