<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            <a href="user_setting.jsp" class="baseinfo fl">基本信息</a>
            <div class="countinfo fl active">帐户信息</div>
        </div>
        <div class="contentBox">
            <div class="formBox">
                <div class="setting-wrap setting-profile" id="setting-profile">
                    <form id="profile" action="index.jsp" >
                        <div class="wlfg-wrap clear">
                            <label class="label-name" for="nick">原密码： ${oldpwd_error}</label>
                            <div class="rlf-group">
                                <input type="password" name="oldpassword" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="原密码">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear" >
                            <label class="label-name" for="nick">新密码： ${newpwd_error}</label>
                            <div class="rlf-group">
                                <input type="password" name="newpassword" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="新密码.">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clear" >
                            <label class="label-name" for="nick">确认密码：</label>
                            <div class="rlf-group">
                                <input type="password" name="newpassword2" id="nick" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="" placeholder="确认密码">
                                <p class="rlf-tip-wrap errorHint color-red"></p>
                            </div>
                        </div>
                        <div class="wlfg-wrap clearfix">
                            <label class="label-name" for=""></label>
                            <div class="rlf-group">
                                <input id="profile-submit" hidefocus="true" aria-role="button" class="rlf-btn-green btn-block profile-btn" vaule="保存">
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
</body>
</html>