mui.init({
    swipeBack:true //启用右滑关闭功能
});
var delfile = [];
mui.ready(function() {
    /**
     * 获取对象属性的值
     * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
     * @param {Object} obj 对象
     * @param {String} param 属性名
     */
    var _getParam = function(obj, param) {
        return obj[param] || '';
    };
    //普通示例
    //性别
    var typeNames = [{
        value: '0',
        text: '咨询'
    }, {
        value: '1',
        text: '故障报修'
    }, {
        value: '2',
        text: '投诉'
    }, {
        value: '3',
        text: '需求'
    }, {
        value: '4',
        text: '其他'
    }];
    getSelect("typeNames","selType",typeNames);

    //取消确认
    document.getElementById("confirmBtn").addEventListener('tap', function() {
        var btnArray = ['否', '是'];
        mui.confirm('本次输入不会被保存，是否放弃新增问题？', ' ', btnArray, function(e) {
            if (e.index == 1) {//是
            } else {//否
            }
        })
    });
    //添加文件
    $('.fileAdd').off().on('click',function(){
        var inputName = new Date().getTime();
        var _html = '<input type="file" class="hide fileInput" data-id="'+inputName+'" multiple/>';
        $('.fileBox').after(_html);
		
        $('input[data-id="'+inputName+'"]').click();
    });

    //文件选择变化
    $('.fileInput').die().live('change',function(e) {
        var _html = '';
        var filelength = e.target.files.length;
        if((filelength+$('.fileBox .imgbtn').length)>5){
            alert('所选文件总数不能超过5个');
        }else{
            if(e.target.files.length<=1){
                var file = e.target.files[0];
				var strFile=file.name;
				if(strFile.indexOf(";")!=-1){
					alert("文件名称不能带 ; ");
					return false;
				}
				goToFileUp(file);
                _html='<span class="imgbtn left relative" data-input="'+$(e.target).attr("data-id")+'" data-time="'+file.lastModified+'">'+
                    '<img src="images/imgicon.png" class="imgicon" />'+
                    '<a href="javascript:;" class="imgdelbtn">'+
                    '<img src="images/delicon.png" alt class="imgdelicon" />'+					
                    '</a>'+
					'<input type="text" class="mui-hidden" name="picName" value="'+file.name+'"/>'+
                    '</span>';
            }else{
                var file = e.target.files;
                $.each(file,function(i,item){
				var strFile=item.name;
				if(strFile.indexOf(";")!=-1){
					alert("文件名称不能带 ; ");
					return false;
				}
				goToFileUp(file);
                    _html+='<span class="imgbtn left relative" data-input="'+$(e.target).attr("data-id")+'" data-time="'+item.lastModified+'">'+
                        '<img src="images/imgicon.png" class="imgicon"/>'+
                        '<a href="javascript:;" class="imgdelbtn">'+
                        '<img src="images/delicon.png" alt class="imgdelicon" />'+
                        '</a>'+
						'<input type="text" class="mui-hidden" name="picName" value="'+file.name+'"/>'+
                        '</span>';
                });
            }
            $('.fileBox').append(_html);
        }
    });
    //关闭文件
    $('.imgdelbtn').die().live('touchend',function(){
        var fileId = $(this).parent().attr('data-time'); //file中的lastModified
        delfile.push(fileId);
        $(this).parent().remove();
        return false;
    });
});
/**
 * 输入框文字个数
 * @param self
 * @param nowleng
 */
function limitTextarea(self,nowleng,bigNum){
    $(self).on('input propertychange', function(event) {
        var _val = $(self).val();
        if(_val.length<=bigNum){
            $(self).val(_val);
            $(nowleng).text(_val.length)
        }else{
            $(self).val(_val.slice(0,bigNum));
        }
    });
    $(self).blur(function(){
        $(self).off('input propertychange');
    });
}

function submitQueForm(){
	var applyUser='王林';
	var company='锐安幼儿园';
	var phone ='7847521';
	var accessory='';	
	
	var btnArray = ['确定'];
	var title=$("#queTitle").val(); //标题
	var type=$("#selType").html(); //类型
	var desc=$("#queText").val(); //描述
	var filesName = '';
	$("input[name='picName']").each(function(i,item){
		filesName+=';'+$(this).val();
	})
	$("#questionFiles").val(filesName);
	var files=filesName;
	if(title==null || title==''){
		mui.confirm('请输入标题', '', btnArray, function(e) {
		});
		return false;
	}
	if(type==null || type==''){
		mui.confirm('请选择问题类型', '', btnArray, function(e) {
		});
		return false;
	}
	if(desc==null || desc==''){
		mui.confirm('请输入详细内容', '', btnArray, function(e) {
		});
		return false;
	}
	$.ajax({
		url: pathUrl+'/addQuestionFromMobile.do',
		type:'post',
		data : {
			applyUser:applyUser,
			company:company,
			phone:phone,
			title:title,
			type:type,
			desc:desc,
			files:files
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
		},
		success:function(data){
			var msg= data.msg;
			var msgArray = ['确定'];
			if(msg.indexOf("提交成功!") != -1){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
				
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"custom_system.html"
					});
				});
			}
			
			
		}    
	});
}

function goToFileUp(file){
	//上传控制！！！！！！！！
	const imgMaxSize = 1024 * 1024 * 10; // 10MB
	// 检查文件类型
	if(['jpeg', 'png', 'gif', 'jpg'].indexOf(file.type.split("/")[1]) < 0){				
		showAlert("文件类型仅支持 jpeg/png/gif/jpg！");
		return false;
	}
	// 文件大小限制
	if(file.size > imgMaxSize ) {
		showAlert("文件大小不能超过10MB！");
		return false;
	}			
	// 图片上传							
	//transformFileToFormData(file);	
	// 图片压缩绘制
	// transformFileToDataUrl(file);
	// 图片上传
	transformFileToFormData(file);
}


// 将File append进 FormData
function transformFileToFormData (file) {
    const formData = new FormData();
    // name
    formData.append('name', file.name);
    // append 文件
    formData.append('businessFile', file);	
    // 上传图片
    uploadImg(formData);
}

// 上传图片
function uploadImg (formData) {
     const xhr = new XMLHttpRequest();
     // 进度监听
     xhr.upload.addEventListener('progress', function(e){console.log(e.loaded / e.total)}, false);
     // 加载监听
     // xhr.addEventListener('load', ()=>{console.log("加载中");}, false);
     // 错误监听
     xhr.addEventListener('error', function(){Toast.error("上传失败！", 2000, undefined, false);toCliekBtn();}, false);
     xhr.onreadystatechange = function () {
         if (xhr.readyState === 4) {
				 debugger;
			 if (xhr.status === 200) {
				 const result = JSON.parse(xhr.responseText);
                 // 上传成功
				 if(result.flag == true){
				 }else{
					// showAlert("上传失败");
				 }
             } else {
                 // 上传失败
				 //console.log("fail");
				 showAlert("服务异常,上传失败");
				
             }
			 //上传按钮处理！！！！！
         }
     };
     xhr.open('POST', pathUrl + '/clientQueFile.do' , true);
	 xhr.send(formData);
}

function showAlert(str){
	setTimeout(function(){
		alert(str);
	},100);
}