/*   1:    */ package com.bjrun.util;
/*   2:    */ 
/*   3:    */ import com.jcraft.jsch.ChannelSftp;
/*   4:    */ import com.jcraft.jsch.SftpException;
/*   5:    */ import java.io.File;
/*   6:    */ import java.io.FileInputStream;
/*   7:    */ import java.io.FileNotFoundException;
/*   8:    */ import java.io.IOException;
/*   9:    */ import java.util.Date;
/*  10:    */ import java.util.Map;
/*  11:    */ import org.apache.log4j.Logger;
/*  12:    */ 
/*  13:    */ public class FileMoveThread
/*  14:    */   extends Thread
/*  15:    */ {
/*  16: 27 */   private static Logger logger = Logger.getLogger(FileMoveThread.class);
/*  17:    */   private int runId;
/*  18:    */   private String userName;
/*  19:    */   private String signType;
/*  20:    */   private String signStatus;
/*  21:    */   private Date signTime;
/*  22:    */   private String longitude;
/*  23:    */   private String latitude;
/*  24:    */   private String address;
/*  25:    */   private String deviceUuid;
/*  26:    */   private String osType;
/*  27:    */   private String province;
/*  28:    */   private String city;
/*  29:    */   private String district;
/*  30:    */   private String street;
/*  31:    */   private String streetNumber;
/*  32:    */   
/*  33:    */   public FileMoveThread(int runId, String userName, String signType, String signStatus, Date signTime, String longitude, String latitude, String address, String deviceUuid, String osType, String province, String city, String district, String street, String streetNumber)
/*  34:    */   {
/*  35: 59 */     this.runId = runId;
/*  36: 60 */     this.userName = userName;
/*  37: 61 */     this.signType = signType;
/*  38: 62 */     this.signStatus = signStatus;
/*  39: 63 */     this.signTime = signTime;
/*  40: 64 */     this.longitude = longitude;
/*  41: 65 */     this.latitude = latitude;
/*  42: 66 */     this.address = address;
/*  43: 67 */     this.deviceUuid = deviceUuid;
/*  44: 68 */     this.osType = osType;
/*  45:    */     
/*  46: 70 */     this.province = province;
/*  47: 71 */     this.city = city;
/*  48: 72 */     this.district = district;
/*  49: 73 */     this.street = street;
/*  50: 74 */     this.streetNumber = streetNumber;
/*  51:    */   }
/*  52:    */   
/*  53:    */   public void run()
/*  54:    */   {
/*  55: 79 */     createSignFile(this.runId, this.userName, this.signType, this.signStatus, this.signTime, this.longitude, this.latitude, this.address, this.deviceUuid, this.osType, 
/*  56: 80 */       this.province, this.city, this.district, this.street, this.streetNumber);
/*  57:    */   }
/*  58:    */   
/*  59:    */   /* Error */
/*  60:    */   private void createSignFile(int runId, String userName, String signType, String signStatus, Date signTime, String longitude, String latitude, String address, String deviceUuid, String osType, String province, String city, String district, String street, String streetNumber)
/*  61:    */   {
/*  62:    */     // Byte code:
/*  63:    */     //   0: aconst_null
/*  64:    */     //   1: astore 16
/*  65:    */     //   3: aconst_null
/*  66:    */     //   4: astore 17
/*  67:    */     //   6: aconst_null
/*  68:    */     //   7: astore 18
/*  69:    */     //   9: iconst_0
/*  70:    */     //   10: istore 19
/*  71:    */     //   12: new 78	java/util/Properties
/*  72:    */     //   15: dup
/*  73:    */     //   16: invokespecial 80	java/util/Properties:<init>	()V
/*  74:    */     //   19: astore 20
/*  75:    */     //   21: aload 5
/*  76:    */     //   23: ldc 81
/*  77:    */     //   25: invokestatic 83	com/bjrun/util/DateUtil:format	(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
/*  78:    */     //   28: astore 21
/*  79:    */     //   30: aload 5
/*  80:    */     //   32: ldc 89
/*  81:    */     //   34: invokestatic 83	com/bjrun/util/DateUtil:format	(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
/*  82:    */     //   37: astore 22
/*  83:    */     //   39: new 91	java/io/File
/*  84:    */     //   42: dup
/*  85:    */     //   43: new 93	java/lang/StringBuilder
/*  86:    */     //   46: dup
/*  87:    */     //   47: ldc 95
/*  88:    */     //   49: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/*  89:    */     //   52: aload 22
/*  90:    */     //   54: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  91:    */     //   57: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/*  92:    */     //   60: invokespecial 108	java/io/File:<init>	(Ljava/lang/String;)V
/*  93:    */     //   63: astore 23
/*  94:    */     //   65: aload 23
/*  95:    */     //   67: invokevirtual 109	java/io/File:exists	()Z
/*  96:    */     //   70: ifne +9 -> 79
/*  97:    */     //   73: aload 23
/*  98:    */     //   75: invokevirtual 113	java/io/File:mkdirs	()Z
/*  99:    */     //   78: pop
/* 100:    */     //   79: new 93	java/lang/StringBuilder
/* 101:    */     //   82: dup
/* 102:    */     //   83: ldc 95
/* 103:    */     //   85: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 104:    */     //   88: aload 22
/* 105:    */     //   90: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 106:    */     //   93: ldc 116
/* 107:    */     //   95: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 108:    */     //   98: iload_1
/* 109:    */     //   99: invokevirtual 118	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
/* 110:    */     //   102: ldc 121
/* 111:    */     //   104: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 112:    */     //   107: aload 22
/* 113:    */     //   109: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 114:    */     //   112: ldc 121
/* 115:    */     //   114: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 116:    */     //   117: aload_3
/* 117:    */     //   118: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 118:    */     //   121: ldc 123
/* 119:    */     //   123: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 120:    */     //   126: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 121:    */     //   129: astore 18
/* 122:    */     //   131: aload_2
/* 123:    */     //   132: ifnull +61 -> 193
/* 124:    */     //   135: ldc 125
/* 125:    */     //   137: aload_2
/* 126:    */     //   138: invokevirtual 127	java/lang/String:equals	(Ljava/lang/Object;)Z
/* 127:    */     //   141: ifeq +52 -> 193
/* 128:    */     //   144: ldc 133
/* 129:    */     //   146: astore 24
/* 130:    */     //   148: aload 24
/* 131:    */     //   150: bipush 6
/* 132:    */     //   152: bipush 9
/* 133:    */     //   154: invokevirtual 135	java/lang/String:substring	(II)Ljava/lang/String;
/* 134:    */     //   157: pop
/* 135:    */     //   158: goto +35 -> 193
/* 136:    */     //   161: astore 24
/* 137:    */     //   163: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 138:    */     //   166: new 93	java/lang/StringBuilder
/* 139:    */     //   169: dup
/* 140:    */     //   170: ldc 139
/* 141:    */     //   172: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 142:    */     //   175: aload 18
/* 143:    */     //   177: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 144:    */     //   180: ldc 141
/* 145:    */     //   182: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 146:    */     //   185: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 147:    */     //   188: aload 24
/* 148:    */     //   190: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 149:    */     //   193: new 147	java/io/FileOutputStream
/* 150:    */     //   196: dup
/* 151:    */     //   197: aload 18
/* 152:    */     //   199: iconst_1
/* 153:    */     //   200: invokespecial 149	java/io/FileOutputStream:<init>	(Ljava/lang/String;Z)V
/* 154:    */     //   203: astore 16
/* 155:    */     //   205: new 152	java/io/OutputStreamWriter
/* 156:    */     //   208: dup
/* 157:    */     //   209: aload 16
/* 158:    */     //   211: ldc 154
/* 159:    */     //   213: invokespecial 156	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
/* 160:    */     //   216: astore 17
/* 161:    */     //   218: aload 20
/* 162:    */     //   220: ldc 159
/* 163:    */     //   222: iload_1
/* 164:    */     //   223: invokestatic 161	java/lang/String:valueOf	(I)Ljava/lang/String;
/* 165:    */     //   226: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 166:    */     //   229: pop
/* 167:    */     //   230: aload 20
/* 168:    */     //   232: ldc 169
/* 169:    */     //   234: aload_2
/* 170:    */     //   235: ifnonnull +8 -> 243
/* 171:    */     //   238: ldc 170
/* 172:    */     //   240: goto +4 -> 244
/* 173:    */     //   243: aload_2
/* 174:    */     //   244: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 175:    */     //   247: pop
/* 176:    */     //   248: aload 20
/* 177:    */     //   250: ldc 172
/* 178:    */     //   252: aload_3
/* 179:    */     //   253: ifnonnull +8 -> 261
/* 180:    */     //   256: ldc 170
/* 181:    */     //   258: goto +4 -> 262
/* 182:    */     //   261: aload_3
/* 183:    */     //   262: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 184:    */     //   265: pop
/* 185:    */     //   266: aload 20
/* 186:    */     //   268: ldc 173
/* 187:    */     //   270: aload 4
/* 188:    */     //   272: ifnonnull +8 -> 280
/* 189:    */     //   275: ldc 170
/* 190:    */     //   277: goto +5 -> 282
/* 191:    */     //   280: aload 4
/* 192:    */     //   282: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 193:    */     //   285: pop
/* 194:    */     //   286: aload 20
/* 195:    */     //   288: ldc 174
/* 196:    */     //   290: aload 21
/* 197:    */     //   292: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 198:    */     //   295: pop
/* 199:    */     //   296: aload 20
/* 200:    */     //   298: ldc 175
/* 201:    */     //   300: aload 6
/* 202:    */     //   302: ifnonnull +8 -> 310
/* 203:    */     //   305: ldc 170
/* 204:    */     //   307: goto +5 -> 312
/* 205:    */     //   310: aload 6
/* 206:    */     //   312: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 207:    */     //   315: pop
/* 208:    */     //   316: aload 20
/* 209:    */     //   318: ldc 176
/* 210:    */     //   320: aload 7
/* 211:    */     //   322: ifnonnull +8 -> 330
/* 212:    */     //   325: ldc 170
/* 213:    */     //   327: goto +5 -> 332
/* 214:    */     //   330: aload 7
/* 215:    */     //   332: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 216:    */     //   335: pop
/* 217:    */     //   336: aload 20
/* 218:    */     //   338: ldc 177
/* 219:    */     //   340: aload 8
/* 220:    */     //   342: ifnonnull +8 -> 350
/* 221:    */     //   345: ldc 170
/* 222:    */     //   347: goto +5 -> 352
/* 223:    */     //   350: aload 8
/* 224:    */     //   352: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 225:    */     //   355: pop
/* 226:    */     //   356: aload 20
/* 227:    */     //   358: ldc 178
/* 228:    */     //   360: aload 9
/* 229:    */     //   362: ifnonnull +8 -> 370
/* 230:    */     //   365: ldc 170
/* 231:    */     //   367: goto +5 -> 372
/* 232:    */     //   370: aload 9
/* 233:    */     //   372: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 234:    */     //   375: pop
/* 235:    */     //   376: aload 20
/* 236:    */     //   378: ldc 179
/* 237:    */     //   380: aload 10
/* 238:    */     //   382: ifnonnull +8 -> 390
/* 239:    */     //   385: ldc 170
/* 240:    */     //   387: goto +5 -> 392
/* 241:    */     //   390: aload 10
/* 242:    */     //   392: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 243:    */     //   395: pop
/* 244:    */     //   396: aload 20
/* 245:    */     //   398: ldc 180
/* 246:    */     //   400: aload 11
/* 247:    */     //   402: ifnonnull +8 -> 410
/* 248:    */     //   405: ldc 170
/* 249:    */     //   407: goto +5 -> 412
/* 250:    */     //   410: aload 11
/* 251:    */     //   412: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 252:    */     //   415: pop
/* 253:    */     //   416: aload 20
/* 254:    */     //   418: ldc 181
/* 255:    */     //   420: aload 12
/* 256:    */     //   422: ifnonnull +8 -> 430
/* 257:    */     //   425: ldc 170
/* 258:    */     //   427: goto +5 -> 432
/* 259:    */     //   430: aload 12
/* 260:    */     //   432: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 261:    */     //   435: pop
/* 262:    */     //   436: aload 20
/* 263:    */     //   438: ldc 182
/* 264:    */     //   440: aload 13
/* 265:    */     //   442: ifnonnull +8 -> 450
/* 266:    */     //   445: ldc 170
/* 267:    */     //   447: goto +5 -> 452
/* 268:    */     //   450: aload 13
/* 269:    */     //   452: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 270:    */     //   455: pop
/* 271:    */     //   456: aload 20
/* 272:    */     //   458: ldc 183
/* 273:    */     //   460: aload 14
/* 274:    */     //   462: ifnonnull +8 -> 470
/* 275:    */     //   465: ldc 170
/* 276:    */     //   467: goto +5 -> 472
/* 277:    */     //   470: aload 14
/* 278:    */     //   472: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 279:    */     //   475: pop
/* 280:    */     //   476: aload 20
/* 281:    */     //   478: ldc 184
/* 282:    */     //   480: aload 15
/* 283:    */     //   482: ifnonnull +8 -> 490
/* 284:    */     //   485: ldc 170
/* 285:    */     //   487: goto +5 -> 492
/* 286:    */     //   490: aload 15
/* 287:    */     //   492: invokevirtual 165	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 288:    */     //   495: pop
/* 289:    */     //   496: aload 20
/* 290:    */     //   498: aload 17
/* 291:    */     //   500: aconst_null
/* 292:    */     //   501: invokevirtual 185	java/util/Properties:store	(Ljava/io/Writer;Ljava/lang/String;)V
/* 293:    */     //   504: iconst_1
/* 294:    */     //   505: istore 19
/* 295:    */     //   507: goto +466 -> 973
/* 296:    */     //   510: astore 20
/* 297:    */     //   512: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 298:    */     //   515: new 93	java/lang/StringBuilder
/* 299:    */     //   518: dup
/* 300:    */     //   519: ldc 139
/* 301:    */     //   521: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 302:    */     //   524: aload 18
/* 303:    */     //   526: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 304:    */     //   529: ldc 189
/* 305:    */     //   531: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 306:    */     //   534: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 307:    */     //   537: aload 20
/* 308:    */     //   539: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 309:    */     //   542: aload 20
/* 310:    */     //   544: invokevirtual 191	java/io/IOException:printStackTrace	()V
/* 311:    */     //   547: aload 16
/* 312:    */     //   549: ifnull +8 -> 557
/* 313:    */     //   552: aload 16
/* 314:    */     //   554: invokevirtual 196	java/io/FileOutputStream:flush	()V
/* 315:    */     //   557: aload 17
/* 316:    */     //   559: ifnull +8 -> 567
/* 317:    */     //   562: aload 17
/* 318:    */     //   564: invokevirtual 199	java/io/OutputStreamWriter:flush	()V
/* 319:    */     //   567: aload 17
/* 320:    */     //   569: ifnull +8 -> 577
/* 321:    */     //   572: aload 17
/* 322:    */     //   574: invokevirtual 200	java/io/OutputStreamWriter:close	()V
/* 323:    */     //   577: aload 16
/* 324:    */     //   579: ifnull +8 -> 587
/* 325:    */     //   582: aload 16
/* 326:    */     //   584: invokevirtual 203	java/io/FileOutputStream:close	()V
/* 327:    */     //   587: iload 19
/* 328:    */     //   589: ifeq +510 -> 1099
/* 329:    */     //   592: aload_0
/* 330:    */     //   593: aload 18
/* 331:    */     //   595: invokespecial 204	com/bjrun/util/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 332:    */     //   598: goto +501 -> 1099
/* 333:    */     //   601: astore 26
/* 334:    */     //   603: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 335:    */     //   606: new 93	java/lang/StringBuilder
/* 336:    */     //   609: dup
/* 337:    */     //   610: ldc 139
/* 338:    */     //   612: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 339:    */     //   615: aload 18
/* 340:    */     //   617: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 341:    */     //   620: ldc 207
/* 342:    */     //   622: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 343:    */     //   625: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 344:    */     //   628: aload 26
/* 345:    */     //   630: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 346:    */     //   633: goto +466 -> 1099
/* 347:    */     //   636: astore 26
/* 348:    */     //   638: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 349:    */     //   641: new 93	java/lang/StringBuilder
/* 350:    */     //   644: dup
/* 351:    */     //   645: ldc 139
/* 352:    */     //   647: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 353:    */     //   650: aload 18
/* 354:    */     //   652: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 355:    */     //   655: ldc 209
/* 356:    */     //   657: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 357:    */     //   660: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 358:    */     //   663: aload 26
/* 359:    */     //   665: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 360:    */     //   668: aload 26
/* 361:    */     //   670: invokevirtual 211	java/lang/Exception:printStackTrace	()V
/* 362:    */     //   673: goto +426 -> 1099
/* 363:    */     //   676: astore 20
/* 364:    */     //   678: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 365:    */     //   681: new 93	java/lang/StringBuilder
/* 366:    */     //   684: dup
/* 367:    */     //   685: ldc 139
/* 368:    */     //   687: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 369:    */     //   690: aload 18
/* 370:    */     //   692: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 371:    */     //   695: ldc 214
/* 372:    */     //   697: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 373:    */     //   700: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 374:    */     //   703: aload 20
/* 375:    */     //   705: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 376:    */     //   708: aload 20
/* 377:    */     //   710: invokevirtual 211	java/lang/Exception:printStackTrace	()V
/* 378:    */     //   713: aload 16
/* 379:    */     //   715: ifnull +8 -> 723
/* 380:    */     //   718: aload 16
/* 381:    */     //   720: invokevirtual 196	java/io/FileOutputStream:flush	()V
/* 382:    */     //   723: aload 17
/* 383:    */     //   725: ifnull +8 -> 733
/* 384:    */     //   728: aload 17
/* 385:    */     //   730: invokevirtual 199	java/io/OutputStreamWriter:flush	()V
/* 386:    */     //   733: aload 17
/* 387:    */     //   735: ifnull +8 -> 743
/* 388:    */     //   738: aload 17
/* 389:    */     //   740: invokevirtual 200	java/io/OutputStreamWriter:close	()V
/* 390:    */     //   743: aload 16
/* 391:    */     //   745: ifnull +8 -> 753
/* 392:    */     //   748: aload 16
/* 393:    */     //   750: invokevirtual 203	java/io/FileOutputStream:close	()V
/* 394:    */     //   753: iload 19
/* 395:    */     //   755: ifeq +344 -> 1099
/* 396:    */     //   758: aload_0
/* 397:    */     //   759: aload 18
/* 398:    */     //   761: invokespecial 204	com/bjrun/util/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 399:    */     //   764: goto +335 -> 1099
/* 400:    */     //   767: astore 26
/* 401:    */     //   769: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 402:    */     //   772: new 93	java/lang/StringBuilder
/* 403:    */     //   775: dup
/* 404:    */     //   776: ldc 139
/* 405:    */     //   778: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 406:    */     //   781: aload 18
/* 407:    */     //   783: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 408:    */     //   786: ldc 207
/* 409:    */     //   788: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 410:    */     //   791: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 411:    */     //   794: aload 26
/* 412:    */     //   796: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 413:    */     //   799: goto +300 -> 1099
/* 414:    */     //   802: astore 26
/* 415:    */     //   804: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 416:    */     //   807: new 93	java/lang/StringBuilder
/* 417:    */     //   810: dup
/* 418:    */     //   811: ldc 139
/* 419:    */     //   813: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 420:    */     //   816: aload 18
/* 421:    */     //   818: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 422:    */     //   821: ldc 209
/* 423:    */     //   823: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 424:    */     //   826: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 425:    */     //   829: aload 26
/* 426:    */     //   831: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 427:    */     //   834: aload 26
/* 428:    */     //   836: invokevirtual 211	java/lang/Exception:printStackTrace	()V
/* 429:    */     //   839: goto +260 -> 1099
/* 430:    */     //   842: astore 25
/* 431:    */     //   844: aload 16
/* 432:    */     //   846: ifnull +8 -> 854
/* 433:    */     //   849: aload 16
/* 434:    */     //   851: invokevirtual 196	java/io/FileOutputStream:flush	()V
/* 435:    */     //   854: aload 17
/* 436:    */     //   856: ifnull +8 -> 864
/* 437:    */     //   859: aload 17
/* 438:    */     //   861: invokevirtual 199	java/io/OutputStreamWriter:flush	()V
/* 439:    */     //   864: aload 17
/* 440:    */     //   866: ifnull +8 -> 874
/* 441:    */     //   869: aload 17
/* 442:    */     //   871: invokevirtual 200	java/io/OutputStreamWriter:close	()V
/* 443:    */     //   874: aload 16
/* 444:    */     //   876: ifnull +8 -> 884
/* 445:    */     //   879: aload 16
/* 446:    */     //   881: invokevirtual 203	java/io/FileOutputStream:close	()V
/* 447:    */     //   884: iload 19
/* 448:    */     //   886: ifeq +84 -> 970
/* 449:    */     //   889: aload_0
/* 450:    */     //   890: aload 18
/* 451:    */     //   892: invokespecial 204	com/bjrun/util/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 452:    */     //   895: goto +75 -> 970
/* 453:    */     //   898: astore 26
/* 454:    */     //   900: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 455:    */     //   903: new 93	java/lang/StringBuilder
/* 456:    */     //   906: dup
/* 457:    */     //   907: ldc 139
/* 458:    */     //   909: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 459:    */     //   912: aload 18
/* 460:    */     //   914: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 461:    */     //   917: ldc 207
/* 462:    */     //   919: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 463:    */     //   922: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 464:    */     //   925: aload 26
/* 465:    */     //   927: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 466:    */     //   930: goto +40 -> 970
/* 467:    */     //   933: astore 26
/* 468:    */     //   935: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 469:    */     //   938: new 93	java/lang/StringBuilder
/* 470:    */     //   941: dup
/* 471:    */     //   942: ldc 139
/* 472:    */     //   944: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 473:    */     //   947: aload 18
/* 474:    */     //   949: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 475:    */     //   952: ldc 209
/* 476:    */     //   954: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 477:    */     //   957: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 478:    */     //   960: aload 26
/* 479:    */     //   962: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 480:    */     //   965: aload 26
/* 481:    */     //   967: invokevirtual 211	java/lang/Exception:printStackTrace	()V
/* 482:    */     //   970: aload 25
/* 483:    */     //   972: athrow
/* 484:    */     //   973: aload 16
/* 485:    */     //   975: ifnull +8 -> 983
/* 486:    */     //   978: aload 16
/* 487:    */     //   980: invokevirtual 196	java/io/FileOutputStream:flush	()V
/* 488:    */     //   983: aload 17
/* 489:    */     //   985: ifnull +8 -> 993
/* 490:    */     //   988: aload 17
/* 491:    */     //   990: invokevirtual 199	java/io/OutputStreamWriter:flush	()V
/* 492:    */     //   993: aload 17
/* 493:    */     //   995: ifnull +8 -> 1003
/* 494:    */     //   998: aload 17
/* 495:    */     //   1000: invokevirtual 200	java/io/OutputStreamWriter:close	()V
/* 496:    */     //   1003: aload 16
/* 497:    */     //   1005: ifnull +8 -> 1013
/* 498:    */     //   1008: aload 16
/* 499:    */     //   1010: invokevirtual 203	java/io/FileOutputStream:close	()V
/* 500:    */     //   1013: iload 19
/* 501:    */     //   1015: ifeq +84 -> 1099
/* 502:    */     //   1018: aload_0
/* 503:    */     //   1019: aload 18
/* 504:    */     //   1021: invokespecial 204	com/bjrun/util/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 505:    */     //   1024: goto +75 -> 1099
/* 506:    */     //   1027: astore 26
/* 507:    */     //   1029: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 508:    */     //   1032: new 93	java/lang/StringBuilder
/* 509:    */     //   1035: dup
/* 510:    */     //   1036: ldc 139
/* 511:    */     //   1038: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 512:    */     //   1041: aload 18
/* 513:    */     //   1043: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 514:    */     //   1046: ldc 207
/* 515:    */     //   1048: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 516:    */     //   1051: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 517:    */     //   1054: aload 26
/* 518:    */     //   1056: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 519:    */     //   1059: goto +40 -> 1099
/* 520:    */     //   1062: astore 26
/* 521:    */     //   1064: getstatic 34	com/bjrun/util/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 522:    */     //   1067: new 93	java/lang/StringBuilder
/* 523:    */     //   1070: dup
/* 524:    */     //   1071: ldc 139
/* 525:    */     //   1073: invokespecial 97	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 526:    */     //   1076: aload 18
/* 527:    */     //   1078: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 528:    */     //   1081: ldc 209
/* 529:    */     //   1083: invokevirtual 100	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 530:    */     //   1086: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 531:    */     //   1089: aload 26
/* 532:    */     //   1091: invokevirtual 143	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 533:    */     //   1094: aload 26
/* 534:    */     //   1096: invokevirtual 211	java/lang/Exception:printStackTrace	()V
/* 535:    */     //   1099: return
/* 536:    */     // Line number table:
/* 537:    */     //   Java source line #101	-> byte code offset #0
/* 538:    */     //   Java source line #102	-> byte code offset #3
/* 539:    */     //   Java source line #103	-> byte code offset #6
/* 540:    */     //   Java source line #104	-> byte code offset #9
/* 541:    */     //   Java source line #106	-> byte code offset #12
/* 542:    */     //   Java source line #108	-> byte code offset #21
/* 543:    */     //   Java source line #109	-> byte code offset #30
/* 544:    */     //   Java source line #111	-> byte code offset #39
/* 545:    */     //   Java source line #112	-> byte code offset #65
/* 546:    */     //   Java source line #113	-> byte code offset #73
/* 547:    */     //   Java source line #116	-> byte code offset #79
/* 548:    */     //   Java source line #118	-> byte code offset #131
/* 549:    */     //   Java source line #120	-> byte code offset #144
/* 550:    */     //   Java source line #122	-> byte code offset #148
/* 551:    */     //   Java source line #124	-> byte code offset #161
/* 552:    */     //   Java source line #125	-> byte code offset #163
/* 553:    */     //   Java source line #130	-> byte code offset #193
/* 554:    */     //   Java source line #131	-> byte code offset #205
/* 555:    */     //   Java source line #133	-> byte code offset #218
/* 556:    */     //   Java source line #134	-> byte code offset #230
/* 557:    */     //   Java source line #135	-> byte code offset #248
/* 558:    */     //   Java source line #136	-> byte code offset #266
/* 559:    */     //   Java source line #137	-> byte code offset #286
/* 560:    */     //   Java source line #138	-> byte code offset #296
/* 561:    */     //   Java source line #139	-> byte code offset #316
/* 562:    */     //   Java source line #140	-> byte code offset #336
/* 563:    */     //   Java source line #141	-> byte code offset #356
/* 564:    */     //   Java source line #142	-> byte code offset #376
/* 565:    */     //   Java source line #144	-> byte code offset #396
/* 566:    */     //   Java source line #145	-> byte code offset #416
/* 567:    */     //   Java source line #146	-> byte code offset #436
/* 568:    */     //   Java source line #147	-> byte code offset #456
/* 569:    */     //   Java source line #148	-> byte code offset #476
/* 570:    */     //   Java source line #150	-> byte code offset #496
/* 571:    */     //   Java source line #152	-> byte code offset #504
/* 572:    */     //   Java source line #153	-> byte code offset #510
/* 573:    */     //   Java source line #154	-> byte code offset #512
/* 574:    */     //   Java source line #155	-> byte code offset #542
/* 575:    */     //   Java source line #161	-> byte code offset #547
/* 576:    */     //   Java source line #162	-> byte code offset #552
/* 577:    */     //   Java source line #164	-> byte code offset #557
/* 578:    */     //   Java source line #165	-> byte code offset #562
/* 579:    */     //   Java source line #167	-> byte code offset #567
/* 580:    */     //   Java source line #168	-> byte code offset #572
/* 581:    */     //   Java source line #170	-> byte code offset #577
/* 582:    */     //   Java source line #171	-> byte code offset #582
/* 583:    */     //   Java source line #173	-> byte code offset #587
/* 584:    */     //   Java source line #176	-> byte code offset #592
/* 585:    */     //   Java source line #177	-> byte code offset #601
/* 586:    */     //   Java source line #178	-> byte code offset #603
/* 587:    */     //   Java source line #181	-> byte code offset #636
/* 588:    */     //   Java source line #182	-> byte code offset #638
/* 589:    */     //   Java source line #183	-> byte code offset #668
/* 590:    */     //   Java source line #156	-> byte code offset #676
/* 591:    */     //   Java source line #157	-> byte code offset #678
/* 592:    */     //   Java source line #158	-> byte code offset #708
/* 593:    */     //   Java source line #161	-> byte code offset #713
/* 594:    */     //   Java source line #162	-> byte code offset #718
/* 595:    */     //   Java source line #164	-> byte code offset #723
/* 596:    */     //   Java source line #165	-> byte code offset #728
/* 597:    */     //   Java source line #167	-> byte code offset #733
/* 598:    */     //   Java source line #168	-> byte code offset #738
/* 599:    */     //   Java source line #170	-> byte code offset #743
/* 600:    */     //   Java source line #171	-> byte code offset #748
/* 601:    */     //   Java source line #173	-> byte code offset #753
/* 602:    */     //   Java source line #176	-> byte code offset #758
/* 603:    */     //   Java source line #177	-> byte code offset #767
/* 604:    */     //   Java source line #178	-> byte code offset #769
/* 605:    */     //   Java source line #181	-> byte code offset #802
/* 606:    */     //   Java source line #182	-> byte code offset #804
/* 607:    */     //   Java source line #183	-> byte code offset #834
/* 608:    */     //   Java source line #159	-> byte code offset #842
/* 609:    */     //   Java source line #161	-> byte code offset #844
/* 610:    */     //   Java source line #162	-> byte code offset #849
/* 611:    */     //   Java source line #164	-> byte code offset #854
/* 612:    */     //   Java source line #165	-> byte code offset #859
/* 613:    */     //   Java source line #167	-> byte code offset #864
/* 614:    */     //   Java source line #168	-> byte code offset #869
/* 615:    */     //   Java source line #170	-> byte code offset #874
/* 616:    */     //   Java source line #171	-> byte code offset #879
/* 617:    */     //   Java source line #173	-> byte code offset #884
/* 618:    */     //   Java source line #176	-> byte code offset #889
/* 619:    */     //   Java source line #177	-> byte code offset #898
/* 620:    */     //   Java source line #178	-> byte code offset #900
/* 621:    */     //   Java source line #181	-> byte code offset #933
/* 622:    */     //   Java source line #182	-> byte code offset #935
/* 623:    */     //   Java source line #183	-> byte code offset #965
/* 624:    */     //   Java source line #185	-> byte code offset #970
/* 625:    */     //   Java source line #161	-> byte code offset #973
/* 626:    */     //   Java source line #162	-> byte code offset #978
/* 627:    */     //   Java source line #164	-> byte code offset #983
/* 628:    */     //   Java source line #165	-> byte code offset #988
/* 629:    */     //   Java source line #167	-> byte code offset #993
/* 630:    */     //   Java source line #168	-> byte code offset #998
/* 631:    */     //   Java source line #170	-> byte code offset #1003
/* 632:    */     //   Java source line #171	-> byte code offset #1008
/* 633:    */     //   Java source line #173	-> byte code offset #1013
/* 634:    */     //   Java source line #176	-> byte code offset #1018
/* 635:    */     //   Java source line #177	-> byte code offset #1027
/* 636:    */     //   Java source line #178	-> byte code offset #1029
/* 637:    */     //   Java source line #181	-> byte code offset #1062
/* 638:    */     //   Java source line #182	-> byte code offset #1064
/* 639:    */     //   Java source line #183	-> byte code offset #1094
/* 640:    */     //   Java source line #186	-> byte code offset #1099
/* 641:    */     // Local variable table:
/* 642:    */     //   start	length	slot	name	signature
/* 643:    */     //   0	1100	0	this	FileMoveThread
/* 644:    */     //   0	1100	1	runId	int
/* 645:    */     //   0	1100	2	userName	String
/* 646:    */     //   0	1100	3	signType	String
/* 647:    */     //   0	1100	4	signStatus	String
/* 648:    */     //   0	1100	5	signTime	Date
/* 649:    */     //   0	1100	6	longitude	String
/* 650:    */     //   0	1100	7	latitude	String
/* 651:    */     //   0	1100	8	address	String
/* 652:    */     //   0	1100	9	deviceUuid	String
/* 653:    */     //   0	1100	10	osType	String
/* 654:    */     //   0	1100	11	province	String
/* 655:    */     //   0	1100	12	city	String
/* 656:    */     //   0	1100	13	district	String
/* 657:    */     //   0	1100	14	street	String
/* 658:    */     //   0	1100	15	streetNumber	String
/* 659:    */     //   1	1008	16	fos	java.io.FileOutputStream
/* 660:    */     //   4	995	17	osw	java.io.OutputStreamWriter
/* 661:    */     //   7	1070	18	signFilePath	String
/* 662:    */     //   10	1004	19	moveFlag	boolean
/* 663:    */     //   19	478	20	p	java.util.Properties
/* 664:    */     //   510	33	20	e	IOException
/* 665:    */     //   676	33	20	e	java.lang.Exception
/* 666:    */     //   28	263	21	formatDateStr	String
/* 667:    */     //   37	71	22	formatDateStr1	String
/* 668:    */     //   63	11	23	fileFloderFile	File
/* 669:    */     //   146	3	24	strTempString	String
/* 670:    */     //   161	28	24	e	java.lang.Exception
/* 671:    */     //   842	129	25	localObject	Object
/* 672:    */     //   601	28	26	e	java.lang.Exception
/* 673:    */     //   636	33	26	e	java.lang.Exception
/* 674:    */     //   767	28	26	e	java.lang.Exception
/* 675:    */     //   802	33	26	e	java.lang.Exception
/* 676:    */     //   898	28	26	e	java.lang.Exception
/* 677:    */     //   933	33	26	e	java.lang.Exception
/* 678:    */     //   1027	28	26	e	java.lang.Exception
/* 679:    */     //   1062	33	26	e	java.lang.Exception
/* 680:    */     // Exception table:
/* 681:    */     //   from	to	target	type
/* 682:    */     //   144	158	161	java/lang/Exception
/* 683:    */     //   12	507	510	java/io/IOException
/* 684:    */     //   592	598	601	java/lang/Exception
/* 685:    */     //   547	633	636	java/lang/Exception
/* 686:    */     //   12	507	676	java/lang/Exception
/* 687:    */     //   758	764	767	java/lang/Exception
/* 688:    */     //   713	799	802	java/lang/Exception
/* 689:    */     //   12	547	842	finally
/* 690:    */     //   676	713	842	finally
/* 691:    */     //   889	895	898	java/lang/Exception
/* 692:    */     //   844	930	933	java/lang/Exception
/* 693:    */     //   1018	1024	1027	java/lang/Exception
/* 694:    */     //   973	1059	1062	java/lang/Exception
/* 695:    */   }
/* 696:    */   
/* 697:    */   private void moveSignFile(String filePath)
/* 698:    */   {
/* 699:193 */     MySFTP sf = new MySFTP();
/* 700:194 */     File signFile = new File(filePath);
/* 701:    */     
/* 702:196 */     Map<String, String> configMap = ConfigUtil.resolveProperties();
/* 703:197 */     ChannelSftp sftp = null;
/* 704:    */     
/* 705:199 */     String host = "192.168.0.88";
/* 706:200 */     int port = 22;
/* 707:201 */     String username = "root";
/* 708:202 */     String password = "bjrun@2014yunwei";
/* 709:    */     
/* 710:    */ 
/* 711:    */ 
/* 712:206 */     host = (String)configMap.get("gz_hostIP");
/* 713:207 */     username = (String)configMap.get("gz_hostUname");
/* 714:208 */     password = (String)configMap.get("gz_hostPwd");
/* 715:    */     
/* 716:210 */     String gz_sign_path = (String)configMap.get("gz_sign_path");
/* 717:    */     
/* 718:212 */     sftp = sf.getConnect(host, port, username, password);
/* 719:214 */     if ((signFile.isFile()) && (signFile.exists()))
/* 720:    */     {
/* 721:215 */       FileInputStream fis = null;
/* 722:    */       try
/* 723:    */       {
/* 724:217 */         sftp.cd(gz_sign_path);
/* 725:218 */         fis = new FileInputStream(signFile);
/* 726:219 */         sftp.put(fis, signFile.getName());
/* 727:    */       }
/* 728:    */       catch (SftpException e)
/* 729:    */       {
/* 730:223 */         logger.error("Sftp连接失败(" + filePath + ")。", e);
/* 731:224 */         e.printStackTrace();
/* 732:    */       }
/* 733:    */       catch (FileNotFoundException e)
/* 734:    */       {
/* 735:226 */         logger.error("打卡文件" + filePath + "未找到。", e);
/* 736:227 */         e.printStackTrace();
/* 737:    */       }
/* 738:    */       finally
/* 739:    */       {
/* 740:229 */         if (fis != null) {
/* 741:    */           try
/* 742:    */           {
/* 743:231 */             fis.close();
/* 744:    */           }
/* 745:    */           catch (IOException e)
/* 746:    */           {
/* 747:233 */             e.printStackTrace();
/* 748:    */           }
/* 749:    */         }
/* 750:236 */         sftp.quit();
/* 751:237 */         sf.closeConn();
/* 752:    */       }
/* 753:    */     }
/* 754:    */   }
/* 755:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.FileMoveThread
 * JD-Core Version:    0.7.0.1
 */