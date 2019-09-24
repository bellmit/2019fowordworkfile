var dailyAssortList=[];
var values=[];//存放所有的带回来的发票数据
var spends=[];//存放每一次选择的标签数据
var targetId;//存放获取的id
var appUserInfo={};
var companyVal;
//获取回显的发票数据
(function($, doc) {

    if (localStorage.wxUser!=null) {
	    var data = JSON.parse(localStorage.wxUser);
		appUserInfo.mUserName=data.userName;
		appUserInfo.mWxUserId = data.wXUserId;
		appUserInfo.applyUserId = data.userId;
	}
	//获取发票池列表
	getInvoice();
	//获取票据的id(作为返回时的if判断字段)
	//获取url中的Id参数
	targetId = getUrlParam('spendNo');
	//发票单位
	companyVal = getUrlParam('company');
	//获取HTML
	dailyAssortList = eval('('+localStorage.dailyAssortList+')');
})(mui, document);
//获取页面信息
function daily(){
	if(dailyAssortList.length > 0) {
		//为了将已经选择的发票会显出来
		var inputs = document.getElementsByName("checkbox");
		for(var d=0;d<dailyAssortList.length;d++) {
			if(dailyAssortList[d].spendNo == targetId) {
				//code(发票号码)与input的值判断获取具体的input
				values.push(dailyAssortList[d].code);
			}
		}
		for(var i=0;i<inputs.length;i++) {
			var input = inputs[i].value;
			if(values.indexOf(input)>-1) {
				$("input[value='"+input+"']").prop("checked",true);
			}
		}
		//删除掉本地空的发票票据（后面的直接push）
		for(var d=0;d<dailyAssortList.length;d++) {
			// && dailyAssortList[d].code ==''
			if(dailyAssortList[d].operationType == '发票池' && dailyAssortList[d].spendNo==targetId) {
				dailyAssortList.splice(d, 1);
				d--;
			};
		}
		//将现在选择的(就是从票据带过来的发票)发票池的发票添加到spends
		for(var i=0;i<inputs.length;i++) {
			if(inputs[i].checked) {
				var value=inputs[i].previousElementSibling.innerText;
				spends.push(value);
			}
		}
	}
}

//获取发票池
function getInvoice(){ 
	//var id='2530';
    $.ajax({
        type: "post",
        url:pathUrl+"/getInvoice.action",
        data : {
        	userId:appUserInfo.applyUserId
        },
        cache:false,
        dataType: "json",
        success:function(data){
		var dataList = "";
 		$("#pullrefresh").html('');
        var json = eval('(' + data + ')');
        $.each(json.data,function(i,daily){
        
        	if(daily.invoiceno != '' && daily.invoiceno != null){
				dateFormat(daily.invoicedate);
				//状态 daily.state
				dataList=dataList+'<li class="clearfix">'+
						'<div class="mui-input-row mui-checkbox mui-left" >'+
							'<label class="myui-check-label label" id="label">'+
							'<span class="code left" style="width:300px">发票单号：'+daily.invoiceno+'</span>'+
							'<span class="ticketCom left" style="width:300px">开票单位：'+daily.salername+'</span>'+
							'<span class="dateTime left" style="width:300px">发票时间：'+dateTypeDate+'</span>'+
							'<span class="spendMoney left" style="width:300px">金额：'+daily.totalamount+'</span>'+
							'<span class="ticketType left" style="width:300px">类型：非增值税专用发票</span>';
				dataList =dataList+findInvoiceType(daily.state,daily.invoicetype);
				dataList =dataList+'</label>'+
						'<input name="checkbox" style="padding-top:40px;" type="checkbox" value='+daily.invoiceno+'>'+
						'</div>'+
					'</li>';
        	};
        });
		$("#pullrefresh").append(dataList);	
    	daily();  
        }
    });
}

// 获取url中的参数的函数
function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!= null) {
		return unescape(r[2]);
	}else{
		return null;
	};
}

mui('.mui-input-group').on('change', 'input', function() {
	var value = this.checked?"true":"false";
	var invoices=this.previousElementSibling.innerText;
	//处理数据，获取发票单位unit[1]
	var invoice = replaces(invoices);
	var unit = invoice.split("|");
	if(value == "true") {
		if(companyVal == unit[1]　 ||　companyVal　==　''){
			spends.push(invoices);
			companyVal = unit[1];		
		}else{
			mui.toast("只能选择同一单位的发票");
			$("input[value='"+unit[0]+"']").prop("checked",false);
		}
	}else {
		//数组中存在该数据返回1
		if(spends.indexOf(invoices)>-1) {
			spends = removes(spends,invoices);
			if(spends.length == 0){
				companyVal = '';
			}
		}
	}
});

//跳回到费用报销页面
function toAssortPage() {
	localStorage.dailyAssortList = getAssortList();
	mui.openWindow({
		url:"report-expense.html"
	});
};

//移除数组中的某个元素（当取消选择时使用）
function removes(date,val) { 
	var index = indexOf(date,val); 
	if (index > -1) { 
		date.splice(index, 1); 
	}
	return date;
};

//获取要删除元素的索引位置
function indexOf(date,val) {
    for (var i = 0; i < date.length; i++) {
        if (date[i] == val) return i;
    }
    return -1;
};

//生成花销list
function getAssortList() {
	spends.forEach(function(items,i) {
		var itemDate = replaces(items);
		item =itemDate.split("|");
		var spend=new Object();
		spend["spendNo"]=targetId;
		spend["operationType"]='发票池';
		spend["ticketType"]=item[4];
		spend["ticketCom"]=item[1];
		spend["spendMoney"]=item[3];
		spend["rate"]='0.0';
		spend["code"]=item[0];
		spend["ticketInfo"]='';
		spend["rideType"]='';
		spend["teamSite"]='';
		spend["teamUser"]='';
		spend["remark"]='';
		dailyAssortList.push(spend);
	});
	return JSON.stringify(dailyAssortList);
}

/* 
* 时间格式化工具 
* 把Long类型的1527672756454日期还原yyyy-MM-dd格式日期 
*/
var dateTypeDate = ""; 
function dateFormat(longTypeDate){
	dateTypeDate = "";
	var date = new Date(); 
	date.setTime(longTypeDate); 
	dateTypeDate += date.getFullYear(); //年 
	dateTypeDate += "-" + (date.getMonth(date) + 1); //月 
	dateTypeDate += "-" + date.getDate(date); //日  
	return dateTypeDate; 
}
//替换发票信息
function replaces(invoice){
	invoice=invoice.replace("发票单号：","");
	invoice=invoice.replace("开票单位：","|");
	invoice=invoice.replace("发票时间：","|");
	invoice=invoice.replace("金额：","|");
	invoice=invoice.replace("类型：","|");
	invoice=invoice.replace("发票类型：","|");
	return invoice;
}
//转换获取的类型
function findInvoiceType(state,invoicetype){
	var type;
	if(state!=4){
		type = " fType='16' style='color:red'>发票类型：发票未验证";
	}else if (invoicetype == '1') {
		type = ">发票类型：普通电子发票";
	} else if (invoicetype == '2') {
		type = " fType='2'>发票类型：电子发票专票";
	} else if (invoicetype == '3') {
		type = " fType='3'>发票类型：普通纸质发票";
	} else if (invoicetype == '4') {
		type = " fType='4'>发票类型：专用纸质发票";
	} else if (invoicetype == '5') {
		type = " fType='5'>发票类型：普通纸质卷票";
	} else if (invoicetype == '15') {
		type = " fType='15'>发票类型：通行费";
	} else if (invoicetype == '7') {
		type = " fType='7'>发票类型：通用机打";
	} else if (invoicetype == '8') {
		type = " fType='8'>发票类型：的士票";
	} else if (invoicetype == '9') {
		type = " fType='9'>发票类型：火车票";
	} else if (invoicetype == '10') {
		type = " fType='10'>发票类型：飞机票";
	} else if (invoicetype == '11') {
		type = " fType='11'>发票类型：其他";
	} else if (invoicetype == '12') {
		type = " fType='12'>发票类型：机动车";
	} else if (invoicetype == '13') {
		type = " fType='13'发票类型：>二手车";
	} else if (invoicetype == '14') {
		type = " fType='14'>发票类型：定额发票";
	} else {
		type = " fType='0'>未知";
	}
	return "<span class='state left'" + type + "</span>"
}