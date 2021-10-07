package com.Tracker;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Scanner;

public abstract class RequestData {
    public static Map getData(HttpServletRequest request) throws IOException {
        InputStream in = request.getInputStream();
        Scanner s = new Scanner(in, "UTF-8");
        String json = s.nextLine();
        System.out.println(json);
        return new Gson().fromJson(json, Map.class);
    }
}
