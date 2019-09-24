// 全局对象，不同function使用传递数据
const imgFile = {};
var   file = null;

function handleInputChange () {
    // 获取当前选中的文件
    file = event.target.files[0];
	//可允许上传的单个文件大小
    const imgMaxSize = 1024 * 1024 * 10; // 10MB

    // 检查文件类型
    if(['jpeg', 'png', 'gif', 'jpg'].indexOf(file.type.split("/")[1]) < 0){
        // 自定义报错方式
        //Toast.error("文件类型仅支持 jpeg/png/gif！", 2000, undefined, false);
        return;
    }

    // 文件大小限制
    if(file.size > imgMaxSize ) {
        // 文件大小自定义限制
        //Toast.error("文件大小不能超过10MB！", 2000, undefined, false);
        return;
    }
    
    // 图片压缩之旅
    transformFileToDataUrl(file);
}
// 将File append进 FormData
function transformFileToFormData (file) {
    const formData = new FormData();
    // 自定义formData中的内容
    // type
    formData.append('type', file.type || "image/jpeg");
    // size
    formData.append('size', file.size);
    // name
    formData.append('name', file.name);
    // lastModifiedDate
    formData.append('lastModifiedDate', file.lastModifiedDate);
    // append 文件
    formData.append('file', file);
	
    // 上传图片
    uploadImg(formData);
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
            compress(result, processData, false );    // 图片不压缩
        } else {
            compress(result, processData);            // 图片压缩
        }
    };
    
    reader.readAsDataURL(file);
}
// 使用canvas绘制图片并压缩
function compress (dataURL, callback, shouldCompress) {
    const img = new window.Image();

    img.src = dataURL;
	img.width = 50;
	img.height = 50;
	img.style = 'margin-left: 5px;margin-right:5px';
	
	//document.getElementById('uploadFileList').append(img);
    
	
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
        callback(compressedDataUrl);
    }
	
}

function processData (dataURL) {
    const formData = new FormData();

    // type
    formData.append('type', imgFile.type);
    // size
    //formData.append('size', fileOfBlob.size);
	formData.append('size', imgFile.size);
    // name
    formData.append('name', imgFile.name);
    // lastModifiedDate
    formData.append('lastModifiedDate', imgFile.lastModifiedDate);
    // append 文件
    formData.append('file', file);
	
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
    xhr.addEventListener('error', function(){Toast.error("上传失败！", 2000, undefined, false);}, false);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            const result = JSON.parse(xhr.responseText);
            if (xhr.status === 200) {
                // 上传成功
                setImgInfo(result.fileId,result.fileName);

            } else {
                // 上传失败
				console.log("fail");
            }
        }
    };
    xhr.open('POST', '/YJT_APP/app/upFile/upload' , false);
    xhr.send(formData);
}










/*
(function($,doc){
	document.addEventListener("pluseady", onPlusReady, false);
})(mui,document);

function onPlusReady(){
	$('.formList > li#feedback').on('tap','div#image-list',function(event){
		selectImage();
	})
}

function selectImage(){
	// 从相册中选择图片
	plus.gallery.pick(
		function(file){
			for(var i in file.files){
				console.log(file.files[i].path);
				console.log(file.files[i].name); 
			}
		}, 
		function (e) {
			console.log( "取消选择图片" );
		},
		{filter:"image",multiple:true},
	);
}
*/