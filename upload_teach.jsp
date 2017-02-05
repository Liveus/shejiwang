<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>上传教程</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/upload_teach.css">

	<script type="text/javascript" charset="utf-8" src="js/lib/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/lib/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="js/lib/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="upload_title">
		<div class="title_box">
			<h3>
				发布教程
			</h3>
		</div>
	</div>
	<div class="upload_contant">
		<form action = "upload.oneTeach" method = "post" >
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
						作品名称
					</label>
					<input type="text" value="" class="input_text" name = "title">
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	教程性质
					</label>
					<input type="hidden" class="typea" name = "xinzhi">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="原创">原创<span></span></a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="转载">转载</a>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	教程分类
					</label>
					<input type="hidden" class="typea" name = "Tclass">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="设计教程">设计教程</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="经验分享">经验分享</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="优秀文章">优秀文章</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="字体特效">字体特效</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="调色教程">调色教程</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="配色教程">配色教程</a>
				</div>
			</div>
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	等级选择
					</label>
					<input type="hidden" class="typea" name = "grade">
					<a href="javascript:;" class="input_kid_radio content_div" data-id="初级">初级</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="中级">中级</a>
					<a href="javascript:;" class="input_kid_radio content_div" data-id="高级">高级</a>
				</div>
			</div>
			
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
						封面
					</label>
					<div class="uploadBtnBox">
						<span class="uploadBtn">
							<div class="webuploader-pick">
								选择图片
							</div>
							<div class="" style="position: absolute; top: 429px; left: 207.5px; width: 122px; height: 44px; overflow: hidden; bottom: auto; right: auto;z-index:3;">
								<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/jpeg,image/jpg,image/png">
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
			<div class="inputbox">
				<div class="content_input">
					<label class="input_label content_div">
					 	教程内容
					</label>
					<script id="editor" type="text/plain" style="width:780px;height:400px;"></script>
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
							<div class="" style="position: absolute; top: 676px; left: 207.5px; width: 122px; height: 44px; overflow: hidden; bottom: auto; right: auto;z-index:3;">
								<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/jpeg,image/jpg,image/png">
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
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
</body>
</html>