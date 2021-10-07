package com.Tracker.entity;

import javax.persistence.*;

@Entity
@Table(name = "ISSUES")
public class Issue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String start_date;
    private String status;
    private String description;
    private String author;

    public Issue() {
    }

    public Issue(String name, String start_date, String status, String description, String author) {
        this.name = name;
        this.start_date = start_date;
        this.status = status;
        this.description = description;
        this.author = author;

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
