package com.piotrek.myBlogApp.helperClasses;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    private static SimpleDateFormat formatter = new SimpleDateFormat(("dd/MM/yyyy H:m:s"));

    public static Date parseDate(String dateStr) throws ParseException {
        Date theDate = formatter.parse(dateStr);

        return theDate;
    }

    public static String formatDate(Date theDate) {

        String result = null;

        if (theDate != null) {
            result = formatter.format(theDate);
        }

        return result;
    }
}
