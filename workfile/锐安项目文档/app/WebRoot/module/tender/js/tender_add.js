//初始化
(function ($, doc, jQuery) {

	var id = localStorage.tenderActionDataId;//用于存储点击的数据的id
	var type = localStorage.tenderAction;//判断是否为查看  确认 或者修改

	var showStyleButton = doc.getElementById("dailyDate");
	var styleResult = doc.getElementById("dailyDate");
	//绑定时间加载的插件
	showStyleButton.addEventListener("tap", function () {
		if (type == "view" || type == "comfirm") {
			return;
		}
		var _self = this;
		if (_self.picker) {
			_self.picker.show(function (rs) {
				styleResult.innerText = rs.text;
				_self.picker.dispose();
				_self.picker = null;
			});
		} else {
			var optionsJson = this.getAttribute("data-options") || "{}";
			var options = JSON.parse(optionsJson);
			var id = this.getAttribute("id");
			_self.picker = new $.DtPicker(options);
			_self.picker.show(function (rs) {
				styleResult.innerText = rs.text;
				_self.picker.dispose();
				_self.picker = null;
			});
		}
	}, false);
	$.ready(function () {
		if (type != "view" && type != "comfirm") {
			//显示地点选择的插件
			getDynamicSelcet("showSitePicker", "site", 2, cityData);
		}
	});
	//初始化数据，如果是查看  编辑或者确认的情况下
	if (localStorage.tenderActionDataId != undefined && localStorage.tenderActionDataId != "") {
		jQuery("#renderIdForEdit").val(id);
		jQuery("#renderTypeForEdit").val(type);
		localStorage.removeItem("tenderAction");
		localStorage.removeItem("tenderActionDataId");
		$.ajax({
			url: URL_PATH + "/tenderGetObj.action", type: "post", data: { id: id, }, dataType: "jsonp", jsonp: "callback", jsonpCallback: "flightHandler", error: function () {
				alert("网络异常！");
			}, success: function (data) {
				var obj = JSON.parse(JSON.parse(data)).obj;
				jQuery("#site").text(obj.province + " " + obj.city);
				jQuery("#budget").val(obj.budget);
				jQuery("#projectName").val(obj.projectName);
				jQuery("#dailyDate").text(obj.tenderDate);
				jQuery("#remark").text(obj.remark);
				if (type == "comfirm") {
					jQuery("#projectName").attr("disabled", "disabled");
					jQuery("#remark").attr("disabled", "disabled");
					jQuery("#questionComfirm").attr("class", "");
				}
				if (type == "view") {
					if (!jQuery("#formsubmitbtn").hasClass("displayNone")) {
						jQuery("#formsubmitbtn").addClass("displayNone");
					}
					jQuery("#projectName").attr("disabled", "disabled");
					jQuery("#remark").attr("disabled", "disabled");
					jQuery("#budget").attr("disabled", "disabled");
					jQuery(".gload").attr("disabled", "disabled");
					jQuery("#price").attr("disabled", "disabled");
					jQuery("#company").attr("disabled", "disabled");
					jQuery("#reason textarea").attr("disabled", "disabled");
					jQuery("#questionComfirm").attr("class", "");
					jQuery("#price").val(obj.price);
					jQuery("#company").val(obj.company);
					jQuery("#reason textarea").val(obj.reason);
					var cst = obj.status;
					jQuery(".gload").removeClass("slt");
					if (cst == 2) {
						jQuery(jQuery(".gload")[1]).addClass("slt");
						jQuery("#reason").removeClass("displayNone");
						if (!!obj.reason) {
							jQuery("#reason textarea").val(obj.reason);
						}
					} else {
						jQuery(jQuery(".gload")[0]).addClass("slt");
						jQuery("#reason").addClass("displayNone");
					}
				}
			}
		});
	}
})(mui, document, jQuery);
/**
 * 中标和非中标按钮点击方法
 * @param {*} e 
 */
function tenderChangeStatus(e) {
	jQuery(".gload").removeClass("slt");
	jQuery(e).addClass("slt");
	if (jQuery(e).val() == "中标") {
		jQuery("#company").val("锐安科技");
		jQuery("#company").attr("disabled", "disabled");
		jQuery("#reason").addClass("displayNone");
	} else {
		jQuery("#company").val("");
		jQuery("#company").removeAttr("disabled");
		jQuery("#reason").removeClass("displayNone");
	}
}
/**
 * 输入框文字个数
 * @param self
 * @param nowleng
 */
function limitTextarea(self, nowleng, bigNum) {
	$(self).on('input propertychange', function (event) {
		var _val = $(self).val();
		if (_val.length <= bigNum) {
			$(self).val(_val);
			$(nowleng).text(_val.length)
		} else {
			$(self).val(_val.slice(0, bigNum));
		}
	});
	$(self).blur(function () {
		$(self).off('input propertychange');
	});
}
/**
 * 页面提交的方法
 */
function submitTenderForm() {
	var formData = {};
	var btnArray = ['确定(3)'];
	var id = $("#renderIdForEdit").val();
	var type = $("#renderTypeForEdit").val();
	var patrn = /^\d+(\.\d+)?$/;
	formData.type = type;
	if (type != "comfirm") {
		if (id != "" || id != null) {
			formData.id = id;
		}
		formData.applyUser = $("#user").val();
		formData.projectName = $("#projectName").val();
		formData.budget = $("#budget").val();
		formData.site = $("#site").text();
		formData.tenderDate = $("#dailyDate").text();
		formData.remark = $("#remark").val();
		if (formData.projectName == null || formData.projectName == '') {
			mui.confirm('请输入项目名称', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (formData.site == "请选择省份/地市") {
			mui.confirm('请选择省份/地市', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (formData.budget == null || formData.budget == '') {
			mui.confirm('请输入客户预算金额', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (!patrn.exec(formData.budget)) {
			mui.confirm('客户预算金额只能输入数字', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (formData.tenderDate == "请选择时间") {
			mui.confirm('请选择客户投标日期', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (formData.remark.length > 100) {
			mui.confirm('备注需要少于100', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
	} else {//确认
		formData.id = id;
		formData.price = $("#price").val();
		if (!$(".gload.slt").length == 1) {
			mui.confirm('请选择是否中标', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		} else {
			formData.status = $(".gload.slt").attr("data-status");
			if (formData.status == 2) {
				formData.reason = $("#reason textarea").val();
				if (formData.reason.length > 100) {
					mui.confirm('备注需要少于100', '', btnArray, function (e) {
						if (e.index == 0) {//是
							clearInterval(timer);
							$('.mui-popup-backdrop').hide();
						}
					});
					timerFn();
					return false;
				}
			}

		}
		if (!patrn.exec(formData.price)) {
			mui.confirm('中标金额只能输入数字', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		if (formData.price < 0) {
			mui.confirm('中标金额只能输入大于0的数字', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}
		formData.company = $("#company").val();
		if (formData.company == null || formData.company == '') {
			mui.confirm('请输入中标公司', '', btnArray, function (e) {
				if (e.index == 0) {//是
					clearInterval(timer);
					$('.mui-popup-backdrop').hide();
				}
			});
			timerFn();
			return false;
		}

	}


	$.ajax({
		url: URL_PATH + '/addTenderInfo.action',
		type: 'post',
		data: formData,
		async: false,/*同步请求*/
		dataType: 'jsonp',
		jsonp: 'callback',
		jsonpCallback: 'flightHandler',
		error: function () {
		},
		success: function (data) {
			//处理数据格式
			var data = JSON.parse(data);
			var msg = data.msg;
			mui.confirm(msg, '', ['确定'], function (e) {
				if (e.index == 0) {//是
					window.location.href = 'tender_list.html';
					$('.mui-popup-backdrop').hide();
				}
			});
		}
	});
}
function timerFn() {
	$('.mui-popup-backdrop').show();
	var i = 2;
	timer = setInterval(function () {
		if (i >= 0) {
			$('.mui-popup-button-bold').text('确定(' + i + ')');
			i--;
		} else {
			$('.mui-popup').remove();
			$('.mui-popup-backdrop').hide();
			clearInterval(timer);
		}
	}, 1000);
} 