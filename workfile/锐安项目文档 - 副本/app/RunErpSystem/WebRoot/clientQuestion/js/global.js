
//var pathUrl = "http://10.200.200.39";
 var pathUrl="http://111.204.211.208:8888/RunErpSystem";
//var preId = "Run.$*!(@._";
var preId = "";
$(function () {
  //rem布局
  initpage();
  
  //switch 开关
	$('.switchBox').die().live('touchend',function(){
	    $(this).toggleClass('slt');
	    if($(this).hasClass('slt')){
	        $(this).find('img').attr('src','images/openbtn.png');
	    }else{
	        $(this).find('img').attr('src','images/closebtn.png');
	    }
	});
});

/**
 * rem布局 
 * 
 */
function initpage(){
    var view_width = document.getElementsByTagName('html')[0].getBoundingClientRect().width;  
    var _html = document.getElementsByTagName('html')[0];
    view_width>640?_html.style.fontSize=640/16 +'px':_html.style.fontSize =view_width/16+'px';
  }

/**
 * 调用下拉框
 * @param clickId
 * @param spanId
 * @param data
 */
function getSelect(clickId,spanId,data){
    var userPicker = new mui.PopPicker();
    userPicker.setData(data);
    var showUserPickerButton = document.getElementById(clickId);
    var userResult = document.getElementById(spanId);
    showUserPickerButton.addEventListener('tap', function(event) {
        userPicker.show(function(items) {
            userResult.innerText = items[0].text;
            //返回 false 可以阻止选择框的关闭
            //return false;
        });
    }, false);
}
/**
 * 调用下拉框多级联动
 * @param clickId
 * @param spanId
 * @param level
 */
function getDynamicSelcet(clickId,spanId,level,cityData){
    var cityPicker = new mui.PopPicker({
        layer: level
    });
    cityPicker.setData(cityData);
    var showCityPickerButton = document.getElementById(clickId);
    var cityResult = document.getElementById(spanId);
    showCityPickerButton.addEventListener('tap', function(event) {
        cityPicker.show(function(items) {
		if(items[2]){
			cityResult.innerText = items[0].text+" "+items[1].text+" "+items[2].text;
		}else{
			cityResult.innerText = items[0].text+" "+items[1].text;
		}
            //返回 false 可以阻止选择框的关闭
            //return false;
        });
    }, false);
}



function getTradeSelcet(clickId,spanId,level){
    var tradePicker = new mui.PopPicker({
        layer: level
    });
    tradePicker.setData(tradeData);
    var showTradePickerButton = document.getElementById(clickId);
    var tradeResult = document.getElementById(spanId);
    showTradePickerButton.addEventListener('tap', function(event) {
        tradePicker.show(function(items) {
            tradeResult.innerText = items[0].text+"-"+items[1].text;
            //返回 false 可以阻止选择框的关闭
            //return false;
        });
    }, false);
}


/**
 * 调用下拉框时间选择
 * @param clickId
 * @param spanId
 * @param data
 */
function getTime(clickId){
    var btns = $('#'+clickId);
    btns.each(function(i, btn) {
        btn.addEventListener('tap', function() {
            var _self = this;
            if(_self.picker) {
                _self.picker.show(function (rs) {
                    $('#'+clickId).val(rs.text);
                    _self.picker.dispose();
                    _self.picker = null;
                });
            } else {
                var optionsJson = this.getAttribute('data-options') || '{}';
                var options = JSON.parse(optionsJson);
                var id = this.getAttribute('id');
                /*
                 * 首次显示时实例化组件
                 * 示例为了简洁，将 options 放在了按钮的 dom 上
                 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
                 */
                _self.picker = new mui.DtPicker(options);
                _self.picker.show(function(rs) {
                    /*
                     * rs.value 拼合后的 value
                     * rs.text 拼合后的 text
                     * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
                     * rs.m 月，用法同年
                     * rs.d 日，用法同年
                     * rs.h 时，用法同年
                     * rs.i 分（minutes 的第二个字母），用法同年
                     */
                    $('#'+clickId).val(rs.text);
                    /*
                     * 返回 false 可以阻止选择框的关闭
                     * return false;
                     */
                    /*
                     * 释放组件资源，释放后将将不能再操作组件
                     * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
                     * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
                     * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
                     */
                    _self.picker.dispose();
                    _self.picker = null;
                });
            }
        }, false);
    });
}

  	//行业一级分类
    var tradeFirstData = [{
        value: '0',
        text: '运营商行业'
    }, {
        value: '1',
        text: '公安行业'
    }, {
        value: '2',
        text: '网信行业'
    }, {
        value: '3',
        text: '保密行业'
    }, {
        value: '4',
        text: '监察委行业'
    }, {
        value: '5',
        text: '航天行业'
    }, {
        value: '6',
        text: '系统集成行业'
    }, {
        value: '7',
        text: '电力行业'
    }, {
        value: '8',
        text: '军队行业'
    }, {
        value: '9',
        text: '海外'
    }, {
        value: '10',
        text: '其他'
    }]; 
	
//登录验证



