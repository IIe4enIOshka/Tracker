package com.Tracker.controller;

import com.Tracker.RequestData;
import com.Tracker.entity.User;
import com.Tracker.service.UserService;
import com.google.gson.Gson;
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

public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getMe", method = RequestMethod.POST)
    @ResponseBody
    public String getUser(HttpServletRequest request) throws ServletException, IOException {
        //получить данные из запроса
        Map result = RequestData.getData(request);
        // данные из Map записываем в переменные
        String username = (String) result.get("username");

        User user = userService.findUserByName(username);

        return new Gson().toJson(user);
    }
}