<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>发布作品</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/upload_teach.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="upload_title">
		<div class="title_box">
			<h3>
				发布作品
			</h3>
		</div>
	</div>
	<div class="upload_contant">
		<form action="upload.onework?" method="post" enctype="multipart/form-data">
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
						作品名称
					</label>
					<input type="text" value="" class="input_text" name="title">
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	作品状态
					</label>
					<input type="hidden" class="typea" name="authority">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="公开">公开<span></span></a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="私密">私密</a>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	作品性质
					</label>
					<input type="hidden" class="typea" name="property">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="原创">原创<span></span></a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="转载">转载</a>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	作品类目
					</label>
					<input type="hidden" class="typea" name="workclass">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="字体设计">字体设计<span></span></a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="UI设计">UI设计</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="海报">海报</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="平面设计">平面设计</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="插画设计">插画设计</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="摄影">摄影</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="VI设计">VI设计</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="logo设计" style="margin-left:108px;margin-top:20px">logo设计</a>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input ">
					<label class="input_label content_div">
						下载积分
					</label>
					<input type="number" value="" class="input_text content_number" name="integrate">
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	作品说明
					</label>
					<textarea class="input_text content_div input_shuomin" name="introduce"></textarea>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
						上传图片
					</label>
					<div class="uploadBtnBox">
						<span class="uploadBtn">
							<div class="webuploader-pick">
								选择图片
							</div>
							<div class="" style="position: absolute;top: 649px;left: 214px; width: 122px; height: 44px; overflow: hidden; bottom: auto; right: auto;z-index:3;">
								<input type="file" name="file" class="webuploader-element-invisible"  accept="image/jpeg,image/jpg,image/png">
								<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
							</div>
						</span>
						<span class="uploadTip">
							<font>只接受有学习价值的教程哦</font>
							<br>
							文件大小支持15M以下JPG、PNG图片
							<br>
							如遇上传失败请换个浏览器（谷歌浏览器）或作品上传
						</span>
					</div>
				</div> 
			</div>
			<!-- <div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
						分享源文件
					</label>
					<div class="uploadBtnBox">
						<span class="uploadBtn">
							<div class="webuploader-pick">
								选择文件
							</div>
							<div class="" style="position: absolute; top: 741px; left: 214px; width: 122px; height: 44px; overflow: hidden; bottom: auto; right: auto;z-index:3;">
								<input type="file" name="test" class="webuploader-element-invisible" multiple="multiple" accept="image/jpeg,image/jpg,image/png">
								<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
							</div>
						</span>
						<span class="uploadTip">
							<font>分享成品源文件和所用到的素材能帮助学员更好的理解哦</font>
							<br>
							支持150M以下PSD/RAR/ZIP文件
						</span>
					</div>
				</div> 
			</div> -->
			<div class="submitBtnBox">
				<input type="submit" value="提交" class="submitBtn">
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="js/lib/headroom.min.js"></script> 
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
<script src="js/src/public.js"></script>
<script type="text/javascript"  src="js/src/upload_teach.js"></script>
</body>
</html>