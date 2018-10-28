package pl.findevent.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {



    public static Date dateFormatter(String dateYYYYMMDD) {

        DateFormat formatter;
        Date date = null;

        formatter = new SimpleDateFormat("dd-MMM-yy");
        try {
            date = formatter.parse(dateYYYYMMDD);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
