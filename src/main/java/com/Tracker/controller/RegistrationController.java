package com.Tracker.controller;

import com.Tracker.RequestData;
import com.Tracker.entity.User;
import com.Tracker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@Controller

public class RegistrationController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public String addUser(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        String username = (String) result.get("username");
        String password = (String) result.get("password");
        String fullname = (String) result.get("fullname");

        User newUser = new User(username, password, fullname);

        if (!userService.saveUser(newUser)) {
            return "{\"status\":\"error\",\"message\":\"This user already exists\"}";
        }

        return "{\"status\":\"success\",\"message\":\"success\"}";
    }
}