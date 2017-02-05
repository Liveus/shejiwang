<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>我要提问</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>

    <script type="text/javascript" charset="utf-8" src="../js/lib/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/lib/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../js/lib/lang/zh-cn/zh-cn.js"></script>
	
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/header.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/wenda/save.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
	%>
<jsp:include page="../templtate/header2.jsp"></jsp:include>
<div class="contain clear">
	<div class="fl main-l">
		<h2 class="new-save-title">提问</h2>
		<form action="new.question" id="form1" method="post">
			<input value="" type="text" placeholder="请输入标题" class="save-title" name = "title">
	    	<input value="" type="hidden" id="value">
            <div class="content_input">
                <label class="input_label content_div">选择分类</label>
                <select name="Qclass" id="" class="save-select input_text">
                    <option value="UI设计">UI设计</option>
                    <option value="网页设计">网页设计</option>
                    <option value="app设计">app设计</option>
                </select>
            </div>
            <div class="content_input paddingleft30">
                <label class="input_label content_div">悬赏积分</label>
                <input value="" placeholder="数字" type="number" class="input_text save-number" name="integrate">
            </div>
            <div class="clear"></div>
	    	
	    <script id="editor" type="text/plain" style="width:780px;height:400px;"></script>
	    
	    </form>
	    <button id="submit"> 提交</button>
	</div>
    <div class="fr main-r">
    	<div class="panel bbs-sendques">
	        <div class="panel-body">
	          <h1>提问注意事项</h1>
	          <dl>
	            <dd>1、大家每天可以免费提出两个问题，从第三个问题起，每个问题扣除2点积分，请知晓哦；</dd>
	            <dd>2、您是来解决问题？请先搜索是否已经有同类问题吧。这样您就省心少打字。</dd>
	            <dd>3、没找到是么？就在发问题时精确描述你的问题，不要写与问题无关的内容哟；</dd>
	            <dd>4、设集网论更热衷于解达您想要的答案。能引起思考和讨论的知识性问题；</dd>
	            <dt>问答禁止这些提问</dt>
	            <dd>1、禁止发布求职、交易、推广、广告类与问答无关信息将一律清理。</dd>
	            <dd>2、尽可能详细描述您的问题，如标题与内容不符，或与问答无关的信息将被删除扣分。</dd>
	            <dd>3、问答刷屏用户一律冻结帐号</dd>
	          </dl>
	        </div>
	    </div>
    </div>
</div>
<script type="text/javascript" src="../js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="../js/lib/headroom.min.js"></script> 
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
(function(){
	$("#submit").click(function(){
		var img = $("#editor-trigger img");
		var length = $("#editor-trigger img").length;
		for(var i = 0;i<length;i++){
			var input = $("<input type='hidden'>");
			console.log(input);
			input.val(img.attr("src"));
			input.appendTo($("#form1"));
		}
		$("#value").val($("#editor-trigger").html());
        console.log($("#editor-trigger").html());
		$("#form1").submit();
		return false;
	});
})();
</script>

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