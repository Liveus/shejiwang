;(function(){
	function main(){
		CourseSelect();
		TabPub();
		PhotoMore();
		DeletePhoto();
		SendMessage();
	}
	/*课程选择*/
	function CourseSelect(){
		$("#type_select").change(function(){
			var a = $("#type_select").find("option:selected").val();
			window.location.href="wclassWork?Wclass="+a+"";
		});
	}
	/*私密公开切换*/
	function TabPub(){
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
	}
	/*操作作品*/
	function PhotoMore(){
		var show = 1;
		$(".user-more img").each(function(){
			$(this).click(function(){
				if(show==1){
					$(this).css({
						'transform':'rotate(180deg)'
					});
					$(this).parent().next().css({
						'display':'block'
					});
					$(this).parent().next().addClass("fadeInDown");
					show = 0;
				}else{
					$(this).css({
						'transform':'rotate(0deg)'
					});
					$(this).parent().next().css({
						'display':'none'
					});
					$(this).parent().next().removeClass("fadeInDown");
					show = 1;
				}
			});
		})
	}
	/*删除作品*/
	function DeletePhoto(){
		$(".div-more").each(function(){
			$(this).children().eq(0).click(function(){
				var data = $(this).attr("value");
				swal({
					title: "确定删除此作品？",
					text: "",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: '#DD6B55',
					confirmButtonText: '确定',
					cancelButtonText:"取消",
					closeOnConfirm: true,
				},function(){
					 $.ajax({
					 	url:"delete.onework?deleteId="+data+"",
					 	data:data,
					 });
				});
			});
			$(this).children().eq(1).click(function(){
				
			});
		});
	}
	function SendMessage(){
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
	}
	main();
})();
