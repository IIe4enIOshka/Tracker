package com.Tracker.controller;

import com.Tracker.DateNow;
import com.Tracker.RequestData;
import com.Tracker.entity.Issue;
import com.Tracker.service.IssueService;
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
public class IssueController {
    @Autowired
    private IssueService issueService;


    @RequestMapping(value = "/update_issue", method = RequestMethod.POST)
    @ResponseBody
    public String updateIssue(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        int id = Integer.parseInt((String) result.get("id"));
        String status = (String) result.get("status");

        issueService.updateIssueById(status, id);

        return "{\"status\":\"success\",\"message\":\"success\"}";
    }

    @RequestMapping(value = "/get_issues", method = RequestMethod.GET)
    @ResponseBody
    public String getIssues() {
        List<Issue> issues = issueService.findAll();

        issues.forEach((issue) -> {
            issue.setStart_date(issue.getStart_date().substring(0, 10));
        });

        return new Gson().toJson(issues);
    }

    @RequestMapping(value = "/get_issue", method = RequestMethod.POST)
    @ResponseBody
    public String getIssue(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        int id = Integer.parseInt((String) result.get("id"));

        Issue issue = issueService.findById(id);

        return new Gson().toJson(issue);
    }

    @RequestMapping(value = "/add_issue", method = RequestMethod.POST)
    @ResponseBody
    public String addIssue(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        String name = (String) result.get("name");
        String status = "Created";
        String description = (String) result.get("description");
        String author = (String) result.get("author");

        String startDate = DateNow.getDate();

        Issue issue = new Issue(name, startDate, status, description, author);

        issueService.saveIssue(issue);
        return "{\"status\":\"success\",\"message\":\"success\"}";
    }
}
