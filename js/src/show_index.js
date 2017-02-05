var showshow = $(".showshow");
$(".li_show").each(function(index){
	var j = index;
	var li = showshow.eq(j).children("li");
	$(this).click(function(){
		$(this).css({
			'border-top':'1px solid #f00'
		});
		showshow.eq(j).css({
			'display':'block'
		})
		for(var i=0;i<li.length;i++){
			li.eq(i).addClass('animated flipInX');
			li.eq(i).css({
				'animation-delay':0.1*(i+1)+'s',
			})
		}
		var that = $(this);
		li.each(function(){
			$(this).click(function(){
				// $(this).parent().css({
				// 	'display':'none'
				// });
				that.css({
					'border-top':'1px solid #fff'
				});
				//$(this).parent().parent(".li_show").removeClass('border-top');
				$(this).parent(".showshow").fadeOut();
				//console.log($(this).html());
				var type = $(this).html();
				$.ajax({
					url:"123.html",
					data:{type},
				})
				return false;
			})
		})


	});
	// var that = $(this);
	
});