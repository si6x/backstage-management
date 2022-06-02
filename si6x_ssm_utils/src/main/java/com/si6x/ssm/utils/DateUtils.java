package com.si6x.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Si6x
 */
public class DateUtils {

    /**
     * 日期转换成字符串
     * @param date
     * @param patt
     * @return
     */
    public static String dateToString(Date date,String patt){
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        return sdf.format(date);
    }

    /**
     * 字符串转成日期
     * @param str
     * @param patt
     * @return
     * @throws ParseException
     */
    public static Date stringToDate(String str,String patt) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        return sdf.parse(str);
    }

}
