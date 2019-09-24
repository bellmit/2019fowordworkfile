// 全局对象，不同function使用传递数据
const imgFile = {};
//var file = null;
var fileNum = 0;
var maxNum = 5;
function upFileClick(obj){
	//$("#fileInp_"+fileNum).click();
	/**/
	if(fileNum >= maxNum){
		showAlert("最多不能超过"+maxNum+"张");
		return false;
	}
	if($("#file-ing").hasClass("hidden-node")){
		$("#fileInp_"+fileNum).click();	
	}else{
		showAlert("上传中,请稍等...");
	}
		
}
function showAlert(str){
	setTimeout(function(){
		alert(str);
	},100);
}
		
function fileInpChange(){	
	// 获取当前选中的文件
	var files = event.target.files;
	if(!files || files.length == 0){
		return false;
	}
	if(files.length + fileNum > maxNum){
		showAlert("最多不能超过"+maxNum+"张");
		$("#fileInp_"+fileNum).val("");
		return false;
	}
	for(var i=0; i<files.length; i++){
		var file = event.target.files[i];
		if(file){
			toReadBtn(); //上传按钮处理
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
			transformFileToDataUrl(file);
			// 图片上传
			transformFileToFormData(file);
		}	
	}
	
}
function toReadBtn(){
	$("#file-ing").removeClass("hidden-node");
}
function toCliekBtn(){
	$("#file-ing").addClass("hidden-node");
}
function showFileSuccess(filePath,name){
	var nextFileLi = $("#upFileLi_"+fileNum).clone(true);
	$("#upFileName_"+fileNum).val(filePath);
	$("#name_"+fileNum).val(name);
	$("#upFileLi_"+fileNum).prev().removeClass("nobottomborder");
	//$("#upFileLi_"+fileNum).css("display","list-item");  //不显示文件名

	fileNum = fileNum + 1;
	nextFileLi.attr("id","upFileLi_"+fileNum);
	nextFileLi.find("input[name='name']").attr("id","name_"+fileNum);
	nextFileLi.find("input[name='filePath']").attr("id","upFileName_"+fileNum);
	nextFileLi.find("input[name='fileInp']").attr("id","fileInp_"+fileNum);
	$("#upfileBtn").before(nextFileLi);	
}

function getTypeSelcet(){
	var tradePicker = new mui.PopPicker({
		layer: 1
	});
	var typeData = [{value:'1',text:'商机信息'},{value:'2',text:'客户动态'},{value:'3',text:'友商动态'},{value:'4',text:'产品信息'},{value:'5',text:'政策动态'},{value:'6',text:'其他'}];
	tradePicker.setData(typeData);
	var showTradePickerButton = document.getElementById("showInfoType");
	var tradeResult = document.getElementById("typeContent");
	showTradePickerButton.addEventListener('tap', function(event) {
		tradePicker.show(function(items) {
			tradeResult.innerText = items[0].text;
			//返回 false 可以阻止选择框的关闭
			//return false;
		});
	}, false);
}

// 将file转成dataUrl
function transformFileToDataUrl (file) {
    const imgCompassMaxSize = 200 * 1024; // 超过 200k 就压缩
    // 存储文件相关信息
    imgFile.type = file.type || 'image/jpeg'; // 部分安卓出现获取不到type的情况
    imgFile.size = file.size;
    imgFile.name = file.name;
    imgFile.lastModifiedDate = file.lastModifiedDate;

    // 封装好的函数
    const reader = new FileReader();

    // file转dataUrl是个异步函数，要将代码写在回调里
    reader.onload = function(e) {
        const result = e.target.result;
        if(result.length < imgCompassMaxSize) {
            compress(result, transformFileToFormData, false );    // 图片不压缩
        } else {
            compress(result, transformFileToFormData);            // 图片压缩
        }
		
    };    
    reader.readAsDataURL(file);
}

// 使用canvas绘制图片并压缩
function compress (dataURL, callback, file, shouldCompress) {
    const img = new window.Image();

    img.src = dataURL;
	img.width = 50;
	img.height = 50;
	img.style = 'margin-left: 5px;margin-right:5px';  
	
    img.onload = function () {
        const canvas = document.createElement('canvas');
		$('#uploadFileList').append(canvas);
        const ctx = canvas.getContext('2d');
        canvas.width = img.width;
        canvas.height = img.height;
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        var compressedDataUrl;
        if(shouldCompress){
            compressedDataUrl = canvas.toDataURL(imgFile.type, 0.2);
        } else {
            compressedDataUrl = canvas.toDataURL(imgFile.type, 1);
        }
        //callback(file);
    }
	
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
			if (xhr.status === 200) {
				const result = JSON.parse(xhr.responseText);
                // 上传成功
				if(result.flag == true){
					showFileSuccess(result.fileName,result.name);
				}else{
					showAlert("上传失败");
				}
            } else {
                // 上传失败
				//console.log("fail");
				showAlert("服务异常,上传失败");
            }
			toCliekBtn();//上传按钮处理
        }
    };
    xhr.open('POST', pathUrl + '/addQuestionFromMobile.do' , true);
    xhr.send(formData);
}
