//初始化加载页面信息
(function($, doc) {
	$.init({
		swipeBack: true
	});
$.ready(function() {
		var _getParam = function(obj, param) {
			return obj[param] || '';
        };

		//编号
		var noPicker = new $.PopPicker();
		noPicker.setData([{
			value: 'plane',
			text: '编号1'
			}, {
				value: 'train',
				text: '编号2'
			},{
			value: 'car', 
				text: '编号3'
			},
		]);
		var showNoButton1 = doc.getElementById('showNo1');
		var userResult1 = doc.getElementById('showNo1');
		showNoButton1.addEventListener('tap', function(event) {
			noPicker.show(function(items) {
				userResult1.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
		// 2
		var showNoButton2 = doc.getElementById('showNo2');
		var userResult2 = doc.getElementById('showNo2');
		showNoButton2.addEventListener('tap', function(event) {
			noPicker.show(function(items) {
				userResult2.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
		
		//里程碑
		var stepPicker = new $.PopPicker();
		stepPicker.setData([{
			value: '1',
			text: '1'
			}, {
				value: '2',
				text: '2'
			},{
			value: '3', 
				text: '3'
			},
		]);
		var showStepButton1 = doc.getElementById('showStep1');
		var userResult1 = doc.getElementById('showStep1');
		showStepButton1.addEventListener('tap', function(event) {
			stepPicker.show(function(items) {
				userResult1.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
		var showStepButton2 = doc.getElementById('showStep2');
		var userResult2 = doc.getElementById('showStep2');
		showStepButton2.addEventListener('tap', function(event) {
			stepPicker.show(function(items) {
				userResult2.innerText = items[0].text;
				//返回 false 可以阻止选择框的关闭
				//return false;
			});
		}, false);
	});
	
	
	var result = $('#result')[0];
	var btns = $('.btn');
	
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var _self = this;
			if(_self.picker) {
				_self.picker.show(function (rs) {
					btn.innerText =rs.text;
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
				_self.picker = new $.DtPicker(options);
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
					btn.innerText = rs.text;
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
	
})(mui, document);