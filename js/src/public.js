$(".user-img").hover(function(){
	$(".header-ul").css({
		'display':'block'
	})
});
$(".header-ul").hover(function(){
	$(".header-ul").css({
		'display':'block'
	});
},function(){
	setTimeout(function(){
		$(".header-ul").css({
			'display':'none'
		});
	},500);
	
});
(function($){
	$("#reg").click(function(){
		$(".user-login-register").fadeIn();		
		$(".login").css({
			'display':"block"
		});
		$(".register").css({
			'display':"none"
		});
	});
	$("#log").click(function(){
		$(".user-login-register").fadeIn();
		$(".login").css({
			'display':"none"
		});
		$(".register").css({
			'display':"block"
		});
	});
	$(".rl-bg").click(function(){
		$(".user-login-register").fadeOut();
	});
})(jQuery);

(function(){
	$(".means2").hover(function(){
		$(this).siblings('.means_list').fadeIn();
		$(this).siblings('.means_list').hover(function(){
			$(this).fadeIn();
		},function(){
			$(this).fadeOut();
		});
	},function(){
		setTimeout(function(){
			$(this).siblings('.means_list').fadeOut();
		},500);
	});
})();