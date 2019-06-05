/*   1:    */ package com.bjrun.mobile.entity.sign;
/*   2:    */ 
/*   3:    */ import java.util.Date;
/*   4:    */ 
/*   5:    */ public class SignInfo
/*   6:    */ {
/*   7:    */   private String id;
/*   8:    */   private Integer runId;
/*   9:    */   private String userName;
/*  10:    */   private Date signDate;
/*  11: 26 */   private String msStatus = "未打卡";
/*  12:    */   private Date msTime;
/*  13:    */   private String msLongitude;
/*  14:    */   private String msLatitude;
/*  15:    */   private String msAddress;
/*  16: 37 */   private String msoStatus = "未打卡";
/*  17:    */   private Date msoTime;
/*  18:    */   private String msoLongitude;
/*  19:    */   private String msoLatitude;
/*  20:    */   private String msoAddress;
/*  21: 48 */   private String asStatus = "未打卡";
/*  22:    */   private Date asTime;
/*  23:    */   private String asLongitude;
/*  24:    */   private String asLatitude;
/*  25:    */   private String asAddress;
/*  26: 59 */   private String asoStatus = "未打卡";
/*  27:    */   private Date asoTime;
/*  28:    */   private String asoLongitude;
/*  29:    */   private String asoLatitude;
/*  30:    */   private String asoAddress;
/*  31:    */   private String deviceUuid;
/*  32:    */   private String osType;
/*  33:    */   private String msdeviceUuid;
/*  34:    */   private String msosType;
/*  35:    */   private String msodeviceUuid;
/*  36:    */   private String msoosType;
/*  37:    */   private String asdeviceUuid;
/*  38:    */   private String asosType;
/*  39:    */   private String asodeviceUuid;
/*  40:    */   private String asoosType;
/*  41:    */   private Date createDate;
/*  42:    */   
/*  43:    */   public String getMsdeviceUuid()
/*  44:    */   {
/*  45: 87 */     return this.msdeviceUuid;
/*  46:    */   }
/*  47:    */   
/*  48:    */   public void setMsdeviceUuid(String msdeviceUuid)
/*  49:    */   {
/*  50: 91 */     this.msdeviceUuid = msdeviceUuid;
/*  51:    */   }
/*  52:    */   
/*  53:    */   public String getMsosType()
/*  54:    */   {
/*  55: 95 */     return this.msosType;
/*  56:    */   }
/*  57:    */   
/*  58:    */   public void setMsosType(String msosType)
/*  59:    */   {
/*  60: 99 */     this.msosType = msosType;
/*  61:    */   }
/*  62:    */   
/*  63:    */   public String getMsodeviceUuid()
/*  64:    */   {
/*  65:103 */     return this.msodeviceUuid;
/*  66:    */   }
/*  67:    */   
/*  68:    */   public void setMsodeviceUuid(String msodeviceUuid)
/*  69:    */   {
/*  70:107 */     this.msodeviceUuid = msodeviceUuid;
/*  71:    */   }
/*  72:    */   
/*  73:    */   public String getMsoosType()
/*  74:    */   {
/*  75:111 */     return this.msoosType;
/*  76:    */   }
/*  77:    */   
/*  78:    */   public void setMsoosType(String msoosType)
/*  79:    */   {
/*  80:115 */     this.msoosType = msoosType;
/*  81:    */   }
/*  82:    */   
/*  83:    */   public String getAsdeviceUuid()
/*  84:    */   {
/*  85:119 */     return this.asdeviceUuid;
/*  86:    */   }
/*  87:    */   
/*  88:    */   public void setAsdeviceUuid(String asdeviceUuid)
/*  89:    */   {
/*  90:123 */     this.asdeviceUuid = asdeviceUuid;
/*  91:    */   }
/*  92:    */   
/*  93:    */   public String getAsosType()
/*  94:    */   {
/*  95:127 */     return this.asosType;
/*  96:    */   }
/*  97:    */   
/*  98:    */   public void setAsosType(String asosType)
/*  99:    */   {
/* 100:131 */     this.asosType = asosType;
/* 101:    */   }
/* 102:    */   
/* 103:    */   public String getAsodeviceUuid()
/* 104:    */   {
/* 105:135 */     return this.asodeviceUuid;
/* 106:    */   }
/* 107:    */   
/* 108:    */   public void setAsodeviceUuid(String asodeviceUuid)
/* 109:    */   {
/* 110:139 */     this.asodeviceUuid = asodeviceUuid;
/* 111:    */   }
/* 112:    */   
/* 113:    */   public String getAsoosType()
/* 114:    */   {
/* 115:143 */     return this.asoosType;
/* 116:    */   }
/* 117:    */   
/* 118:    */   public void setAsoosType(String asoosType)
/* 119:    */   {
/* 120:147 */     this.asoosType = asoosType;
/* 121:    */   }
/* 122:    */   
/* 123:    */   public String getDeviceUuid()
/* 124:    */   {
/* 125:151 */     return this.deviceUuid;
/* 126:    */   }
/* 127:    */   
/* 128:    */   public void setDeviceUuid(String deviceUuid)
/* 129:    */   {
/* 130:155 */     this.deviceUuid = deviceUuid;
/* 131:    */   }
/* 132:    */   
/* 133:    */   public String getOsType()
/* 134:    */   {
/* 135:159 */     return this.osType;
/* 136:    */   }
/* 137:    */   
/* 138:    */   public void setOsType(String osType)
/* 139:    */   {
/* 140:163 */     this.osType = osType;
/* 141:    */   }
/* 142:    */   
/* 143:    */   public String getId()
/* 144:    */   {
/* 145:170 */     return this.id;
/* 146:    */   }
/* 147:    */   
/* 148:    */   public void setId(String id)
/* 149:    */   {
/* 150:174 */     this.id = id;
/* 151:    */   }
/* 152:    */   
/* 153:    */   public Integer getRunId()
/* 154:    */   {
/* 155:178 */     return this.runId;
/* 156:    */   }
/* 157:    */   
/* 158:    */   public void setRunId(Integer runId)
/* 159:    */   {
/* 160:182 */     this.runId = runId;
/* 161:    */   }
/* 162:    */   
/* 163:    */   public String getUserName()
/* 164:    */   {
/* 165:186 */     return this.userName;
/* 166:    */   }
/* 167:    */   
/* 168:    */   public void setUserName(String userName)
/* 169:    */   {
/* 170:190 */     this.userName = userName;
/* 171:    */   }
/* 172:    */   
/* 173:    */   public Date getSignDate()
/* 174:    */   {
/* 175:194 */     return this.signDate;
/* 176:    */   }
/* 177:    */   
/* 178:    */   public void setSignDate(Date signDate)
/* 179:    */   {
/* 180:198 */     this.signDate = signDate;
/* 181:    */   }
/* 182:    */   
/* 183:    */   public String getMsStatus()
/* 184:    */   {
/* 185:202 */     return this.msStatus;
/* 186:    */   }
/* 187:    */   
/* 188:    */   public void setMsStatus(String msStatus)
/* 189:    */   {
/* 190:206 */     this.msStatus = msStatus;
/* 191:    */   }
/* 192:    */   
/* 193:    */   public Date getMsTime()
/* 194:    */   {
/* 195:210 */     return this.msTime;
/* 196:    */   }
/* 197:    */   
/* 198:    */   public void setMsTime(Date msTime)
/* 199:    */   {
/* 200:214 */     this.msTime = msTime;
/* 201:    */   }
/* 202:    */   
/* 203:    */   public String getMsLongitude()
/* 204:    */   {
/* 205:218 */     return this.msLongitude;
/* 206:    */   }
/* 207:    */   
/* 208:    */   public void setMsLongitude(String msLongitude)
/* 209:    */   {
/* 210:222 */     this.msLongitude = msLongitude;
/* 211:    */   }
/* 212:    */   
/* 213:    */   public String getMsLatitude()
/* 214:    */   {
/* 215:226 */     return this.msLatitude;
/* 216:    */   }
/* 217:    */   
/* 218:    */   public void setMsLatitude(String msLatitude)
/* 219:    */   {
/* 220:230 */     this.msLatitude = msLatitude;
/* 221:    */   }
/* 222:    */   
/* 223:    */   public String getMsAddress()
/* 224:    */   {
/* 225:234 */     return this.msAddress;
/* 226:    */   }
/* 227:    */   
/* 228:    */   public void setMsAddress(String msAddress)
/* 229:    */   {
/* 230:238 */     this.msAddress = msAddress;
/* 231:    */   }
/* 232:    */   
/* 233:    */   public String getMsoStatus()
/* 234:    */   {
/* 235:242 */     return this.msoStatus;
/* 236:    */   }
/* 237:    */   
/* 238:    */   public void setMsoStatus(String msoStatus)
/* 239:    */   {
/* 240:246 */     this.msoStatus = msoStatus;
/* 241:    */   }
/* 242:    */   
/* 243:    */   public Date getMsoTime()
/* 244:    */   {
/* 245:250 */     return this.msoTime;
/* 246:    */   }
/* 247:    */   
/* 248:    */   public void setMsoTime(Date msoTime)
/* 249:    */   {
/* 250:254 */     this.msoTime = msoTime;
/* 251:    */   }
/* 252:    */   
/* 253:    */   public String getMsoLongitude()
/* 254:    */   {
/* 255:258 */     return this.msoLongitude;
/* 256:    */   }
/* 257:    */   
/* 258:    */   public void setMsoLongitude(String msoLongitude)
/* 259:    */   {
/* 260:262 */     this.msoLongitude = msoLongitude;
/* 261:    */   }
/* 262:    */   
/* 263:    */   public String getMsoLatitude()
/* 264:    */   {
/* 265:266 */     return this.msoLatitude;
/* 266:    */   }
/* 267:    */   
/* 268:    */   public void setMsoLatitude(String msoLatitude)
/* 269:    */   {
/* 270:270 */     this.msoLatitude = msoLatitude;
/* 271:    */   }
/* 272:    */   
/* 273:    */   public String getMsoAddress()
/* 274:    */   {
/* 275:274 */     return this.msoAddress;
/* 276:    */   }
/* 277:    */   
/* 278:    */   public void setMsoAddress(String msoAddress)
/* 279:    */   {
/* 280:278 */     this.msoAddress = msoAddress;
/* 281:    */   }
/* 282:    */   
/* 283:    */   public String getAsStatus()
/* 284:    */   {
/* 285:282 */     return this.asStatus;
/* 286:    */   }
/* 287:    */   
/* 288:    */   public void setAsStatus(String asStatus)
/* 289:    */   {
/* 290:286 */     this.asStatus = asStatus;
/* 291:    */   }
/* 292:    */   
/* 293:    */   public Date getAsTime()
/* 294:    */   {
/* 295:290 */     return this.asTime;
/* 296:    */   }
/* 297:    */   
/* 298:    */   public void setAsTime(Date asTime)
/* 299:    */   {
/* 300:294 */     this.asTime = asTime;
/* 301:    */   }
/* 302:    */   
/* 303:    */   public String getAsLongitude()
/* 304:    */   {
/* 305:298 */     return this.asLongitude;
/* 306:    */   }
/* 307:    */   
/* 308:    */   public void setAsLongitude(String asLongitude)
/* 309:    */   {
/* 310:302 */     this.asLongitude = asLongitude;
/* 311:    */   }
/* 312:    */   
/* 313:    */   public String getAsLatitude()
/* 314:    */   {
/* 315:306 */     return this.asLatitude;
/* 316:    */   }
/* 317:    */   
/* 318:    */   public void setAsLatitude(String asLatitude)
/* 319:    */   {
/* 320:310 */     this.asLatitude = asLatitude;
/* 321:    */   }
/* 322:    */   
/* 323:    */   public String getAsAddress()
/* 324:    */   {
/* 325:314 */     return this.asAddress;
/* 326:    */   }
/* 327:    */   
/* 328:    */   public void setAsAddress(String asAddress)
/* 329:    */   {
/* 330:318 */     this.asAddress = asAddress;
/* 331:    */   }
/* 332:    */   
/* 333:    */   public String getAsoStatus()
/* 334:    */   {
/* 335:322 */     return this.asoStatus;
/* 336:    */   }
/* 337:    */   
/* 338:    */   public void setAsoStatus(String asoStatus)
/* 339:    */   {
/* 340:326 */     this.asoStatus = asoStatus;
/* 341:    */   }
/* 342:    */   
/* 343:    */   public Date getAsoTime()
/* 344:    */   {
/* 345:330 */     return this.asoTime;
/* 346:    */   }
/* 347:    */   
/* 348:    */   public void setAsoTime(Date asoTime)
/* 349:    */   {
/* 350:334 */     this.asoTime = asoTime;
/* 351:    */   }
/* 352:    */   
/* 353:    */   public String getAsoLongitude()
/* 354:    */   {
/* 355:338 */     return this.asoLongitude;
/* 356:    */   }
/* 357:    */   
/* 358:    */   public void setAsoLongitude(String asoLongitude)
/* 359:    */   {
/* 360:342 */     this.asoLongitude = asoLongitude;
/* 361:    */   }
/* 362:    */   
/* 363:    */   public String getAsoLatitude()
/* 364:    */   {
/* 365:346 */     return this.asoLatitude;
/* 366:    */   }
/* 367:    */   
/* 368:    */   public void setAsoLatitude(String asoLatitude)
/* 369:    */   {
/* 370:350 */     this.asoLatitude = asoLatitude;
/* 371:    */   }
/* 372:    */   
/* 373:    */   public String getAsoAddress()
/* 374:    */   {
/* 375:354 */     return this.asoAddress;
/* 376:    */   }
/* 377:    */   
/* 378:    */   public void setAsoAddress(String asoAddress)
/* 379:    */   {
/* 380:358 */     this.asoAddress = asoAddress;
/* 381:    */   }
/* 382:    */   
/* 383:    */   public Date getCreateDate()
/* 384:    */   {
/* 385:362 */     return this.createDate;
/* 386:    */   }
/* 387:    */   
/* 388:    */   public void setCreateDate(Date createDate)
/* 389:    */   {
/* 390:366 */     this.createDate = createDate;
/* 391:    */   }
/* 392:    */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.mobile.entity.sign.SignInfo
 * JD-Core Version:    0.7.0.1
 */