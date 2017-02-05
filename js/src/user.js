(function(){
	
	$("#type_select").change(function(){
		var a = $("#type_select").find("option:selected").val();
		window.location.href="wclassWork?Wclass="+a+"";
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
(function(){
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
})();
(function(){
	$(".div-more").each(function(){
		$(this).children().eq(0).click(function(){
			var data = $(this).attr("value");
			swal({
/*				title: "纭畾鍒犻櫎姝や綔鍝侊紵",
				text: "",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '纭畾',
				cancelButtonText:"鍙栨秷",
				*/
				title: "确定删除此作品？",
				text: "",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '确定',
				cancelButtonText:"取消",
				closeOnConfirm: true,
			},
			function(){
				 $.ajax({
				 	url:"delete.onework?deleteId="+data+"",
				 	data:data,
				 });
			});
		});
		$(this).children().eq(1).click(function(){
			
		});
	});
})();