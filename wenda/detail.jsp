<%@page import="dao.FUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Question"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>问题详情</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/header.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/wenda/detail.css">
</head>
<body>
<%
	Fuser user =(Fuser) session.getAttribute("user");
	Question onequestion = (Question) session.getAttribute("onequestion");
%>
<jsp:include page="../templtate/header2.jsp"></jsp:include>
<div class="contain">
	 <div class="wenda-main fl">
	 	<div class="qa-content">
	 		<div class="qa-content-inner">
	 			<div class="qa-header">
	 				<div class="detail-user">
	 					<!-- 放后台提交上来的文字和图片 -->
                        <span class="detail-provider">提问者</span>
                        <a href="/u/1950939/bbs" target="_blank" class="qa-author"><%= new FUserDAO().findByEmail(onequestion.getQuestioner()).getName() %></a>
                    </div>
	 			</div>
	 		</div>
	 	</div>
	 	<%=onequestion.getContent() %>
	 	<div class="ans_num"><%=onequestion.getAnswer() %>回答</div>
	 	<div class="ques-answer">
	 		<div class="answer-con first">
	 			<div class="user-pic fl">
                    <a href="/u/2692614/bbs" target="_blank">
                        <img src="http://img.mukewang.com/566ae5c70001a0d406310631-100-100.jpg" width="40" height="40" alt="?">
                    </a>
                </div>
                <div class="detail-r">
                    <span class="time"><%=onequestion.getTime() %></span>
                    <a class="detail-name" href="/u/2692614/bbs" target="_blank">静默浅夏</a>
                    <p class="detail-signal">I have a dream</p>
                </div>
                <div class="answer-content rich-text imgPreview">
	                <p dir="ltr">	
	                	可以多看看素材
	                </p>
                </div>
                <div class="ctrl-bar">
                	<span class="agree-with">
                		<b>赞同</b>
                		<em>3</em>
                	</span>
                	<span class="">
                		<b>回复</b>
                		<em>3</em>
                	</span>
                	<span class="">
                		<b>浏览</b>
                		<em>3</em>
                	</span>
                </div>
	 		</div>
	 	</div>
	</div>
	<div class="wenda-slider fr">
	 	<div class="quiz"><a href="save.jsp" class="js-quiz">我要提问</a></div>
	 	<div class="panel about-ques">
            <div class="panel-heading">
              <h2 class="panel-title">相关问题</h2>
            </div>
            <div class="panel-body clearfix">
                <div class="mkhotlist padtop">
                    <a class="relwenda" href="/wenda/detail/325186" target="_blank">现在 学什么比较热门</a><i class="answer-num">2 回答</i>
                </div>
                
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
</script>
</body>
</html>