;(function(){
	/*主入口*/
	function main(){
		PublicNavHover();
		RegisterShow();
		RegisterSlider();
		RegisterPost();
		UserHover();
	}
	/*登陆后滑动显示*/
	function PublicNavHover(){
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
	}
	/*注册模块框*/
	function RegisterShow(){
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


	}
	/*注册滑动翻页*/
	function RegisterSlider(){

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
	}
	/*注册提交*/
	function RegisterPost(){
		$("#login-achieve").click(function(){		
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
					if(obj){
						swal({
							title: "恭喜你注册成功",
							text: "",
							type: "success",
						},function(){
							location.reload(true) ;
						});
					}
				},
				error:function(errorMsg){
					swal({
						title: "注册失败",
						text: "",
						type: "error",
					},function(){
						location.reload(true) ;
					});
				}
			});
			return false;
		});
		
		$(".search-icon").click(function(){
			$("#index_f").submit();
		});
	}

	function UserHover(){
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
	}
	main();
})();


