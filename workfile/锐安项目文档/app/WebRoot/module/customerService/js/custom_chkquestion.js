$(function () {
    //头部展开收起
    $('.rightToggle').die().live('touchend',function(){
        if($(this).hasClass('slt')){
            $(this).removeClass('slt');
            $(this).attr('src','images/toparr.png');
            $('.toggleHeight').addClass('hideText');
            $('.titleText').addClass('hideText');
        }else{
            $(this).addClass('slt');
            $(this).attr('src','images/toparrslt.png');
            $('.toggleHeight').removeClass('hideText');
            $('.titleText').removeClass('hideText');
        }
    });
    $('.titleText').die().live('touchend',function(){
        if($(this).hasClass('slt')){
            $(this).removeClass('slt');
            $(this).next().attr('src','images/toparr.png');
            $('.toggleHeight').addClass('hideText');
            $('.titleText').addClass('hideText');
        }else{
            $(this).addClass('slt');
            $(this).next().attr('src','images/toparrslt.png');
            $('.toggleHeight').removeClass('hideText');
            $('.titleText').removeClass('hideText');
        }
    });
});

