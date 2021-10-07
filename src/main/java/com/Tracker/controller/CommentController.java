package com.Tracker.controller;

import com.Tracker.DateNow;
import com.Tracker.RequestData;
import com.Tracker.entity.Comment;
import com.Tracker.service.CommentService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/add_comment", method = RequestMethod.POST)
    @ResponseBody
    public String addComment(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        String text = (String) result.get("text");
        String author = (String) result.get("author");
        int idIssue = Integer.parseInt((String) result.get("idIssue"));
        String status = (String) result.get("status");
        //получаем текущую дату и время
        String update_date = DateNow.getDate();

        Comment comment = new Comment(text, update_date, author, idIssue, status);
        commentService.saveComment(comment);
        return "{\"status\":\"success\",\"message\":\"success\"}";
    }

    @RequestMapping(value = "/get_comments", method = RequestMethod.POST)
    @ResponseBody
    public String getComments(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        int id = Integer.parseInt((String) result.get("id"));

        List<Comment> comments = commentService.findAllCommentsByIdIssue(id);

        return new Gson().toJson(comments);
    }
}
