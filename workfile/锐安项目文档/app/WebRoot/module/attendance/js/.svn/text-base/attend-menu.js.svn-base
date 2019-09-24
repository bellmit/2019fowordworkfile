var pathUrl = "https://www.wanglin.online:8888/RunErpSystem";
var preId = "Run.$*!(@._";
/**
 * 接口请求状态
 * @param code
 * @returns {Boolean}
 */
function rspFlag(code){
	if(code == '000000' || code == '200'){
		return true;
	}else{
		return false;
	}	
}

$(function() {
	//rem布局
	initpage();
	//switch 开关
	$('.switchBox').die().live('touchend', function() {
		$(this).toggleClass('slt');
		if ($(this).hasClass('slt')) {
			$(this).find('img').attr('src', '.../../images/openbtn.png');
		} else {
			$(this).find('img').attr('src', '../../images/closebtn.png');
		}
	});
});
/**
 * rem布局 
 * 
 */
function initpage() {
	var view_width = document.getElementsByTagName('html')[0]
			.getBoundingClientRect().width;
	var _html = document.getElementsByTagName('html')[0];
	view_width > 640 ? _html.style.fontSize = 640 / 25 + 'px'
			: _html.style.fontSize = view_width / 25 + 'px';
}

//登录验证
//弹出提示消息
function showAlert(str){
    setTimeout(function(){
		mui.toast(str);
    },100);
}

