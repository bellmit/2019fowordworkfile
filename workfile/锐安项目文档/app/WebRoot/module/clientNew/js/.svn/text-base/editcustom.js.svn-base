if(localStorage.wxUser!=null){
	var data = JSON.parse(localStorage.wxUser);
	document.getElementById('userName').innerHTML=data.userName; 
	logInAction(data.userName,data.wXUserId);	
}else{
	alert('授权失败！');
}

mui.init({
    swipeBack:true //启用右滑关闭功能
});
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
    
	//级别
	 var levelData = [{
        value: '0',
        text: '乡科级副职'
    }, {
        value: '1',
        text: '乡科级正职'
    }, {
        value: '2',
        text: '县处级副职'
    },{
        value: '3',
        text: '县处级正职'
    }, {
        value: '4',
        text: '厅局级副职'
    }, {
        value: '5',
        text: '厅局级正职'
    }, {
        value: '6',
        text: '省部级副职'
    },{
        value: '7',
        text: '省部级正职'
    }, {
        value: '8',
        text: '其他'
    }];
	
	getSelect("adminLevelPicker","adminLevelcontent",levelData);
	
	getDynamicSelcet("showProPicker","ProCityRegion",3,cityData3);
	 //行业
    getSelect("showtradePicker","tradeContent",tradeFirstData);
	
	//getPic();
	getTime('getTime');
});

function getPic(){
    var index = 1;
    var size = null;
    var imageIndexIdNum = 0;
    var starIndex = 0;
    var feedback = {
        imageList: document.getElementById('image-list'),
        submitBtn: document.getElementById('submit')
    };
    var url = 'https://service.dcloud.net.cn/feedback';
    feedback.files = [];
    feedback.uploader = null;
    feedback.deviceInfo = null;
    mui.plusReady(function() {
        //设备信息，无需修改
        feedback.deviceInfo = {
            images: feedback.files //图片文件
        }
    });
    /**
     *提交成功之后，恢复表单项
     */
    feedback.clearForm = function() {
        feedback.imageList.innerHTML = '';
        feedback.newPlaceholder();
        feedback.files = [];
        index = 0;
        size = 0;
        imageIndexIdNum = 0;
        starIndex = 0;
    };
    feedback.getFileInputArray = function() {
        return [].slice.call(feedback.imageList.querySelectorAll('.file'));
    };
    feedback.addFile = function(path) {
        feedback.files.push({name:"images"+index,path:path,id:"img-"+index});
        index++;
    };
    /**
     * 初始化图片域占位
     */
    feedback.newPlaceholder = function() {
        var fileInputArray = feedback.getFileInputArray();
        if (fileInputArray &&
            fileInputArray.length > 0 &&
            fileInputArray[fileInputArray.length - 1].parentNode.classList.contains('space')) {
            return;
        };
        imageIndexIdNum++;
        var placeholder = document.createElement('div');
        placeholder.setAttribute('class', 'image-item space');
        var up = document.createElement("div");
        up.setAttribute('class','image-up');
        //删除图片
        var closeButton = document.createElement('div');
        closeButton.setAttribute('class', 'image-close');
        closeButton.innerHTML = 'X';
        closeButton.id = "img-"+index;
        //小X的点击事件
        closeButton.addEventListener('tap', function(event) {
            setTimeout(function() {
                for(var temp=0;temp<feedback.files.length;temp++){
                    if(feedback.files[temp].id==closeButton.id){
                        feedback.files.splice(temp,1);
                    }
                }
                feedback.imageList.removeChild(placeholder);
            }, 0);
            return false;
        }, false);

        //
        var fileInput = document.createElement('div');
        fileInput.setAttribute('class', 'file');
        fileInput.setAttribute('id', 'image-' + imageIndexIdNum);
        fileInput.addEventListener('tap', function(event) {
            var self = this;
            var index = (this.id).substr(-1);

            mui.plus.gallery.pick(function(e) {
                //	console.log("event:"+e);
                var name = e.substr(e.lastIndexOf('/') + 1);
                console.log("name:"+name);
                mui.plus.zip.compressImage({
                    src: e,
                    dst: '_doc/' + name,
                    overwrite: true,
                    quality: 50
                }, function(zip) {
                    size += zip.size;
                    console.log("filesize:"+zip.size+",totalsize:"+size);
                    if (size > (10*1024*1024)) {
                        return mui.toast('文件超大,请重新选择~');
                    }
                    if (!self.parentNode.classList.contains('space')) { //已有图片
                        feedback.files.splice(index-1,1,{name:"images"+index,path:e});
                    } else { //加号
                        placeholder.classList.remove('space');
                        feedback.addFile(zip.target);
                        feedback.newPlaceholder();
                    }
                    up.classList.remove('image-up');
                    placeholder.style.backgroundImage = 'url(' + zip.target + ')';
                }, function(zipe) {
                    mui.toast('压缩失败！')
                });
            }, function(e) {
                mui.toast(e.message);
            },{});
        }, false);
        placeholder.appendChild(closeButton);
        placeholder.appendChild(up);
        placeholder.appendChild(fileInput);
        feedback.imageList.appendChild(placeholder);
    };
    feedback.newPlaceholder();
    feedback.submitBtn.addEventListener('tap', function(event) {
        feedback.send(mui.extend({}, feedback.deviceInfo, {
            images: feedback.files
        }))
    }, false);
    feedback.send = function(content) {
        feedback.uploader = mui.plus.uploader.createUpload(url, {
            method: 'POST'
        }, function(upload, status) {
            //plus.nativeUI.closeWaiting()
            console.log("upload cb:"+upload.responseText);
            if(status==200){
                var data = JSON.parse(upload.responseText);
                //上传成功，重置表单
                if (data.ret === 0 && data.desc === 'Success') {
                    //mui.toast('反馈成功~')
                    console.log("upload success");
                    //feedback.clearForm();
                }
            }else{
                console.log("upload fail");
            }

        });
        //添加上传文件
        mui.each(feedback.files, function(index, element) {
            var f = feedback.files[index];
            console.log("addFile:"+JSON.stringify(f));
            feedback.uploader.addFile(f.path, {
                key: f.name
            });
        });
        //开始上传任务
        feedback.uploader.start();
        //plus.nativeUI.showWaiting();
    };
}

   
 function getData(userName){
		var data = JSON.parse(localStorage.obj);
		var id = data.id;
		//加载客户数据
		$.ajax({
			url: pathUrl+'/getClientInfoLxrApp.do',
			type:"post",
			data : {
				fromAndroid:'true',
				id:id,
				flag:'edit'
			},
			async:false,/*同步请求*/
			dataType:"jsonp",
			jsonp:"callback",
			jsonpCallback:"flightHandler",
			error : function(){
				alert("获取数据失败！");
			},
			success:function(data){
				var msg= data.msg;
				if(msg.indexOf("操作成功!") != -1){
					$("#lxrName").val(data.lxrName);
					document.getElementById('adminLevelcontent').innerHTML = data.xzjb;
					$("#ywbm1").val(data.ywbm1);
					$("#ywbm2").val(data.ywbm2);	
					$("#hyType2").val(data.hyType2);
					$("#gzzw").val(data.gzzw);
					document.getElementById('sexContent').innerHTML = data.sex;
					document.getElementById('ProCityRegion').innerHTML = data.ProCityRegion;
					$("#getTime").val(data.birthday);
					$("#age").val(data.age);
					$("#grah").val(data.grah);
					$("#xgtd").val(data.xgtd);
					$("#phoneNo").val(data.phoneNo);
					$("#officePhone").val(data.officePhone);
					$("#byyx").val(data.byyx);
					$("#ah").val(data.ah);
					$("#jbs").val(data.jbs);
					$("#xypp").val(data.xypp);
					$("#yjpp").val(data.yjpp);
					$("#ycpp").val(data.ycpp);
					$("#jtcy").text(data.jtcy);
					$("#gzjl").text(data.gzjl);
					$("#remark").text(data.remark);
				}else{
					alert("获取数据失败");
				}
			} 
		});
   }
   
 function submitForm(status){
	var data = JSON.parse(localStorage.obj);
	var pid = data.pid;
	var id = data.id
	var lxrName= $("#lxrName").val();
	var xzjb= document.getElementById('adminLevelcontent').innerHTML;
	var gzzw = $("#gzzw").val();
	var ywbm1= $("#ywbm1").val();
	var ywbm2= $("#ywbm2").val();
	var hyType2 = $("#hyType2").val();;
	var sex = document.getElementById('sexContent').innerHTML;
	var ProCityRegion = document.getElementById('ProCityRegion').innerHTML;
	var birthday= $("#getTime").val();
	var age= $("#age").val();
	var grah= $("#grah").val();
	var xgtd= $("#xgtd").val();
	var phoneNo= $("#phoneNo").val();
	var officePhone= $("#officePhone").val();
	var byyx= $("#byyx").val();
	var ah= $("#ah").val();
	var jbs= $("#jbs").val();
	var xypp= $("#xypp").val();
	var yjpp= $("#yjpp").val();
	var ycpp= $("#ycpp").val();
	var jtcy= $("#jtcy").val();
	var gzjl= $("#gzjl").val();
	var remark= $("#remark").val();
	
	var btnArray = ['确定'];
	var userName = document.getElementById('userName').innerHTML;
	if(userName == null || userName == ''){
		mui.confirm('添加人不能为空！', '', btnArray, function(e) {
		});
		return false;
	}
	
	if(status == '0'){//草稿
		
		if(lxrName.length>50){
			mui.confirm('姓名长度不能超过50！', '', btnArray, function(e) {
			});
			return false;
		}
	
		if(ywbm1.length>200){
			mui.confirm('业务部门(一级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		if(ywbm2.length>200){
			mui.confirm('业务部门(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		if(hyType2.length>200){
			mui.confirm('行业分类(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	
		if(gzzw.length>200){
			mui.confirm('工作职务长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	}else{//提交
	
		if(lxrName == null || lxrName == ''){
			mui.confirm('姓名长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(lxrName.length>50){
			mui.confirm('姓名长度不能超过50！', '', btnArray, function(e) {
			});
			return false;
		}
		
		if(ywbm1 == null || ywbm1 == ''){
			mui.confirm('业务部门(一级)长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(ywbm1.length>200){
			mui.confirm('业务部门(一级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		
		if(ywbm2.length>200){
			mui.confirm('业务部门(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
		
		if(hyType2 == null || hyType2 == ''){
			mui.confirm('行业分类(二级)长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(hyType2.length>200){
			mui.confirm('行业分类(二级)长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}

		if(gzzw == null || gzzw == ''){
			mui.confirm('工作职务长度不能为空！', '', btnArray, function(e) {
			});
			return false;
		}else if(gzzw.length>200){
			mui.confirm('工作职务长度不能超过200！', '', btnArray, function(e) {
			});
			return false;
		}
	}
	$.ajax({
		url: pathUrl+'/addClientLxrInfoApp.do',
		type:'post',
		data : {
			fromRunApp:'true',
			lxrName:lxrName,
			xzjb:xzjb,
			gzzw:gzzw,
			ywbm1:ywbm1,
			ywbm2:ywbm2,
			hyType2:hyType2,
			sex:sex,
			ProCityRegion:ProCityRegion,
			birthday:birthday,
			age:age,
			grah:grah,
			xgtd:xgtd,
			phoneNo:phoneNo,
			officePhone:officePhone,
			byyx:byyx,
			ah:ah,
			jbs:jbs,
			xypp:xypp,
			yjpp:yjpp,
			ycpp:ycpp,
			jtcy:jtcy,
			gzjl:gzjl,
			remark:remark,
			pid:pid,
			status:status,
			id:id,
			userName:userName
		},
		async:false,/*同步请求*/
		dataType:'jsonp',
		jsonp:'callback',
		jsonpCallback:'flightHandler',
		error : function(){
		},
		success:function(data){
			var msgArray = ['确定'];
			var msg= data.msg;
			var obj = {id:pid};
			var str = JSON.stringify(obj);
			localStorage.obj = str;
			if(msg.indexOf("提交成功!") != -1){
				mui.confirm('操作成功！', '', msgArray, function(e) {
					mui.openWindow({
						url:"customdetail_sub.html"
					});
				});
			}else{
				mui.confirm('操作失败！', '', msgArray, function(e) {
					mui.openWindow({
						url:"customdetail_sub.html"
					});
				});
			}
		}    
	});
	
}
//登录验证
function logInAction(userName,wxUserId){
	$.ajax({
			url: pathUrl+'/firstLogin.do',
			type:'post',
			data : {
				fromYJTApp:'true',
				name:userName,
				wxUserId:preId+wxUserId
			},
			async:false,/*同步请求*/
			dataType:'jsonp',
			jsonp:'callback',
			jsonpCallback:'flightHandler',
			error : function(){
				alert("获取登录用户信息失败！");
			},
			success:function(data){
				var msg= data.msg;
				if(msg.indexOf("欢迎回来!") != -1){
					getData(userName);
				}else{
					alert("登录失败！");
				}
			}    
		});
   }
