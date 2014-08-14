/**
 * Copyright (C) 2009 numenzq studio. All Rights Reserved.
 */
package mq.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.time.FastDateFormat;

/**
 * 日期类型与字符串类型相互转换工具类
 * 
 * @since fanhoujun 2008-3-20
 */
public class DateUtils {

	/** 1000 */
	public static final long MILLIS_PER_SECOND = 1000;

	/** 60×1000 */
	public static final long MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND;

	/** 60×60×1000 */
	public static final long MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE;

	/** 24×60×60×1000 */
	public static final long MILLIS_PER_DAY = 24 * MILLIS_PER_HOUR;

	/** yyyyMMdd */
	public static final String COMPACT_DATE_PATTERN = "yyyyMMdd";

	/** yyyy-MM-dd */
	public static final String DATE_PATTERN = "yyyy-MM-dd";

	/** yyyy-MM-dd HH:mm:ss */
	public static final String DATETIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/** yyyy-MM-dd HH:mm */
	public static final String TRIM_SECOND_PATTERN = "yyyy-MM-dd HH:mm";

	/** yyyyMMdd HH:mm */
	public static final String COMPACT_TRIM_SECOND_PATTERN = "yyyyMMdd HH:mm";

	/**
	 * 获得服务器当前时间
	 * 
	 * @return 当前时间
	 */
	public static Date currentDate() {
		return new Date();
	}

	/**
	 * 将日期转换为字符串类型
	 * 
	 * @param date
	 *            日期
	 * @return 字符串，格式为：yyyy-MM-dd
	 */
	public static String format(Date date) {
		return format(date, DATE_PATTERN);
	}

	/**
	 * 将日期转换为字符串类型
	 * 
	 * @param date
	 *            日期
	 * @param pattern
	 *            字符串匹配模式
	 * @return 字符串
	 */
	public static String format(Date date, String pattern) {
		if (date == null) {
			return null;
		}
		return FastDateFormat.getInstance(pattern).format(date);
	}

	/**
	 * 将字符串转换为日期类型
	 * 
	 * @param str
	 *            字符串，格式为：yyyy-MM-dd
	 * @return 日期
	 */
	public static Date parse(String str) {
		return parse(str, DATE_PATTERN);
	}

	/**
	 * 将字符串转换为日期类型
	 * 
	 * @param str
	 *            字符串
	 * @param pattern
	 *            字符串匹配模式
	 * @return 日期
	 */
	public static Date parse(String str, String pattern) {
		if (str==null || str.isEmpty()) {
			return null;
		}
		DateFormat parser = new SimpleDateFormat(pattern);
		try {
			return parser.parse(str);
		} catch (ParseException e) {
			throw new IllegalArgumentException("参数错误：日期类型格式解析出错。");
		}
	}

	/**
	 * 返回日期的年份
	 * 
	 * @param date
	 *            日期
	 * @return 日期的年份
	 */
	public static int dayOfYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		return calendar.get(Calendar.YEAR);
	}

	/**
	 * 返回日期的月份
	 * 
	 * @param date
	 *            日期
	 * @return 日期的月份
	 */
	public static int dayOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		return calendar.get(Calendar.MONTH) + 1;
	}

	/**
	 * 返回日期的日
	 * 
	 * @param date
	 *            日期
	 * @return 日期的日
	 */
	public static int dayOfDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		return calendar.get(Calendar.DATE);
	}

	public static Date getStartTimeOfCurrentDate() {
		return getStartTimeOfDate(currentDate());
	}
	
	public static Date getStartTimeOfDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}

	public static Date getEndTimeOfDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}

	public static Date getStartTimeOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	public static Date getEndTimeOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}

	
	public static Date getStartTimeOfYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_YEAR, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	public static Date getEndTimeOfYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 31);
		cal.set(Calendar.MONTH, 11);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	public static Date getStartTimeOfWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	public static Date getEndTimeOfWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY+6);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	public static Date getFirstDayOfWeek(int year,int week) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DATE, 1);
		
		Calendar c = (Calendar) cal.clone();
		c.add(Calendar.DATE, week*7);
		return getStartTimeOfWeek(c.getTime());
	}
	
	public static Date getLastDayOfWeek(int year,int week) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DATE, 1);
		
		Calendar c = (Calendar) cal.clone();
		c.add(Calendar.DATE, week*7);
		return getEndTimeOfWeek(c.getTime());
	}
	
	public static Date addHours(Date date, int hours) {
		return add(date, Calendar.HOUR_OF_DAY, hours);
	}

	public static Date addMinutes(Date date, int minutes) {
		return add(date, Calendar.MINUTE, minutes);
	}

	public static Date addDays(Date date, int days) {
		return add(date, Calendar.DATE, days);
	}

	public static Date addMonths(Date date, int months) {
		return add(date, Calendar.MONTH, months);
	}

	public static Date addYears(Date date, int years) {
		return add(date, Calendar.YEAR, years);
	}
	
	public static Date addWeeks(Date date, int weeks) {
		return add(date, Calendar.WEEK_OF_MONTH, weeks);
	}

	private static Date add(Date date, int field, int amount) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(field, amount);
		return cal.getTime();
	}
	
	public static String getInterval(Date date) {
		String interval = "";
		long time = DateUtils.currentDate().getTime() - date.getTime();
		if (time /1000 < 10 && time / 1000 >=0) {
			interval = "刚刚";
		} else if (time/1000 >0 && time/1000 < 60) {
			int se = (int) ((time%60000)/1000);
			interval = se + "秒前";
		} else if (time/60000 > 0 && time/60000 < 60) {
			int m = (int) ((time%3600000)/60000);//得出的时间间隔的单位是分钟
			interval = m + "分钟前";
		} else if (time/3600000 > 0 && time/3600000 < 24) {
			int h = (int) (time/3600000);//得出的时间间隔的单位是小时
			interval = h + "小时前";
		} else {
			interval = DateUtils.format(date,TRIM_SECOND_PATTERN);
		}	
		return interval;
	}
	
	/**
	 * 获取日期的星期
	 * @param date
	 * @return 1-6 星期(1-6) 7:星期天
	 */
	public static Integer getWeekOfDate(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		return w == 0 ? 7 : w;
	}
	
	public static void main(String[] args) {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		System.out.println(w);
		/**
		Calendar c = Calendar.getInstance();
		c.setTime(DateUtils.currentDate());
//		c.add(Calendar.YEAR, 0);
		c.set(Calendar.YEAR, 2014);
//		c.set(Calendar.MONTH, 1-1);
//		c.set(Calendar.DATE, 3);
		c.set(Calendar.DAY_OF_WEEK, 1);
		System.out.println(DateUtils.format(c.getTime()));
		System.out.println(DateUtils.format(DateUtils.getStartTimeOfWeek(DateUtils.addWeeks(DateUtils.currentDate(), -1)),DateUtils.DATETIME_PATTERN));
		System.out.println(DateUtils.format(DateUtils.addYears(DateUtils.currentDate(), 0)));
		System.out.println(DateUtils.format(DateUtils.addMonths(DateUtils.addYears(DateUtils.currentDate(), -1),-2)));
//		DateUtils.getDateCalendar(DateUtils.addYears(DateUtils.currentDate(), -1)).set;
//		System.out.println(DateUtils.format(DateUtils.getDateCalendar(DateUtils.addYears(DateUtils.currentDate(), -1)).set(Calendar.MONTH, 2)));
		System.out.println(DateUtils.format(DateUtils.getEndTimeOfYear(DateUtils.currentDate())));
		System.out.println(DateUtils.format(DateUtils.addMonths(DateUtils.currentDate(), 1)));
		System.out.println(DateUtils.format(DateUtils.getStartTimeOfMonth(DateUtils.currentDate())));
		System.out.println(DateUtils.format(DateUtils.getEndTimeOfMonth(DateUtils.currentDate())));
		System.out.println(DateUtils.format(DateUtils.getStartTimeOfWeek(c.getTime())));
		System.out.println(DateUtils.format(DateUtils.getEndTimeOfWeek(DateUtils.currentDate())));
		System.out.println(DateUtils.format(DateUtils.getFirstDayOfWeek(2014, 0)));
		System.out.println(getInterval(DateUtils.addMinutes(DateUtils.currentDate(), -2)));
		 * */
		
		
		//
		
		
	}
}
