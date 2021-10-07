package com.Tracker.entity;

import javax.persistence.*;

@Entity
@Table(name = "COMMENTS")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String text;
    private String update_date;
    private String author;
    private int id_issue;
    private String status;

    public Comment() {
    }

    public Comment(String text, String update_date, String author, int id_issue, String status) {
        this.text = text;
        this.update_date = update_date;
        this.author = author;
        this.id_issue = id_issue;
        this.status = status;
    }
}
