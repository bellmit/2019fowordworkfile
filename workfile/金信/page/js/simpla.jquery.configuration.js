$(document).ready(function(){
	
	//Sidebar Accordion Menu:

		$('.nav-top-item').click(function(){
			var secondarymenu=$(this).siblings(".secondary-menu");
			if(secondarymenu.css('display') == 'none'){
				$("#main-nav li .secondary-menu").slideUp(300);
				$('.nav-top-item').removeClass("current");
				secondarymenu.slideDown(300);
				$(this).addClass("current");
				}else{
					$("#main-nav li .secondary-menu").slideUp(300);
					secondarymenu.slideUp(300);
					$('.nav-top-item').removeClass("current");
				}
				// evt.stopPropagation();
			});
			
		$('.submenu-item').click(function(){
			var thirmenu=$(this).siblings(".thir-menu");
			if(thirmenu.css('display') == 'none'){
				$("#main-nav li .thir-menu").slideUp(300);
				$('.submenu-item').removeClass("down1");
				thirmenu.slideDown(300);
				$(this).addClass("down1");
				}else{
					$("#main-nav li .thir-menu").slideUp(300);
					thirmenu.slideUp(300);
					$('.submenu-item').removeClass("down1");
				}
			});
		
		
		

});
  
  
  