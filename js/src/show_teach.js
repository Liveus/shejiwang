;(function(){
	$(".cateSub .sub-m a").each(function(){
		$(this).click(function(){
			console.log($(this).html());
		})
	});
	$(".leaveSub .sub-m a").each(function(){
		$(this).click(function(){
			console.log($(this).html());
		})
	});
	$(".orderSub .sub-m a").each(function(){
		$(this).click(function(){
			//console.log($(this).html());
			var data = $(this).html();
			$.ajax({
				url:"123.html",
				data:{data},
			})
		})
	});
	var aList = $(".keyword-tags a");
	aList.each(function(){
		$(this).click(function(){
			var data = $(this).html();
			$("#t_form .input_search").val(data);
			$("#t_form").submit();
		});
	});
})();