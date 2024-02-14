package tw.com.gohome.imhangry.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DatetimeConverter {
    public static String toString(Date datetime, String format) {
        String result = "";
        try {
            if (datetime != null) {
                result = new SimpleDateFormat(format).format(datetime);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Date parse(String datetime, String format) {
        Date result = new Date();
        try {
            result = new SimpleDateFormat(format).parse(datetime);
        } catch (Exception e) {
            result = new Date();
            e.printStackTrace();
        }
        return result;
    }

    public static Date stringToDate(String dateString) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return formatter.parse(dateString);
        } catch (Exception e) {
            e.printStackTrace();
            return null; // 或者可以選擇拋出異常
        }
    }
}
