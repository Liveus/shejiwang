var inputbox = $(".inputbox");
inputbox.each(function(index){
	//$(this).children('a');
	if(index==1||index==2||index==3){
		//console.log($(this).children().children("a"));
		var a = $(this).children().children("a");
		a.each(function(){
			
			$(this).click(function(){
				eacha(a);
				$(this).addClass('current');
				$(this).append('<span></span>');
				var content = $(this).data('id');
				$(this).siblings('.typea').val(content);
				console.log($(this).siblings('.typea').val());
			})
		});
	}
});
function eacha(a){
	a.each(function(){
		$(this).removeClass('current');
	});
}
