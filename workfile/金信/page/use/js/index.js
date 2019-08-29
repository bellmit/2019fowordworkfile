/**
 * Created by Administrator on 14-12-10.
 */

function setObjScroll(objectID,lh, speed, delay) {//lh:行高;delay:延迟;speed:滚动速度
    var o = document.getElementById(objectID);
    var oldspeed = speed;
    o.style.height = "auto";
    var park = false; //是否停靠
    var t; //定时器
    //修正滚动的区域
    /*
     *1、把父元素溢出隐藏
     *2、滚动元素的高度不能为0：通过设置滚动元素中的子元素的高度等于行高lh
     */
    var partnt = o.parentNode;
    if(partnt.offsetHeight <= 0) partnt.style.overflowY = "hidden";//1、把父元素溢出隐藏
    configObj(o);//2、滚动元素的高度不能为0：通过设置滚动元素中的子元素的高度等于行高lh

    if(needScroll(o)){//如果需要滚动，则进行滚动设置
        o.innerHTML += o.innerHTML;//复制一份同样的内容置于原来内容之下，才能实现无缝连
        o.style.marginTop = 0;
        if(window.attachEvent)//IE
        {
            o.attachEvent("onmouseover",setPark);
            o.attachEvent("onmouseout",setScroll);;
        }
        else//FF
        {
            o.addEventListener("mouseover",setPark,true);//必须要有三个参数，缺一不可，而且事件名称没有 on  只是mouseover
            o.addEventListener("mouseout",setScroll,true);
        }

        setTimeout(start, delay);
    }
    function start() {//运行时开始网上滚动
        if (speed == 0) {
            park = true;
        }
        else {
            park = false;
        }
        t = setInterval(scrolling, speed); //setInterval（）不停地调用函数
        if (!park){
            o.style.marginTop = parseInt(o.style.marginTop) - 1 + "px";//向上滚动一个像素以便 scrolling函数的 parseInt(o.style.marginTop) % lh != 0 为真
            //o.style.marginTop = parseInt(o.style.marginTop) - 1 + "px";//向下滚动
        }
    }
    function scrolling() {
        if (parseInt(o.style.marginTop) % lh != 0) {
            o.style.marginTop = parseInt(o.style.marginTop) - 1 + "px";
            if (Math.abs(parseInt(o.style.marginTop)) >= o.scrollHeight / 2) o.style.marginTop = 0;
            //在滚动屏内的内容没有滚动完之前，再重新复制一份内容于下方连接
        } else {//滚动完一行的时候执行
            clearInterval(t); //将终止setInterval调动的循环执行
            setTimeout(start, delay);
        }
    }
    function needScroll(obj){//判断是否需要滚动
        var partnt = o.parentNode;//返回对元素高度
        if(partnt.offsetHeight > obj.offsetHeight){//如果父元素的高度比要滚动的元素的高度要高，则不需要滚动
            return false
        }
        return true;
    }
    function configObj(obj){
        var allChilds = obj.childNodes;
        for(var i=0;i<allChilds.length;i++){
            if(allChilds[i].nodeType == 1)//返回1代表该元素为正常元素标签，返回3代表该元素为文本内容，返回8代表是注释标签，返回9代表是文档的类型
            {
                if(allChilds[i].offsetHeight <= 0){//如果滚动元素中的子元素的高度小于等于零，则可能是元素里面放了浮动元素，需要修正元素的属性
                    allChilds[i].style.height = lh+"px";
                    allChilds[i].style.lineHeight = lh+"px";
                }else{
                    return;
                }
            }
        }

    }
    function setPark(){
        speed = 0;
    }
    function setScroll(){
        speed = oldspeed;
    }
}
setObjScroll("in",3,20,20);
