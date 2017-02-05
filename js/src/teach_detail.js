$(".zan_input").click(function(){
	console.log($(this).html());
	var data =  $(this).html();
	$.ajax({
		url:"zan.oneTeach",
		type:'post',
		data:{data},
		dataType:'json',
		sucuess:function(obj){
			alert("11");
			alert(obj);
		},
		error:function(){
			alert("22");
		}
	})
});
$(".cai_input").click(function(){
	console.log($(this).html());
	var data =  $(this).html();
	$.ajax({
		url:"cai.oneTeach",
		data:{data},
		sucuess:function(){

		}
	});
});