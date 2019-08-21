/*   1:    */ package com.bjrun.test;
/*   2:    */ 
/*   3:    */ import com.bjrun.util.ConfigUtil;
/*   4:    */ import com.bjrun.util.MySFTP;
/*   5:    */ import com.jcraft.jsch.ChannelSftp;
/*   6:    */ import com.jcraft.jsch.SftpException;
/*   7:    */ import java.io.File;
/*   8:    */ import java.io.FileInputStream;
/*   9:    */ import java.io.FileNotFoundException;
/*  10:    */ import java.io.IOException;
/*  11:    */ import java.util.Date;
/*  12:    */ import java.util.Map;
/*  13:    */ import org.apache.log4j.Logger;
/*  14:    */ 
/*  15:    */ public class FileMoveThread
/*  16:    */   extends Thread
/*  17:    */ {
/*  18: 30 */   private static Logger logger = Logger.getLogger(FileMoveThread.class);
/*  19:    */   private int runId;
/*  20:    */   private String userName;
/*  21:    */   private String signType;
/*  22:    */   private String signStatus;
/*  23:    */   private Date signTime;
/*  24:    */   private String longitude;
/*  25:    */   private String latitude;
/*  26:    */   private String address;
/*  27:    */   private String deviceUuid;
/*  28:    */   private String osType;
/*  29:    */   private String province;
/*  30:    */   private String city;
/*  31:    */   private String district;
/*  32:    */   private String street;
/*  33:    */   private String streetNumber;
/*  34:    */   
/*  35:    */   public FileMoveThread(int runId, String userName, String signType, String signStatus, Date signTime, String longitude, String latitude, String address, String deviceUuid, String osType, String province, String city, String district, String street, String streetNumber)
/*  36:    */   {
/*  37: 62 */     this.runId = runId;
/*  38: 63 */     this.userName = userName;
/*  39: 64 */     this.signType = signType;
/*  40: 65 */     this.signStatus = signStatus;
/*  41: 66 */     this.signTime = signTime;
/*  42: 67 */     this.longitude = longitude;
/*  43: 68 */     this.latitude = latitude;
/*  44: 69 */     this.address = address;
/*  45: 70 */     this.deviceUuid = deviceUuid;
/*  46: 71 */     this.osType = osType;
/*  47:    */     
/*  48: 73 */     this.province = province;
/*  49: 74 */     this.city = city;
/*  50: 75 */     this.district = district;
/*  51: 76 */     this.street = street;
/*  52: 77 */     this.streetNumber = streetNumber;
/*  53:    */   }
/*  54:    */   
/*  55:    */   public void run()
/*  56:    */   {
/*  57: 82 */     createSignFile(this.runId, this.userName, this.signType, this.signStatus, this.signTime, this.longitude, this.latitude, this.address, this.deviceUuid, this.osType, 
/*  58: 83 */       this.province, this.city, this.district, this.street, this.streetNumber);
/*  59:    */   }
/*  60:    */   
/*  61:    */   /* Error */
/*  62:    */   private void createSignFile(int runId, String userName, String signType, String signStatus, Date signTime, String longitude, String latitude, String address, String deviceUuid, String osType, String province, String city, String district, String street, String streetNumber)
/*  63:    */   {
/*  64:    */     // Byte code:
/*  65:    */     //   0: new 78	java/util/Properties
/*  66:    */     //   3: dup
/*  67:    */     //   4: invokespecial 80	java/util/Properties:<init>	()V
/*  68:    */     //   7: astore 16
/*  69:    */     //   9: aload 5
/*  70:    */     //   11: ldc 81
/*  71:    */     //   13: invokestatic 83	com/bjrun/util/DateUtil:format	(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
/*  72:    */     //   16: astore 17
/*  73:    */     //   18: aload 5
/*  74:    */     //   20: ldc 89
/*  75:    */     //   22: invokestatic 83	com/bjrun/util/DateUtil:format	(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
/*  76:    */     //   25: astore 18
/*  77:    */     //   27: new 91	java/lang/StringBuilder
/*  78:    */     //   30: dup
/*  79:    */     //   31: ldc 93
/*  80:    */     //   33: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/*  81:    */     //   36: iload_1
/*  82:    */     //   37: invokevirtual 98	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
/*  83:    */     //   40: ldc 102
/*  84:    */     //   42: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  85:    */     //   45: aload 18
/*  86:    */     //   47: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  87:    */     //   50: ldc 102
/*  88:    */     //   52: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  89:    */     //   55: aload_3
/*  90:    */     //   56: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  91:    */     //   59: ldc 107
/*  92:    */     //   61: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*  93:    */     //   64: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/*  94:    */     //   67: astore 19
/*  95:    */     //   69: aconst_null
/*  96:    */     //   70: astore 20
/*  97:    */     //   72: aconst_null
/*  98:    */     //   73: astore 21
/*  99:    */     //   75: iconst_0
/* 100:    */     //   76: istore 22
/* 101:    */     //   78: aload_2
/* 102:    */     //   79: ifnull +61 -> 140
/* 103:    */     //   82: ldc 113
/* 104:    */     //   84: aload_2
/* 105:    */     //   85: invokevirtual 115	java/lang/String:equals	(Ljava/lang/Object;)Z
/* 106:    */     //   88: ifeq +52 -> 140
/* 107:    */     //   91: ldc 121
/* 108:    */     //   93: astore 23
/* 109:    */     //   95: aload 23
/* 110:    */     //   97: bipush 6
/* 111:    */     //   99: bipush 9
/* 112:    */     //   101: invokevirtual 123	java/lang/String:substring	(II)Ljava/lang/String;
/* 113:    */     //   104: pop
/* 114:    */     //   105: goto +35 -> 140
/* 115:    */     //   108: astore 23
/* 116:    */     //   110: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 117:    */     //   113: new 91	java/lang/StringBuilder
/* 118:    */     //   116: dup
/* 119:    */     //   117: ldc 127
/* 120:    */     //   119: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 121:    */     //   122: aload 19
/* 122:    */     //   124: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 123:    */     //   127: ldc 129
/* 124:    */     //   129: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 125:    */     //   132: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 126:    */     //   135: aload 23
/* 127:    */     //   137: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 128:    */     //   140: new 135	java/io/FileOutputStream
/* 129:    */     //   143: dup
/* 130:    */     //   144: aload 19
/* 131:    */     //   146: iconst_1
/* 132:    */     //   147: invokespecial 137	java/io/FileOutputStream:<init>	(Ljava/lang/String;Z)V
/* 133:    */     //   150: astore 20
/* 134:    */     //   152: new 140	java/io/OutputStreamWriter
/* 135:    */     //   155: dup
/* 136:    */     //   156: aload 20
/* 137:    */     //   158: ldc 142
/* 138:    */     //   160: invokespecial 144	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
/* 139:    */     //   163: astore 21
/* 140:    */     //   165: aload 16
/* 141:    */     //   167: ldc 147
/* 142:    */     //   169: iload_1
/* 143:    */     //   170: invokestatic 149	java/lang/String:valueOf	(I)Ljava/lang/String;
/* 144:    */     //   173: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 145:    */     //   176: pop
/* 146:    */     //   177: aload 16
/* 147:    */     //   179: ldc 157
/* 148:    */     //   181: aload_2
/* 149:    */     //   182: ifnonnull +8 -> 190
/* 150:    */     //   185: ldc 158
/* 151:    */     //   187: goto +4 -> 191
/* 152:    */     //   190: aload_2
/* 153:    */     //   191: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 154:    */     //   194: pop
/* 155:    */     //   195: aload 16
/* 156:    */     //   197: ldc 160
/* 157:    */     //   199: aload_3
/* 158:    */     //   200: ifnonnull +8 -> 208
/* 159:    */     //   203: ldc 158
/* 160:    */     //   205: goto +4 -> 209
/* 161:    */     //   208: aload_3
/* 162:    */     //   209: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 163:    */     //   212: pop
/* 164:    */     //   213: aload 16
/* 165:    */     //   215: ldc 161
/* 166:    */     //   217: aload 4
/* 167:    */     //   219: ifnonnull +8 -> 227
/* 168:    */     //   222: ldc 158
/* 169:    */     //   224: goto +5 -> 229
/* 170:    */     //   227: aload 4
/* 171:    */     //   229: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 172:    */     //   232: pop
/* 173:    */     //   233: aload 16
/* 174:    */     //   235: ldc 162
/* 175:    */     //   237: aload 17
/* 176:    */     //   239: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 177:    */     //   242: pop
/* 178:    */     //   243: aload 16
/* 179:    */     //   245: ldc 163
/* 180:    */     //   247: aload 6
/* 181:    */     //   249: ifnonnull +8 -> 257
/* 182:    */     //   252: ldc 158
/* 183:    */     //   254: goto +5 -> 259
/* 184:    */     //   257: aload 6
/* 185:    */     //   259: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 186:    */     //   262: pop
/* 187:    */     //   263: aload 16
/* 188:    */     //   265: ldc 164
/* 189:    */     //   267: aload 7
/* 190:    */     //   269: ifnonnull +8 -> 277
/* 191:    */     //   272: ldc 158
/* 192:    */     //   274: goto +5 -> 279
/* 193:    */     //   277: aload 7
/* 194:    */     //   279: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 195:    */     //   282: pop
/* 196:    */     //   283: aload 16
/* 197:    */     //   285: ldc 165
/* 198:    */     //   287: aload 8
/* 199:    */     //   289: ifnonnull +8 -> 297
/* 200:    */     //   292: ldc 158
/* 201:    */     //   294: goto +5 -> 299
/* 202:    */     //   297: aload 8
/* 203:    */     //   299: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 204:    */     //   302: pop
/* 205:    */     //   303: aload 16
/* 206:    */     //   305: ldc 166
/* 207:    */     //   307: aload 9
/* 208:    */     //   309: ifnonnull +8 -> 317
/* 209:    */     //   312: ldc 158
/* 210:    */     //   314: goto +5 -> 319
/* 211:    */     //   317: aload 9
/* 212:    */     //   319: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 213:    */     //   322: pop
/* 214:    */     //   323: aload 16
/* 215:    */     //   325: ldc 167
/* 216:    */     //   327: aload 10
/* 217:    */     //   329: ifnonnull +8 -> 337
/* 218:    */     //   332: ldc 158
/* 219:    */     //   334: goto +5 -> 339
/* 220:    */     //   337: aload 10
/* 221:    */     //   339: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 222:    */     //   342: pop
/* 223:    */     //   343: aload 16
/* 224:    */     //   345: ldc 168
/* 225:    */     //   347: aload 11
/* 226:    */     //   349: ifnonnull +8 -> 357
/* 227:    */     //   352: ldc 158
/* 228:    */     //   354: goto +5 -> 359
/* 229:    */     //   357: aload 11
/* 230:    */     //   359: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 231:    */     //   362: pop
/* 232:    */     //   363: aload 16
/* 233:    */     //   365: ldc 169
/* 234:    */     //   367: aload 12
/* 235:    */     //   369: ifnonnull +8 -> 377
/* 236:    */     //   372: ldc 158
/* 237:    */     //   374: goto +5 -> 379
/* 238:    */     //   377: aload 12
/* 239:    */     //   379: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 240:    */     //   382: pop
/* 241:    */     //   383: aload 16
/* 242:    */     //   385: ldc 170
/* 243:    */     //   387: aload 13
/* 244:    */     //   389: ifnonnull +8 -> 397
/* 245:    */     //   392: ldc 158
/* 246:    */     //   394: goto +5 -> 399
/* 247:    */     //   397: aload 13
/* 248:    */     //   399: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 249:    */     //   402: pop
/* 250:    */     //   403: aload 16
/* 251:    */     //   405: ldc 171
/* 252:    */     //   407: aload 14
/* 253:    */     //   409: ifnonnull +8 -> 417
/* 254:    */     //   412: ldc 158
/* 255:    */     //   414: goto +5 -> 419
/* 256:    */     //   417: aload 14
/* 257:    */     //   419: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 258:    */     //   422: pop
/* 259:    */     //   423: aload 16
/* 260:    */     //   425: ldc 172
/* 261:    */     //   427: aload 15
/* 262:    */     //   429: ifnonnull +8 -> 437
/* 263:    */     //   432: ldc 158
/* 264:    */     //   434: goto +5 -> 439
/* 265:    */     //   437: aload 15
/* 266:    */     //   439: invokevirtual 153	java/util/Properties:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
/* 267:    */     //   442: pop
/* 268:    */     //   443: aload 16
/* 269:    */     //   445: aload 21
/* 270:    */     //   447: aconst_null
/* 271:    */     //   448: invokevirtual 173	java/util/Properties:store	(Ljava/io/Writer;Ljava/lang/String;)V
/* 272:    */     //   451: iconst_1
/* 273:    */     //   452: istore 22
/* 274:    */     //   454: goto +300 -> 754
/* 275:    */     //   457: astore 23
/* 276:    */     //   459: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 277:    */     //   462: new 91	java/lang/StringBuilder
/* 278:    */     //   465: dup
/* 279:    */     //   466: ldc 127
/* 280:    */     //   468: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 281:    */     //   471: aload 19
/* 282:    */     //   473: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 283:    */     //   476: ldc 177
/* 284:    */     //   478: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 285:    */     //   481: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 286:    */     //   484: aload 23
/* 287:    */     //   486: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 288:    */     //   489: aload 23
/* 289:    */     //   491: invokevirtual 179	java/io/IOException:printStackTrace	()V
/* 290:    */     //   494: aload 20
/* 291:    */     //   496: ifnull +8 -> 504
/* 292:    */     //   499: aload 20
/* 293:    */     //   501: invokevirtual 184	java/io/FileOutputStream:flush	()V
/* 294:    */     //   504: aload 21
/* 295:    */     //   506: ifnull +8 -> 514
/* 296:    */     //   509: aload 21
/* 297:    */     //   511: invokevirtual 187	java/io/OutputStreamWriter:flush	()V
/* 298:    */     //   514: aload 21
/* 299:    */     //   516: ifnull +8 -> 524
/* 300:    */     //   519: aload 21
/* 301:    */     //   521: invokevirtual 188	java/io/OutputStreamWriter:close	()V
/* 302:    */     //   524: aload 20
/* 303:    */     //   526: ifnull +8 -> 534
/* 304:    */     //   529: aload 20
/* 305:    */     //   531: invokevirtual 191	java/io/FileOutputStream:close	()V
/* 306:    */     //   534: iload 22
/* 307:    */     //   536: ifeq +344 -> 880
/* 308:    */     //   539: aload_0
/* 309:    */     //   540: aload 19
/* 310:    */     //   542: invokespecial 192	com/bjrun/test/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 311:    */     //   545: goto +335 -> 880
/* 312:    */     //   548: astore 25
/* 313:    */     //   550: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 314:    */     //   553: new 91	java/lang/StringBuilder
/* 315:    */     //   556: dup
/* 316:    */     //   557: ldc 127
/* 317:    */     //   559: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 318:    */     //   562: aload 19
/* 319:    */     //   564: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 320:    */     //   567: ldc 195
/* 321:    */     //   569: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 322:    */     //   572: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 323:    */     //   575: aload 25
/* 324:    */     //   577: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 325:    */     //   580: goto +300 -> 880
/* 326:    */     //   583: astore 25
/* 327:    */     //   585: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 328:    */     //   588: new 91	java/lang/StringBuilder
/* 329:    */     //   591: dup
/* 330:    */     //   592: ldc 127
/* 331:    */     //   594: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 332:    */     //   597: aload 19
/* 333:    */     //   599: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 334:    */     //   602: ldc 197
/* 335:    */     //   604: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 336:    */     //   607: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 337:    */     //   610: aload 25
/* 338:    */     //   612: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 339:    */     //   615: aload 25
/* 340:    */     //   617: invokevirtual 199	java/lang/Exception:printStackTrace	()V
/* 341:    */     //   620: goto +260 -> 880
/* 342:    */     //   623: astore 24
/* 343:    */     //   625: aload 20
/* 344:    */     //   627: ifnull +8 -> 635
/* 345:    */     //   630: aload 20
/* 346:    */     //   632: invokevirtual 184	java/io/FileOutputStream:flush	()V
/* 347:    */     //   635: aload 21
/* 348:    */     //   637: ifnull +8 -> 645
/* 349:    */     //   640: aload 21
/* 350:    */     //   642: invokevirtual 187	java/io/OutputStreamWriter:flush	()V
/* 351:    */     //   645: aload 21
/* 352:    */     //   647: ifnull +8 -> 655
/* 353:    */     //   650: aload 21
/* 354:    */     //   652: invokevirtual 188	java/io/OutputStreamWriter:close	()V
/* 355:    */     //   655: aload 20
/* 356:    */     //   657: ifnull +8 -> 665
/* 357:    */     //   660: aload 20
/* 358:    */     //   662: invokevirtual 191	java/io/FileOutputStream:close	()V
/* 359:    */     //   665: iload 22
/* 360:    */     //   667: ifeq +84 -> 751
/* 361:    */     //   670: aload_0
/* 362:    */     //   671: aload 19
/* 363:    */     //   673: invokespecial 192	com/bjrun/test/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 364:    */     //   676: goto +75 -> 751
/* 365:    */     //   679: astore 25
/* 366:    */     //   681: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 367:    */     //   684: new 91	java/lang/StringBuilder
/* 368:    */     //   687: dup
/* 369:    */     //   688: ldc 127
/* 370:    */     //   690: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 371:    */     //   693: aload 19
/* 372:    */     //   695: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 373:    */     //   698: ldc 195
/* 374:    */     //   700: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 375:    */     //   703: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 376:    */     //   706: aload 25
/* 377:    */     //   708: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 378:    */     //   711: goto +40 -> 751
/* 379:    */     //   714: astore 25
/* 380:    */     //   716: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 381:    */     //   719: new 91	java/lang/StringBuilder
/* 382:    */     //   722: dup
/* 383:    */     //   723: ldc 127
/* 384:    */     //   725: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 385:    */     //   728: aload 19
/* 386:    */     //   730: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 387:    */     //   733: ldc 197
/* 388:    */     //   735: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 389:    */     //   738: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 390:    */     //   741: aload 25
/* 391:    */     //   743: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 392:    */     //   746: aload 25
/* 393:    */     //   748: invokevirtual 199	java/lang/Exception:printStackTrace	()V
/* 394:    */     //   751: aload 24
/* 395:    */     //   753: athrow
/* 396:    */     //   754: aload 20
/* 397:    */     //   756: ifnull +8 -> 764
/* 398:    */     //   759: aload 20
/* 399:    */     //   761: invokevirtual 184	java/io/FileOutputStream:flush	()V
/* 400:    */     //   764: aload 21
/* 401:    */     //   766: ifnull +8 -> 774
/* 402:    */     //   769: aload 21
/* 403:    */     //   771: invokevirtual 187	java/io/OutputStreamWriter:flush	()V
/* 404:    */     //   774: aload 21
/* 405:    */     //   776: ifnull +8 -> 784
/* 406:    */     //   779: aload 21
/* 407:    */     //   781: invokevirtual 188	java/io/OutputStreamWriter:close	()V
/* 408:    */     //   784: aload 20
/* 409:    */     //   786: ifnull +8 -> 794
/* 410:    */     //   789: aload 20
/* 411:    */     //   791: invokevirtual 191	java/io/FileOutputStream:close	()V
/* 412:    */     //   794: iload 22
/* 413:    */     //   796: ifeq +84 -> 880
/* 414:    */     //   799: aload_0
/* 415:    */     //   800: aload 19
/* 416:    */     //   802: invokespecial 192	com/bjrun/test/FileMoveThread:moveSignFile	(Ljava/lang/String;)V
/* 417:    */     //   805: goto +75 -> 880
/* 418:    */     //   808: astore 25
/* 419:    */     //   810: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 420:    */     //   813: new 91	java/lang/StringBuilder
/* 421:    */     //   816: dup
/* 422:    */     //   817: ldc 127
/* 423:    */     //   819: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 424:    */     //   822: aload 19
/* 425:    */     //   824: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 426:    */     //   827: ldc 195
/* 427:    */     //   829: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 428:    */     //   832: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 429:    */     //   835: aload 25
/* 430:    */     //   837: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 431:    */     //   840: goto +40 -> 880
/* 432:    */     //   843: astore 25
/* 433:    */     //   845: getstatic 34	com/bjrun/test/FileMoveThread:logger	Lorg/apache/log4j/Logger;
/* 434:    */     //   848: new 91	java/lang/StringBuilder
/* 435:    */     //   851: dup
/* 436:    */     //   852: ldc 127
/* 437:    */     //   854: invokespecial 95	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/* 438:    */     //   857: aload 19
/* 439:    */     //   859: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 440:    */     //   862: ldc 197
/* 441:    */     //   864: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/* 442:    */     //   867: invokevirtual 109	java/lang/StringBuilder:toString	()Ljava/lang/String;
/* 443:    */     //   870: aload 25
/* 444:    */     //   872: invokevirtual 131	org/apache/log4j/Logger:error	(Ljava/lang/Object;Ljava/lang/Throwable;)V
/* 445:    */     //   875: aload 25
/* 446:    */     //   877: invokevirtual 199	java/lang/Exception:printStackTrace	()V
/* 447:    */     //   880: return
/* 448:    */     // Line number table:
/* 449:    */     //   Java source line #103	-> byte code offset #0
/* 450:    */     //   Java source line #105	-> byte code offset #9
/* 451:    */     //   Java source line #106	-> byte code offset #18
/* 452:    */     //   Java source line #108	-> byte code offset #27
/* 453:    */     //   Java source line #112	-> byte code offset #69
/* 454:    */     //   Java source line #113	-> byte code offset #72
/* 455:    */     //   Java source line #115	-> byte code offset #75
/* 456:    */     //   Java source line #117	-> byte code offset #78
/* 457:    */     //   Java source line #119	-> byte code offset #91
/* 458:    */     //   Java source line #121	-> byte code offset #95
/* 459:    */     //   Java source line #123	-> byte code offset #108
/* 460:    */     //   Java source line #124	-> byte code offset #110
/* 461:    */     //   Java source line #130	-> byte code offset #140
/* 462:    */     //   Java source line #131	-> byte code offset #152
/* 463:    */     //   Java source line #133	-> byte code offset #165
/* 464:    */     //   Java source line #134	-> byte code offset #177
/* 465:    */     //   Java source line #135	-> byte code offset #195
/* 466:    */     //   Java source line #136	-> byte code offset #213
/* 467:    */     //   Java source line #137	-> byte code offset #233
/* 468:    */     //   Java source line #138	-> byte code offset #243
/* 469:    */     //   Java source line #139	-> byte code offset #263
/* 470:    */     //   Java source line #140	-> byte code offset #283
/* 471:    */     //   Java source line #141	-> byte code offset #303
/* 472:    */     //   Java source line #142	-> byte code offset #323
/* 473:    */     //   Java source line #144	-> byte code offset #343
/* 474:    */     //   Java source line #145	-> byte code offset #363
/* 475:    */     //   Java source line #146	-> byte code offset #383
/* 476:    */     //   Java source line #147	-> byte code offset #403
/* 477:    */     //   Java source line #148	-> byte code offset #423
/* 478:    */     //   Java source line #150	-> byte code offset #443
/* 479:    */     //   Java source line #152	-> byte code offset #451
/* 480:    */     //   Java source line #153	-> byte code offset #457
/* 481:    */     //   Java source line #154	-> byte code offset #459
/* 482:    */     //   Java source line #155	-> byte code offset #489
/* 483:    */     //   Java source line #158	-> byte code offset #494
/* 484:    */     //   Java source line #159	-> byte code offset #499
/* 485:    */     //   Java source line #161	-> byte code offset #504
/* 486:    */     //   Java source line #162	-> byte code offset #509
/* 487:    */     //   Java source line #164	-> byte code offset #514
/* 488:    */     //   Java source line #165	-> byte code offset #519
/* 489:    */     //   Java source line #167	-> byte code offset #524
/* 490:    */     //   Java source line #168	-> byte code offset #529
/* 491:    */     //   Java source line #170	-> byte code offset #534
/* 492:    */     //   Java source line #173	-> byte code offset #539
/* 493:    */     //   Java source line #174	-> byte code offset #548
/* 494:    */     //   Java source line #175	-> byte code offset #550
/* 495:    */     //   Java source line #179	-> byte code offset #583
/* 496:    */     //   Java source line #180	-> byte code offset #585
/* 497:    */     //   Java source line #181	-> byte code offset #615
/* 498:    */     //   Java source line #156	-> byte code offset #623
/* 499:    */     //   Java source line #158	-> byte code offset #625
/* 500:    */     //   Java source line #159	-> byte code offset #630
/* 501:    */     //   Java source line #161	-> byte code offset #635
/* 502:    */     //   Java source line #162	-> byte code offset #640
/* 503:    */     //   Java source line #164	-> byte code offset #645
/* 504:    */     //   Java source line #165	-> byte code offset #650
/* 505:    */     //   Java source line #167	-> byte code offset #655
/* 506:    */     //   Java source line #168	-> byte code offset #660
/* 507:    */     //   Java source line #170	-> byte code offset #665
/* 508:    */     //   Java source line #173	-> byte code offset #670
/* 509:    */     //   Java source line #174	-> byte code offset #679
/* 510:    */     //   Java source line #175	-> byte code offset #681
/* 511:    */     //   Java source line #179	-> byte code offset #714
/* 512:    */     //   Java source line #180	-> byte code offset #716
/* 513:    */     //   Java source line #181	-> byte code offset #746
/* 514:    */     //   Java source line #184	-> byte code offset #751
/* 515:    */     //   Java source line #158	-> byte code offset #754
/* 516:    */     //   Java source line #159	-> byte code offset #759
/* 517:    */     //   Java source line #161	-> byte code offset #764
/* 518:    */     //   Java source line #162	-> byte code offset #769
/* 519:    */     //   Java source line #164	-> byte code offset #774
/* 520:    */     //   Java source line #165	-> byte code offset #779
/* 521:    */     //   Java source line #167	-> byte code offset #784
/* 522:    */     //   Java source line #168	-> byte code offset #789
/* 523:    */     //   Java source line #170	-> byte code offset #794
/* 524:    */     //   Java source line #173	-> byte code offset #799
/* 525:    */     //   Java source line #174	-> byte code offset #808
/* 526:    */     //   Java source line #175	-> byte code offset #810
/* 527:    */     //   Java source line #179	-> byte code offset #843
/* 528:    */     //   Java source line #180	-> byte code offset #845
/* 529:    */     //   Java source line #181	-> byte code offset #875
/* 530:    */     //   Java source line #185	-> byte code offset #880
/* 531:    */     // Local variable table:
/* 532:    */     //   start	length	slot	name	signature
/* 533:    */     //   0	881	0	this	FileMoveThread
/* 534:    */     //   0	881	1	runId	int
/* 535:    */     //   0	881	2	userName	String
/* 536:    */     //   0	881	3	signType	String
/* 537:    */     //   0	881	4	signStatus	String
/* 538:    */     //   0	881	5	signTime	Date
/* 539:    */     //   0	881	6	longitude	String
/* 540:    */     //   0	881	7	latitude	String
/* 541:    */     //   0	881	8	address	String
/* 542:    */     //   0	881	9	deviceUuid	String
/* 543:    */     //   0	881	10	osType	String
/* 544:    */     //   0	881	11	province	String
/* 545:    */     //   0	881	12	city	String
/* 546:    */     //   0	881	13	district	String
/* 547:    */     //   0	881	14	street	String
/* 548:    */     //   0	881	15	streetNumber	String
/* 549:    */     //   7	437	16	p	java.util.Properties
/* 550:    */     //   16	222	17	formatDateStr	String
/* 551:    */     //   25	21	18	formatDateStr1	String
/* 552:    */     //   67	791	19	signFilePath	String
/* 553:    */     //   70	720	20	fos	java.io.FileOutputStream
/* 554:    */     //   73	707	21	osw	java.io.OutputStreamWriter
/* 555:    */     //   76	719	22	moveFlag	boolean
/* 556:    */     //   93	3	23	strTempString	String
/* 557:    */     //   108	28	23	e	java.lang.Exception
/* 558:    */     //   457	33	23	e	IOException
/* 559:    */     //   623	129	24	localObject	Object
/* 560:    */     //   548	28	25	e	java.lang.Exception
/* 561:    */     //   583	33	25	e	java.lang.Exception
/* 562:    */     //   679	28	25	e	java.lang.Exception
/* 563:    */     //   714	33	25	e	java.lang.Exception
/* 564:    */     //   808	28	25	e	java.lang.Exception
/* 565:    */     //   843	33	25	e	java.lang.Exception
/* 566:    */     // Exception table:
/* 567:    */     //   from	to	target	type
/* 568:    */     //   91	105	108	java/lang/Exception
/* 569:    */     //   140	454	457	java/io/IOException
/* 570:    */     //   539	545	548	java/lang/Exception
/* 571:    */     //   494	580	583	java/lang/Exception
/* 572:    */     //   140	494	623	finally
/* 573:    */     //   670	676	679	java/lang/Exception
/* 574:    */     //   625	711	714	java/lang/Exception
/* 575:    */     //   799	805	808	java/lang/Exception
/* 576:    */     //   754	840	843	java/lang/Exception
/* 577:    */   }
/* 578:    */   
/* 579:    */   private void moveSignFile(String filePath)
/* 580:    */   {
/* 581:192 */     MySFTP sf = new MySFTP();
/* 582:193 */     File signFile = new File(filePath);
/* 583:    */     
/* 584:195 */     Map<String, String> configMap = ConfigUtil.resolveProperties();
/* 585:196 */     ChannelSftp sftp = null;
/* 586:    */     
/* 587:198 */     String host = "192.168.0.88";
/* 588:199 */     int port = 22;
/* 589:200 */     String username = "root";
/* 590:201 */     String password = "bjrun@2014yunwei";
/* 591:    */     
/* 592:    */ 
/* 593:    */ 
/* 594:205 */     host = (String)configMap.get("gz_hostIP");
/* 595:206 */     username = (String)configMap.get("gz_hostUname");
/* 596:207 */     password = (String)configMap.get("gz_hostPwd");
/* 597:    */     
/* 598:209 */     String gz_sign_path = (String)configMap.get("gz_sign_path");
/* 599:    */     
/* 600:211 */     sftp = sf.getConnect(host, port, username, password);
/* 601:213 */     if ((signFile.isFile()) && (signFile.exists()))
/* 602:    */     {
/* 603:214 */       FileInputStream fis = null;
/* 604:    */       try
/* 605:    */       {
/* 606:216 */         sftp.cd(gz_sign_path);
/* 607:217 */         fis = new FileInputStream(signFile);
/* 608:218 */         sftp.put(fis, signFile.getName());
/* 609:219 */         signFile.delete();
/* 610:    */       }
/* 611:    */       catch (SftpException e)
/* 612:    */       {
/* 613:222 */         logger.error("Sftp连接失败(" + filePath + ")。", e);
/* 614:223 */         e.printStackTrace();
/* 615:    */       }
/* 616:    */       catch (FileNotFoundException e)
/* 617:    */       {
/* 618:225 */         logger.error("打卡文件" + filePath + "未找到。", e);
/* 619:226 */         e.printStackTrace();
/* 620:    */       }
/* 621:    */       finally
/* 622:    */       {
/* 623:228 */         if (fis != null) {
/* 624:    */           try
/* 625:    */           {
/* 626:230 */             fis.close();
/* 627:    */           }
/* 628:    */           catch (IOException e)
/* 629:    */           {
/* 630:232 */             e.printStackTrace();
/* 631:    */           }
/* 632:    */         }
/* 633:235 */         sftp.quit();
/* 634:236 */         sf.closeConn();
/* 635:    */       }
/* 636:    */     }
/* 637:    */   }
/* 638:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.test.FileMoveThread
 * JD-Core Version:    0.7.0.1
 */