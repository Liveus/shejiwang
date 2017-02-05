(function(){
	$(".del").each(function(){
		var data = $(this).attr("value");
		$(this).click(function(){
			swal({
				title: "确定删除此组员？",
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
					 	url:"delete.member?deleteEmail="+data+"",
					 	data:data,
				 });
			});
		})
	});
})();
