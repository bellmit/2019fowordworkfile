mui.init({
    swipeBack:true //启用右滑关闭功能
});
var timer = null;
var delfile = [];
mui.ready(function() {
    setTimeout(function(){
        $('.formbtns').attr('style','top:'+(document.documentElement.clientHeight - $('.formbtns').height())+'px');
    },10);
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
        text: '类别1'
    }, {
        value: '1',
        text: '类别2'
    }];
    getSelect("typeNames","selType",typeNames);

    //取消确认
    document.getElementById("confirmBtn").addEventListener('tap', function() {
        var btnArray = ['取消', '确定(3)'];
        mui.confirm('本次输入不会被保存，是否放弃新增问题？', ' ', btnArray, function(e) {
            if (e.index == 1) {//是
                clearInterval(timer);
            } else {//否
                clearInterval(timer);
            }
        });
        var i=2;
        timer = setInterval(function(){
            if(i>=0){
                $('.mui-popup-button-bold').text('确定('+i+')');
                i--;
            }else{
                $('.mui-popup').remove();
                $('.mui-popup-backdrop').remove();
                clearInterval(timer);
            }
        },1000);
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
                _html='<span class="imgbtn left relative" data-input="'+$(e.target).attr("data-id")+'" data-time="'+file.lastModified+'">'+
                    '<img src="images/imgicon.png" class="imgicon" />'+
                    '<a href="javascript:;" class="imgdelbtn">'+
                    '<img src="images/delicon.png" alt class="imgdelicon" />'+
                    '</a>'+
                    '</span>';
            }else{
                var file = e.target.files;
                $.each(file,function(i,item){
                    _html+='<span class="imgbtn left relative" data-input="'+$(e.target).attr("data-id")+'" data-time="'+item.lastModified+'">'+
                        '<img src="images/imgicon.png" class="imgicon"/>'+
                        '<a href="javascript:;" class="imgdelbtn">'+
                        '<img src="images/delicon.png" alt class="imgdelicon" />'+
                        '</a>'+
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
