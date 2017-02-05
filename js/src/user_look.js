(function(){
	$(".js-concern-msg").each(function(){
		var data = $(this).attr("value");
		console.log(data);
		$(this).click(function(){
			var url = "sendFollow.message?senduser="+data;
			$("#email-form").attr("action",url);
			$("#model").fadeIn();
			$(".modal-content").addClass("fadeInDown");
			return false;
		});
	});
	$(".close").click(function(){
		$(".modal-content").removeClass("fadeInDown");
		$("#model").fadeOut();
	});	
})();
(function(){
	$(".title1").click(function(){
	 	$(this).addClass("user-click");
	 	$(".title2").removeClass("user-click");
	 	$(".content1").fadeIn();
	 	$(".content2").fadeOut();
	});
	$(".title2").click(function(){
	 	$(this).addClass("user-click");
	 	$(".title1").removeClass("user-click");
	 	$(".content2").fadeIn();
	 	$(".content1").fadeOut();
	});
})();