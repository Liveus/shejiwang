<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<%
		Fuser user =(Fuser) session.getAttribute("user");
		String login = (String) session.getAttribute("login");
%>
<meta charset="utf-8">
<title>个人空间</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/user.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<link rel="stylesheet" type="text/css" href="css/user_index.css">
<link rel="stylesheet" type="text/css" href="css/user_setting.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<jsp:include page="templtate/header.jsp"></jsp:include>
	<div class="user_setting">
		<div class="top">
			<div class="w960 mauto top_title">
				<p>个人设置</p>
			</div>
		</div>
		<div class="setting">
			<div class="nav-tabs pa">
				<div class="baseinfo fl active">基本信息</div>
				<a href="user_password.jsp" class="countinfo fl">帐户信息</a>
			</div>
			<div class="contentBox">
				<div class="formBox">
					<div class="setting-wrap setting-profile" id="setting-profile">
						<form id="profile" action="InfoChange" method="post"
							enctype="multipart/form-data">
							<div class="wlfg-wrap clear h100">
								<label class="label-name" for="nick">头像：</label>
								<div id="preview" class="rlf-group">
									<img id="imghead" width=150 height=150 border=0
										src="<%=basePath %>/user/head/<%=user.getHead() %>">
								</div>
								<div class="uploadhead">上传头像</div>
								<input type="file" id="fileon" name="file"  accept="image/jpeg,image/jpg,image/png"/> <br class="clear">
								<p class="rlf-tip-wrap errorHint color-red"></p>
							</div>
							<div class="wlfg-wrap clear">
								<label class="label-name" for="nick">昵称：</label>
								<div class="rlf-group">
									<input type="text" name="nickname" id="nick" autocomplete="off"
										data-validate="require-nick" class="moco-form-control"
										value="" placeholder="请输入昵称.">
									<p class="rlf-tip-wrap errorHint color-red"></p>
								</div>
							</div>
							<div class="wlfg-wrap clear">
								<label class="label-name" for="nick">城市：</label>
								<div data-toggle="distpicker" class="rlf-group profile-address">
									<select class="moco-form-control" name="sheng"></select> <select
										class="moco-form-control" name="shi"></select> <select
										class="moco-form-control mr0" name="qu"></select> <br
										class="clear">
									<p class="rlf-tip-wrap errorHint color-red"></p>
								</div>
							</div>
							<div class="wlfg-wrap clear">
								<label class="label-name h16 lh16">性别：</label>
								<div class="rlf-group rlf-radio-group">
									<label class="lh16"><input type="radio"
										hidefocus="true" value="保密" name="sex">保密</label> <label
										class="lh16"><input type="radio" hidefocus="true"
										value="男" checked="checked" name="sex">男</label> <label
										class="lh16"><input type="radio" hidefocus="true"
										value="女" name="sex">女</label>
									<p class="rlf-tip-wrap errorHint color-red"></p>
								</div>
							</div>
							<div class="wlfg-wrap clearfix">
								<label class="label-name" for="aboutme">个性签名：</label>
								<div class="rlf-group">
									<div class="pr">
										<textarea name="aboutme" id="aboutme" rows="5"
											class="noresize js-sign moco-form-control"></textarea>
										<p class="rlf-tip-wrap errorHint color-red"></p>
									</div>
								</div>
							</div>
							<div class="wlfg-wrap clearfix">
								<label class="label-name" for=""></label>
								<div class="rlf-group">
									<input type="submit" id="profile-submit" hidefocus="true"
										aria-role="button" class="rlf-btn-green btn-block profile-btn"
										vaule="保存">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/lib/headroom.min.js"></script>
	<script>
var elem=document.querySelector("header");
var headroom = new Headroom(elem, {
    "tolerance": 12,
    "offset": 30,
    "classes": {
        "initial": "headroom",
        "pinned": "headroom--pinned",
        "unpinned": "headroom--unpinned"
    }
});
headroom.init();
 </script>
	<script src="js/lib/distpicker.data.js"></script>
	<script src="js/lib/distpicker.js"></script>
	<script>
(function(){
    var $distpicker = $('#distpicker');
    $distpicker.distpicker({
        province: '福建省',
        city: '厦门市',
        district: '思明区'
    });
})();
</script>
	<script src="js/src/user.js"></script>
	<script src="js/src/public.js"></script>
	<script src="js/lib/lookimg.js"></script>
	<script>
    
</script>
</body>
</html>