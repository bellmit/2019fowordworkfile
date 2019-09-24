var expenseHtml = '';
var receiptHtml = '';
var idIndex = 1;
var count=1;
//初始化页面
mui.ready(function(){
	//获取HTML
	expenseHtml = $('#expense-receipt > div').eq(0).html();
	receiptHtml = $('#expense-receipt > div > div').eq(2).html();
	var dailySpends = eval('('+localStorage.dailySpends+')');
	var workList = eval('('+localStorage.workList+')');
	var dailyAssortList = eval('('+localStorage.dailyAssortList+')');
	if(dailySpends.length>0){
		bindSpendInfo(dailySpends,dailyAssortList);
	}
});

//页面切换
function toWorkPage(){
	mui.openWindow({
		url:"report-info-view.html"
	});
}
//带入数据
function bindSpendInfo(spendList, assortList){
	for(var i=0;i<spendList.length;i++){
		count=new Number(spendList[i].spendNo)+1;
		var html="<div class='mui-table-view spend-info-view'>"+
						"<div class='mui-card-header'>"+
							"<span class='left'><span class='mui-icon mui-icon-list user-portal-red'></span>报销单号：<span id='spendNo'>"+spendList[i].spendNo+"</span>单</span>"+
						"</div>"+
						"<div class='mui-card-content' >"+
							"<ul class='formList' style='border-top: none;'>"+
								"<li class='clearfix'>"+
									"<span class='left label'>预算编号</span>"+
									"<span class='right content' id='proNo'>"+spendList[i].proNo+"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<span class='left label'>花销分类</span>"+
									"<span class='right content' id='budgetType' >"+spendList[i].budgetType+"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<span class='left label'>消费类型</span>"+
									"<span class='right content' id='spendType' >"+spendList[i].spendType+"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<div class='left label'>划卡消费日期</div>"+
									"<span id='spendDate' class='btn right mr' >"+ (spendList[i].spendDate ? spendList[i].spendDate : '') +"</span>"+
								"</li>"+
								"<li class='clearfix'>"+
									"<div class='left label'>花费统计</div>"+
									"<span class='right content' id='spendTotal'></span>"+
								"</li>"+
							"</ul>"+
						"</div>"+
						"<div class='clear'></div>"+
					"</div>"+
					"<div class='mui-table-view t10'>"+
						"<a id='addReceipt_"+(++idIndex)+"' class='add-btn' href='#'> 票据</a>"+
					"</div>";
			for(var j=0;j<assortList.length;j++){
				if(spendList[i].spendNo==assortList[j].spendNo){
					html+="<div id='allreceipt_"+(++idIndex)+"'>"+
							"<div class='alone-receipt assort-info-view'>"+
								"<div class='title'>"+
									"票据 — 报销单号:<span id='spendNo'>"+assortList[j].spendNo+"</span>单"+
								"</div>"+
								"<ul class='formList'>"+
									"<li class='clearfix'>"+
										"<span class='left label'>发票类型</span>"+
										"<span class='right content' id='ticketType'>"+assortList[j].ticketType+"</span>"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>花销金额</span>"+
										"<input type='text' id='spendMoney' readonly value='"+assortList[j].spendMoney+"' class='f_input right wp60' />"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>税率</span>"+
										"<input type='text' id='rate' readonly value='"+assortList[j].rate+"' class='f_input right wp60'  />"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>报销单号(后4位)</span>"+
										"<input type='text' id='code 'readonly  value='"+assortList[j].code+"' class='f_input right wp60' />"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>开票单位</span>"+
										"<input type='text' id='ticketCom' readonly value='"+assortList[j].ticketCom+"' class='f_input right wp60' />"+
									"</li>"+
									"<li class='clearfix'>"+
										"<span class='left label'>发票内容</span>"+
										"<input type='text' id='ticketInfo' readonly value='"+assortList[j].ticketInfo+"' class='f_input right wp60' />"+
									"</li>"+
									"<li class='clearfix' style='height: auto;'>"+
										"<textarea class='mui-input-speech t10' readonly style='margin-bottom: 0;' id='remark' rows='5' >"+assortList[j].remark+"</textarea>"+
									"</li>"+
								"</ul>"+
							"</div>"+
						"</div>"
					}
			}
			$('#expense-receipt').append("<div style='margin-bottom:10px'>" + html + "</div>");
	}
	
}


//跳转列表页面
function backDailyList(){
	mui.openWindow({
		url:"daliyList.html"
	});
		
}