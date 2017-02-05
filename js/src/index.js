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
	(function($){
		$("#login-next").click(function(){
			$(".rl-form").css({
				'transform': 'translate3d(-460px,0,0)'
			})
		});
		$("#login-pre").click(function(){
			$(".rl-form").css({
				'transform': 'translate3d(0,0,0)'
			})
		});
		$(".select-img").each(function(){
			$(this).click(function(){
				if($(this).children().eq(1).css('display')=='none'){
					$(this).children().eq(1).css('display','block');
				}else{
					$(this).children().eq(1).css('display','none');
				}
			});
			$(this).hover(function(){
				$(this).children().eq(2).addClass('show_ll');
			},function(){
				$(this).children().eq(2).removeClass('show_ll');
			});
		});
		$("#login-achieve").click(function(){
			swal({
				title: "恭喜你注册成功",
				text: "",
				type: "success",
			},function(){
				location.reload(true) ;
			});
			var a = [];
			$(".select-img").each(function(){
					if($(this).children().eq(1).css('display')=='block'){
						a.push($(this).children().eq(1).attr('value'));
					}

			});
			var url = "regist.go";
			//alert(a.join("&"));
			$.ajax({
				url:url,
				type:'post',
				dataType:'json',
				data:{
					data:new Date(),
					email:$('#name').val(),
					pwd:$("#pwd").val(),
					pwd2:$("#pwd2").val(),
					number:$("#number").val(),
					hoby:a.join("&"),
					check:$("#checked").val()
				},
				success:function(obj){
					//alert("11");
					//alert(obj.data);
				},
				error:function(errorMsg){
					//alert("22");
					//alert(errorMsg);
				}
			});
			return false;
		});
		$(".search-icon").click(function(){
			$("#index_f").submit();
		});
		$('.flicker-example').flicker({
			auto_flick_delay:7,
		});
	})(jQuery);
