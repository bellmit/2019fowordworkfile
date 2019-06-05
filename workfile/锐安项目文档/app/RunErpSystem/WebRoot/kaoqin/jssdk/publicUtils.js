/**
 **  @fileoverView:  publicsUtils 
 **  @version： V1.0
 **  @Date :    2018-08-03
 **  @author：  youjiti
 **/	

/* 获取当前日期 */
function showTime(){ 
	 var show_day=new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六'); 
	 var time=new Date(); 
	 var year=time.getFullYear();
	 var month=time.getMonth()+1; 
	 var date=time.getDate(); 
	 var day=time.getDay(); 
	 var hour=time.getHours(); 
	 var minutes=time.getMinutes(); 
	 var second=time.getSeconds(); 
	/*  month<10?month='0'+month:month;  */
	 hour<10?hour='0'+hour:hour; 
	 minutes<10?minutes='0'+minutes:minutes; 
	 second<10?second='0'+second:second; 
	 var showDay= year+'年'+month+'月'+date+'日'; 
	 var showWeek = show_day[day];
	 /* setTimeout("showTime();",1000);  */
	 return showDay + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + showWeek;
}