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
    //省份
    getSelect("showProPicker","ProContent",sexData);
    //行业
    getSelect("showtradePicker","tradeContent",sexData);
    //地市
    getSelect("showlocPicker","locContent",sexData);

    //-----------------------------------------
});