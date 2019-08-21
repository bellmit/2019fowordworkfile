// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DateHelper.java

package com.bjrun.util;

import java.io.PrintStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public abstract class DateHelper
{

    public DateHelper()
    {
    }

    public static String getStringDateShort()
    {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        return dateString;
    }

    public static int getCurryear(Date date)
    {
        String yearstr = dfyear.format(date);
        return Integer.valueOf(yearstr).intValue();
    }

    public static Date parseDateIndex(String value)
    {
        Date date = null;
        try
        {
            if(value == null || value.length() <= 0)
                date = null;
            else
                date = indexFormat2.parse(value);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            date = null;
        }
        finally
        {
            return date;
        }
    }

    public static Date parseDate(String value)
    {
        Date date = null;
        try
        {
            if(value == null || value.length() <= 0)
                date = null;
            else
            if(value.trim().length() > 10)
                date = longFormat.parse(value);
            else
                date = shortFormat.parse(value);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            date = null;
        }
        finally
        {
            return date;
        }
    }

    public static String indexFormatDate(Date date)
    {
        return indexFormat.format(date);
    }

    public static String shortFormatDate(Date date)
    {
        if(date == null)
            return "";
        else
            return shortFormat.format(date);
    }

    public static int getHour(Date date)
    {
        if(date == null)
            return 0;
        else
            return Integer.valueOf(dfhour.format(date)).intValue();
    }

    public static String longFormatDate(Date date)
    {
        if(date == null)
            return "";
        else
            return longFormat.format(date);
    }

    public static int getTimedifference(Date startDate, Date endDate)
    {
        int sumTime = 0;
        int day = getBetweenDays(endDate, startDate);
        if(day > 0)
        {
            int startTime = 0;
            int workhour = getHour(startDate);
            if(workhour == 0)
                workhour = 9;
            if(workhour >= 12)
                startTime = 18 - workhour;
            else
                startTime = (12 - workhour) + 5;
            int endTime = 0;
            int workhourend = getHour(endDate);
            if(workhourend == 0)
                workhourend = 9;
            if(workhourend >= 12)
                endTime = 8 - (18 - workhourend);
            else
                endTime = (workhourend + 3) - 12;
            if(endTime == 0)
                sumTime = day * 8 + startTime + endTime;
            else
                sumTime = (day - 1) * 8 + startTime + endTime;
        } else
        {
            int startTime = 0;
            int workhour = getHour(startDate);
            if(workhour == 0)
                workhour = 9;
            int endTime = 0;
            int workhourend = getHour(endDate);
            if(workhourend == 0)
                workhourend = 9;
            if(workhour < workhourend)
            {
                if(workhour >= 12 || workhourend <= 12)
                    startTime = workhourend - workhour;
                else
                    startTime = workhourend - workhour - 1;
            } else
            {
                if(workhour >= 12)
                    startTime = 18 - workhour;
                else
                    startTime = (12 - workhour) + 5;
                if(workhourend >= 12)
                    endTime = 3 + ((workhourend + 5) - 18);
                else
                    endTime = (workhourend + 3) - 12;
            }
            sumTime = startTime + endTime;
        }
        return sumTime;
    }

    public static Date getLatestWeekReportDate(int queryDay)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(parseDate(shortFormatDate(cd.getTime())));
        int day = cd.get(7);
        if(day == queryDay)
            return cd.getTime();
        if(day > queryDay)
            cd.add(5, -day + queryDay);
        else
            cd.add(5, (-day + queryDay) - 7);
        return cd.getTime();
    }

    public static Date modifyDate(Date date, int modifier)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(5, modifier);
        return cd.getTime();
    }

    public static Date modifyDateByYear(Date date, int year)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(1, -year);
        return cd.getTime();
    }

    public static Date getYesterday()
    {
        Date today = new Date();
        return modifyDate(today, -1);
    }

    public static Date getLastWeekDay()
    {
        Date today = new Date();
        return modifyDate(today, -7);
    }

    public static Date getTheDayBeforeEight()
    {
        Date today = new Date();
        return modifyDate(today, -8);
    }

    public static Date getTheDayBeforeFour()
    {
        Date today = new Date();
        return modifyDate(today, -4);
    }

    public static Date getTheDayBeforeFive()
    {
        Date today = new Date();
        return modifyDate(today, -5);
    }

    public static Date getTheDayAfterX(Date date, int x)
    {
        return modifyDate(date, x);
    }

    public static Date getTheDayBeforeYesterday()
    {
        Date today = new Date();
        return modifyDate(today, -2);
    }

    public static long getTimeDiff(Date date1, Date date2)
    {
        long diff = 0L;
        Calendar cd1 = Calendar.getInstance();
        cd1.setTime(date1);
        Calendar cd2 = Calendar.getInstance();
        cd2.setTime(date2);
        diff = cd1.getTimeInMillis() - cd2.getTimeInMillis();
        return diff;
    }

    public static int getDayDiff(Date date1, Date date2)
    {
        int diff = 0;
        Calendar cd1 = Calendar.getInstance();
        cd1.setTime(date1);
        Calendar cd2 = Calendar.getInstance();
        cd2.setTime(date2);
        long diffT = cd1.getTimeInMillis() - cd2.getTimeInMillis();
        diff = Integer.parseInt(String.valueOf(diffT / 0x5265c00L));
        return diff;
    }

    public static double getTimeDiffHour(Date date1, Date date2)
    {
        double diff = getTimeDiff(date1, date2);
        BigDecimal bd = (new BigDecimal(diff / 1000D / 60D / 60D)).setScale(2, 4);
        return bd.doubleValue();
    }

    public static int getMonth(Date date)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        return cd.get(2);
    }

    public static int getYear(Date date)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        return cd.get(1);
    }

    public static int getDayOfWeek(Date date)
    {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        return cd.get(7);
    }

    public static String getDayOfWeekHp(Date date)
    {
        String[] weeks = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        int w = calendar.get(7) - 1;
        if(w < 0)
            w = 0;
        return weeks[w];
    }

    public static int getBetweenDays(Date date1, Date date2)
    {
        double diff = getTimeDiff(date1, date2);
        BigDecimal bd = (new BigDecimal(diff / 1000D / 60D / 60D / 24D)).setScale(2, 4);
        if(date1.before(date2))
            return (int)bd.doubleValue() - 1;
        else
            return (int)bd.doubleValue();
    }

    static boolean isLeap(int year)
    {
        return year % 100 == 0 && year % 400 == 0 || year % 100 != 0 && year % 4 == 0;
    }

    public static int getDays(int year, int month)
    {
        int FebDay = 28;
        if(isLeap(year))
            FebDay = 29;
        int days;
        switch(month)
        {
        case 1: // '\001'
        case 3: // '\003'
        case 5: // '\005'
        case 7: // '\007'
        case 8: // '\b'
        case 10: // '\n'
        case 12: // '\f'
            days = 31;
            break;

        case 4: // '\004'
        case 6: // '\006'
        case 9: // '\t'
        case 11: // '\013'
            days = 30;
            break;

        case 2: // '\002'
            days = FebDay;
            break;

        default:
            days = 0;
            break;
        }
        return days;
    }

    public static void main(String args[])
    {
        String datestr = getStringDateShort();
        datestr = datestr.replace("-", "");
        System.out.println(datestr);
    }

    private static DateFormat shortFormat = new SimpleDateFormat("yyyy-MM-dd");
    private static DateFormat longFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static DateFormat indexFormat = new SimpleDateFormat("MM/dd/yyyy");
    private static DateFormat indexFormat2 = new SimpleDateFormat("yyyy/MM/dd");
    static DateFormat dfyear = new SimpleDateFormat("yyyy");
    static DateFormat dfhour = new SimpleDateFormat("HH");

}
