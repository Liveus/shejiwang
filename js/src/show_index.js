(function(){
	var showshow = $(".showshow");
	var Switch = true;
	$(".li_show").each(function(index){
		var j = index;
		var li = showshow.eq(j).children("li");
		li.each(function(){
			$(this).click(function(){
				$(this).parent().parent().css({
					'border-top':'0px solid #fff'
				});
				
				$(this).parent(".showshow").fadeOut();
				var type = $(this).html();
				$.ajax({
					url:"123.html",
					data:{type},
				})
				return false;
			})
		});
		if(Switch){
			$(this).click(function(){
				Switch = false;
				$(this).css({
					'border-top':'1px solid #f00'
				});
				showshow.eq(j).css({
					'display':'block'
				});
				for(var i=0;i<li.length;i++){
					li.eq(i).addClass('animated flipInX');
					li.eq(i).css({
						'animation-delay':0.1*(i+1)+'s',
					})
				}
				
			});

		}else{
			$(this).click(function(){
				$(this).find('.showshow').css({
					'display':'none'
				})
			});
		}
		// var that = $(this);	
	});
})()