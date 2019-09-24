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
    //普通示例
    //性别
    var sexData = [{
        value: '0',
        text: '男'
    }, {
        value: '1',
        text: '女'
    }];
    getSelect("showSexPicker","sexContent",sexData);
    //行业
    getSelect("showtradePicker","tradeContent",sexData);
    //行政级别
    getSelect("adminLevelPicker","adminLevelcontent",sexData);
    //-----------------------------------------
    //级联示例
    getDynamicSelcet("showCitylPicker","CityContent",3,cityData3);
    //时间选框
    getTime('getTime');
    //getPic();

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
