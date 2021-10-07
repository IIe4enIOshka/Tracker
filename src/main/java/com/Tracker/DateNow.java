package com.Tracker;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateNow {
    public static String getDate(){
        Date dateNow = new Date();
        SimpleDateFormat formatForDateNow = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        return formatForDateNow.format(dateNow);
    }
}
