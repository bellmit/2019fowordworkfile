/*   1:    */ package com.bjrun.util;
/*   2:    */ 
/*   4:    */ import java.math.BigDecimal;
/*   5:    */ import java.text.ParseException;
/*   6:    */ import java.text.SimpleDateFormat;
/*   7:    */ import java.util.ArrayList;
/*   8:    */ import java.util.Calendar;
/*   9:    */ import java.util.Date;
/*  10:    */ import java.util.GregorianCalendar;
import java.util.List;

import org.junit.Test;
/*  12:    */ 
/*  13:    */ public class DateUtil
/*  14:    */ {
/*  18:    */   
/*  19:    */   public static String format(Date date)
/*  20:    */   {
/*  21: 26 */     return format(date, "yyyy-MM-dd");
/*  22:    */   }
/*  23:    */   
/*  24:    */   public static String formatDateTime(Date date)
/*  25:    */   {
/*  26: 29 */     return format(date, "yyyy-MM-dd HH:mm:ss");
/*  27:    */   }
/*  28:    */   
/*  29:    */   public static String formatHHmmss(Date date)
/*  30:    */   {
/*  31: 32 */     return format(date, "HH:mm:ss");
/*  32:    */   }
/*  33:    */   
/*  34:    */   public static String format(Date date, String mask)
/*  35:    */   {
/*  36: 36 */     SimpleDateFormat fm = new SimpleDateFormat(mask);
/*  37: 37 */     return date != null ? fm.format(date) : "";
/*  38:    */   }
/*  39:    */   
/*  40:    */   public static Date parse(String date)
/*  41:    */   {
/*  42: 41 */     return parse(date, "yyyy-MM-dd");
/*  43:    */   }
/*  44:    */   
/*  45:    */   public static Date parseDateTime(String date)
/*  46:    */   {
/*  47: 44 */     return parse(date, "yyyy-MM-dd HH:mm:ss");
/*  48:    */   }
/*  49:    */   
/*  50:    */   public static Date parse(String str, String mask)
/*  51:    */   {
/*  52: 48 */     SimpleDateFormat fm = new SimpleDateFormat(mask);
/*  53: 49 */     Date date = new Date();
/*  54:    */     try
/*  55:    */     {
/*  56: 51 */       date = fm.parse(str);
/*  57:    */     }
/*  58:    */     catch (ParseException e)
/*  59:    */     {
/*  60: 53 */       e.printStackTrace();
/*  61:    */     }
/*  62: 55 */     return date;
/*  63:    */   }
/*  64:    */   
/*  65:    */   public static String getFormatCount(int count){
				    return count >= 10 ? (new StringBuilder()).append(count).toString() : (new StringBuilder("0")).append(count).toString();
				}
/*  69:    */   
/*  70:    */   public static boolean isPM()
/*  71:    */   {
/*  72: 74 */     return isPM(new Date());
/*  73:    */   }
/*  74:    */   
/*  75:    */   public static Date getDayAfterToday(int after)
/*  76:    */   {
/*  77: 79 */     Calendar call = Calendar.getInstance();
/*  78: 80 */     call.add(5, after);
/*  79: 81 */     return call.getTime();
/*  80:    */   }
/*  81:    */   
/*  82:    */   public static boolean isPM(Date date)
/*  83:    */   {
/*  84: 94 */     Calendar cd = Calendar.getInstance();
/*  85: 95 */     cd.setTime(date);
/*  86:    */     
/*  87: 97 */     int pmValue = cd.get(9);
/*  88:    */     
/*  89: 99 */     return pmValue == 1;
/*  90:    */   }
/*  91:    */   
/*  92:    */   public static boolean isAM()
/*  93:    */   {
/*  94:109 */     return isAM(new Date());
/*  95:    */   }
/*  96:    */   
/*  97:    */   public static boolean isAM(Date date)
/*  98:    */   {
/*  99:121 */     Calendar cd = Calendar.getInstance();
/* 100:122 */     cd.setTime(date);
/* 101:    */     
/* 102:124 */     int amValue = cd.get(9);
/* 103:    */     
/* 104:126 */     return amValue == 0;
/* 105:    */   }
/* 106:    */   
/* 107:    */   public static double getTimeDiffDay(Date date1, Date date2)
/* 108:    */   {
/* 109:141 */     double diff = getTimeDiff(date1, date2);
/* 110:142 */     BigDecimal bd = new BigDecimal(diff / 1000.0D / 60.0D / 60.0D / 24.0D).setScale(2, 4);
/* 111:143 */     return bd.doubleValue();
/* 112:    */   }
/* 113:    */   
/* 114:    */   public static double getTimeDiffHour(Date date1, Date date2)
/* 115:    */   {
/* 116:152 */     double diff = getTimeDiff(date1, date2);
/* 117:153 */     BigDecimal bd = new BigDecimal(diff / 1000.0D / 60.0D / 60.0D).setScale(2, 4);
/* 118:154 */     return bd.doubleValue();
/* 119:    */   }
/* 120:    */   
/* 121:    */   public static int getYear(Date date)
/* 122:    */   {
/* 123:166 */     Calendar cd = getCalendar(date);
/* 124:    */     
/* 125:168 */     return cd.get(1);
/* 126:    */   }
/* 127:    */   
/* 128:    */   public static int getMonth(Date date)
/* 129:    */   {
/* 130:177 */     Calendar cd = getCalendar(date);
/* 131:    */     
/* 132:179 */     return cd.get(2) + 1;
/* 133:    */   }
/* 134:    */   
/* 135:    */   public static String getEndDayOfYear()
/* 136:    */   {
/* 137:189 */     int year = getYear(new Date());
/* 138:190 */     String fristDayOfYear = String.valueOf(year) + "-12-31";
/* 139:    */     
/* 140:192 */     return fristDayOfYear;
/* 141:    */   }
/* 142:    */   
/* 143:    */   public static int getDayOfMonth(Date date)
/* 144:    */   {
/* 145:204 */     Calendar cd = getCalendar(date);
/* 146:    */     
/* 147:206 */     return cd.get(5);
/* 148:    */   }
/* 149:    */   
/* 150:    */   public static boolean checkFirstDayOfMonth()
/* 151:    */   {
/* 152:215 */     Date currentDate = new Date();
/* 153:    */     
/* 154:217 */     Calendar ca = Calendar.getInstance();
/* 155:218 */     ca.setTime(currentDate);
/* 156:    */     
/* 157:220 */     int day = ca.get(5);
/* 158:    */     
/* 159:222 */     return day == 1;
/* 160:    */   }
/* 161:    */   
/* 162:    */   public static int daysBetween(Date early, Date late)
/* 163:    */   {
/* 164:236 */     Calendar calst = Calendar.getInstance();
/* 165:237 */     Calendar caled = Calendar.getInstance();
/* 166:238 */     calst.setTime(early);
/* 167:239 */     caled.setTime(late);
/* 168:    */     
/* 169:241 */     calst.set(11, 0);
/* 170:242 */     calst.set(12, 0);
/* 171:243 */     calst.set(13, 0);
/* 172:244 */     caled.set(11, 0);
/* 173:245 */     caled.set(12, 0);
/* 174:246 */     caled.set(13, 0);
/* 175:    */     
/* 176:248 */     int days = ((int)(caled.getTime().getTime() / 1000L) - (int)(
/* 177:249 */       calst.getTime().getTime() / 1000L)) / 3600 / 24;
/* 178:    */     
/* 179:251 */     return days;
/* 180:    */   }
/* 181:    */   
/* 182:    */   public static int getHourOfDate(Date changeDate)
/* 183:    */   {
/* 184:262 */     int result = 0;
/* 185:263 */     if (changeDate != null)
/* 186:    */     {
/* 187:264 */       Calendar ca = Calendar.getInstance();
/* 188:265 */       ca.setTime(changeDate);
/* 189:    */       
/* 190:267 */       result = ca.get(11);
/* 191:    */     }
/* 192:270 */     return result;
/* 193:    */   }
/* 194:    */   
/* 195:    */   public static Date modifyDate(Date date, int amount)
/* 196:    */   {
/* 197:283 */     Calendar cd = getCalendar(date);
/* 198:284 */     cd.add(5, amount);
/* 199:    */     
/* 200:286 */     return cd.getTime();
/* 201:    */   }
/* 202:    */   
/* 203:    */   public static Date modifyMonth(Date date, int month)
/* 204:    */   {
/* 205:298 */     Calendar cd = getCalendar(date);
/* 206:299 */     cd.add(2, month);
/* 207:    */     
/* 208:301 */     return cd.getTime();
/* 209:    */   }
/* 210:    */   
/* 211:    */   public static Date modifyYear(Date date, int year)
/* 212:    */   {
/* 213:313 */     Calendar cd = getCalendar(date);
/* 214:314 */     cd.add(1, year);
/* 215:    */     
/* 216:316 */     return cd.getTime();
/* 217:    */   }
/* 218:    */   
/* 219:    */   public static long getTimeDiff(Date date1, Date date2)
/* 220:    */   {
/* 221:326 */     long diffTime = 0L;
/* 222:328 */     if ((date1 != null) && (date2 != null))
/* 223:    */     {
/* 224:329 */       Calendar cd1 = Calendar.getInstance();
/* 225:330 */       cd1.setTime(date1);
/* 226:    */       
/* 227:332 */       Calendar cd2 = Calendar.getInstance();
/* 228:333 */       cd2.setTime(date2);
/* 229:    */       
/* 230:335 */       diffTime = cd1.getTimeInMillis() - cd2.getTimeInMillis();
/* 231:    */     }
/* 232:338 */     return diffTime;
/* 233:    */   }
/* 234:    */   
/* 235:    */   public static Date getDateFromYYYYMMDDstr(String yyyyMMDD)
/* 236:    */   {
/* 237:348 */     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
/* 238:349 */     Date date = null;
/* 239:    */     try
/* 240:    */     {
/* 241:351 */       date = sdf.parse(yyyyMMDD);
/* 242:    */     }
/* 243:    */     catch (ParseException e)
/* 244:    */     {
/* 245:353 */       e.printStackTrace();
/* 246:    */     }
/* 247:355 */     return date;
/* 248:    */   }
/* 249:    */   
/* 250:    */   public static String getTodayStryyyyMMDD()
/* 251:    */   {
/* 252:367 */     return format(new Date());
/* 253:    */   }
/* 254:    */   
/* 255:    */   public static String getFristDayOfYear()
/* 256:    */   {
/* 257:378 */     int year = getYear(new Date());
/* 258:379 */     String fristDayOfYear = String.valueOf(year) + "-01-01";
/* 259:    */     
/* 260:381 */     return fristDayOfYear;
/* 261:    */   }
/* 262:    */   
/* 263:    */   public static String getFristDayOfMonth()
/* 264:    */   {
/* 265:394 */     int year = DateHelper.getYear(new Date());
/* 266:395 */     Calendar cal = Calendar.getInstance();
/* 267:396 */     int month = cal.get(2) + 1;
/* 268:    */     
/* 269:398 */     String monthStr = "";
/* 270:399 */     if (month < 10) {
/* 271:400 */       monthStr = "-0" + String.valueOf(month);
/* 272:    */     } else {
/* 273:402 */       monthStr = "-" + String.valueOf(month);
/* 274:    */     }
/* 275:404 */     String fristDayOfMonth = String.valueOf(year) + monthStr + "-01";
/* 276:405 */     return fristDayOfMonth;
/* 277:    */   }
/* 278:    */   
/* 279:    */   public static Date aFewDaysAfter(Date date, int repeatInterval)
/* 280:    */   {
/* 281:419 */     Calendar cal = getCalendar(date);
/* 282:420 */     cal.add(5, repeatInterval);
/* 283:421 */     return cal.getTime();
/* 284:    */   }
/* 285:    */   
/* 286:    */   private static Calendar getCalendar(Date date)
/* 287:    */   {
/* 288:432 */     Calendar cal = Calendar.getInstance();
/* 289:433 */     cal.setTime(date);
/* 290:434 */     return cal;
/* 291:    */   }
/* 292:    */   
/* 293:    */   public static Date getWeekStart(Date date)
/* 294:    */   {
/* 295:441 */     Calendar calendar = Calendar.getInstance();
/* 296:442 */     calendar.setTime(date);
/* 297:    */     
/* 298:444 */     int day = calendar.get(7);
/* 299:445 */     if (day == 1) {
/* 300:446 */       calendar.add(5, -6);
/* 301:    */     } else {
/* 302:448 */       calendar.add(5, 2 - day);
/* 303:    */     }
/* 304:451 */     return calendar.getTime();
/* 305:    */   }
/* 306:    */   
/* 307:    */   public static Date getWeekEnd(Date date)
/* 308:    */   {
/* 309:456 */     Calendar calendar = Calendar.getInstance();
/* 310:457 */     calendar.setTime(date);
/* 311:    */     
/* 312:459 */     int year = calendar.get(1);
/* 313:    */     
/* 314:461 */     int day = calendar.get(7);
/* 315:462 */     if (day == 1) {
/* 316:463 */       calendar.add(5, 0);
/* 317:    */     } else {
/* 318:465 */       calendar.add(5, 8 - day);
/* 319:    */     }
/* 320:468 */     if (calendar.get(1) > year) {
/* 321:    */       try
/* 322:    */       {
/* 323:470 */         return new SimpleDateFormat("yyyy-MM-dd").parse(year + "-12" + "-31");
/* 324:    */       }
/* 325:    */       catch (ParseException e)
/* 326:    */       {
/* 327:472 */         e.printStackTrace();
/* 328:    */       }
/* 329:    */     }
/* 330:475 */     return calendar.getTime();
/* 331:    */   }
/* 332:    */   
/* 333:    */   public static Date getMonthEnd(Date date)
/* 334:    */   {
/* 335:479 */     Calendar calendar = Calendar.getInstance();
/* 336:480 */     calendar.setTime(date);
/* 337:    */     
/* 338:    */ 
/* 339:483 */     int day = calendar.get(5);
/* 340:484 */     int monthDay = calendar.getActualMaximum(5);
/* 341:    */     
/* 342:486 */     calendar.add(5, monthDay - day);
/* 343:    */     
/* 344:    */ 
/* 345:489 */     return calendar.getTime();
/* 346:    */   }
/* 347:    */   
/* 348:    */   public static Date getMonthStart(Date date)
/* 349:    */   {
/* 350:498 */     SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM");
/* 351:    */     
/* 352:500 */     return parse(format1.format(date) + "-01");
/* 353:    */   }
/* 354:    */   
/* 355:    */   public static List<String> getDaysOfBetweenDate(Date start, Date end)
/* 356:    */   {
/* 357:515 */     List<String> result = new ArrayList();
/* 358:    */     
/* 359:    */ 
/* 360:518 */     int diffDays = daysBetween(start, end);
/* 361:    */     
/* 362:    */ 
/* 363:521 */     Date tempDate = start;
/* 364:523 */     for (int i = 1; i < diffDays; i++)
/* 365:    */     {
/* 366:524 */       tempDate = modifyDate(tempDate, 1);
/* 367:525 */       result.add(format(tempDate));
/* 368:    */     }
/* 369:528 */     return result;
/* 370:    */   }
/* 371:    */   
/* 372:    */   public static int getQuarter(Date date)
/* 373:    */   {
/* 374:540 */     int month = getMonth(date);
/* 375:541 */     int result = 0;
/* 376:543 */     if ((month >= 1) && (month <= 3)) {
/* 377:543 */       result = 1;
/* 378:    */     }
/* 379:544 */     if ((month >= 4) && (month <= 6)) {
/* 380:544 */       result = 2;
/* 381:    */     }
/* 382:545 */     if ((month >= 7) && (month <= 9)) {
/* 383:545 */       result = 3;
/* 384:    */     }
/* 385:546 */     if ((month >= 10) && (month <= 12)) {
/* 386:546 */       result = 4;
/* 387:    */     }
/* 388:548 */     return result;
/* 389:    */   }
/* 390:    */   
/* 391:    */   public static Date getWeekOfStartDate(Date date)
/* 392:    */   {
/* 393:562 */     Calendar currentDate = new GregorianCalendar();
/* 394:563 */     currentDate.setTime(date);
/* 395:    */     
/* 396:565 */     currentDate.setFirstDayOfWeek(2);
/* 397:    */     
/* 398:567 */     currentDate.set(11, 0);
/* 399:568 */     currentDate.set(12, 0);
/* 400:569 */     currentDate.set(13, 0);
/* 401:570 */     currentDate.set(7, 2);
/* 402:    */     
/* 403:572 */     return (Date)currentDate.getTime().clone();
/* 404:    */   }
/* 405:    */   
/* 406:    */   public static Date getWeekOfEndDate(Date date)
/* 407:    */   {
/* 408:586 */     Calendar currentDate = new GregorianCalendar();
/* 409:587 */     currentDate.setTime(date);
/* 410:    */     
/* 411:589 */     currentDate.setFirstDayOfWeek(2);
/* 412:    */     
/* 413:591 */     currentDate.set(11, 23);
/* 414:592 */     currentDate.set(12, 59);
/* 415:593 */     currentDate.set(13, 59);
/* 416:594 */     currentDate.set(7, 1);
/* 417:    */     
/* 418:596 */     return (Date)currentDate.getTime().clone();
/* 419:    */   }
/* 420:    */   
/* 421:    */   public static int getWeekOfYear(Date date)
/* 422:    */   {
/* 423:608 */     Calendar cal = getCalendar(date);
/* 424:    */     
/* 425:610 */     return cal.get(3);
/* 426:    */   }
/* 427:    */   
/* 428:    */   public static void main(String[] args)
/* 429:    */   {
///* 430:617 */     Date sta = parse("2014-01-01");
///* 431:618 */     Date end = parse("2014-01-01");
///* 432:    */     
///* 433:620 */     System.out.println(getWeekOfYear(sta));
///* 434:    */     
///* 435:622 */     System.out.println("start:" + format(getWeekOfStartDate(sta)));
///* 436:623 */     System.out.println("end:" + format(getWeekOfEndDate(sta)));
				}
				
				/**
				 * 获取N秒之后的时间
				 * @return
				 */
				public static Date getExpiredDate(int count){
					
					Long time = System.currentTimeMillis();
					System.out.println("过期时间："+time);
					Date date = new Date(time+count);
					System.out.println("过期时间："+date);
					return date;
				}

 		}







