<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>创建小组</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
    <link rel="stylesheet" type="text/css" href="css/user_index.css">
	<link rel="stylesheet" type="text/css" href="css/user_setting.css">
    
</head>
<body>
<div class="user_setting">
    <div class="top">
        <div class="w960 mauto top_title">
            <p>创建小组</p>
        </div>
    </div>
    <div class="setting">
        <div class="nav-tabs pa">
            <div class="baseinfo fl active">①基本信息</div>
            <div  class="countinfo fl">②选择好友</div>
        </div>
        <div class="contentBox">
            <div class="formBox">
                <div class="setting-wrap setting-profile" id="setting-profile">
                    <form id="profile" action="first.groupCreate" >
                        <div class="wlfg-wrap clear h100">
                            <label class="label-name" for="nick">头像：</label>
                            <div id="preview" class="rlf-group">
                                <img id="imghead" width=150 height=150 border=0 src="face/16.jpg">
                            </div>
                            <div class="uploadhead">上传头像</div>
                            <input type="file" id="fileon" /> 
                            <br class="clear">
                            <p class="rlf-tip-wrap errorHint color-red"></p>  
                        </div>
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">名称：</label>
                            <div class="rlf-group">
                                <input type="text" name="nickname" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="请输入昵称.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">介绍：</label>
                            <div class="rlf-group">
                                <input type="text" name="describe" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="请输入介绍.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">类型：</label>
                            <div class="rlf-group">
                                <select name="class" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control">
                                	<option value="UI设计">UI设计</option>
                                	<option value="平面设计">平面设计</option>
                                	<option value="电脑设计">电脑设计</option>
                                	<option value="网站设计">网站设计</option>
                                </select>
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">地区：</label>
                            <div class="rlf-group">
                                <input type="text" name="location" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="请输入地区.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
             			<div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">联系人：</label>
                            <div class="rlf-group">
                                <input type="text" name="linkman" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="请输入联系人.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">邮箱：</label>
                            <div class="rlf-group">
                                <input type="email" name="email" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="请输入邮箱.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clearfix">
                            <label class="label-name" for=""></label>
                            <div class="rlf-group">
                                <input id="profile-submit"  type="submit" class="rlf-btn-green btn-block profile-btn" value="创建">
                            </div>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script  type="text/javascript"  src="js/lib/headroom.min.js"></script> 
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