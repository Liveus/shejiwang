<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>积分详情</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_inter.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		List works =(List) session.getAttribute("works");
		out.print(works.size());  
		Iterator iter = works.iterator();
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="user-title">
	<div class="contain clear">
		<div class="user-infor-left">
			<div class="user-infor-img">
				<img src="images/setting.png" class="user-setting">
				<img src="<%=basePath %>/user/head/<%=user.getHead() %>">
			</div>
		</div>
		<div class="user-infor-left">
			<h3><%=user.getName()%></h3>
			<p class="user-inter"><img src="images/user-infor.png" alt=""><span>积分<%=user.getIntegral()%> </span><span>经验<%=user.getExperience()%></span></p>
			<p class="user-infor-content">这位客观，你也要设计人生？</p>
		</div>
		<div class="user-infor-right">
			<div class="user-look">
				<p><%=user.getFollow()%></p>
				<p>关注</p>
			</div>
			<div class="user-look">
				<p><%=user.getFans()%></p>
				<p>粉丝</p>
			</div>
		</div>
	</div>
</div>
<div class="user-home clear">
	<div class="user-nav">
		<ul>
			<li>
				<a href="list.work" >
					<i class="icon-home"></i>
					<span>个人空间</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="userinfo" >
					<i class="icon-bubbles3"></i>
					<span>他人动态</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="user_inter.jsp" class="active">
					<i class="icon-coin-yen"></i>
					<span>积分详情</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="usercollect?index=1">
					<i class="icon-heart"></i>
					<span>我的收藏</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="userlook" >
					<i class="icon-light-bulb"></i>
					<span>我的关注</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="userdownload?index=1">
					<i class="icon-cloud-download"></i>
					<span>我的下载</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="userfoot" >
					<i class="icon-bug"></i>
					<span>我的足迹</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="usergroup?index=1" >
					<i class="icon-comment"></i>
					<span>我的小组</span>
					<b class="icon-play3"></b>
				</a>
			</li>
		</ul>
	</div>
	<div class="user-home-content">
		<!-- <div class="user-home-title clear">
			<div class="user-home-type user-click">
				公开
			</div>
			<div class="user-home-type">
				私密
			</div>
			<div class="user-home-course">
				<select name="" id="">
					<option value="全部课程">
						全部课程
					</option>
					<option value="字体设计">
						字体设计
					</option>
					<option value="UI设计">
						UI设计
					</option>
					<option value="海报设计">
						海报设计
					</option>
					<option value="平面设计">
						平面设计
					</option>
					<option value="插画设计">
						插画设计
					</option>
					<option value="摄影">
						摄影
					</option>
					<option value="VI设计">
						VI设计
					</option>
				</select>
			</div>
		</div> -->
		<div class="user-home-contain">
			<div class="current-status">
		        <h3><span>您当前赚取积分</span><a href="/about/faq?t=3">积分规则</a></h3>
		        <p><%=user.getIntegral()%></p>
		        <div class="link-box">
		            <span>积分土豪的都喜欢来这里，</span>
		            <a href="/mall/index">积分商城</a>
		        </div><!-- .link-box end -->
		    </div>
		    <div class="credit-list">
		        <div class="title clear">
		            <h3>积分历史记录</h3>
		            <p>此处最多保留最近1个月的记录</p>
		        </div>
		        <div class="nodata">暂无任何积分赚取记录</div>
		                
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script  type="text/javascript"  src="js/lib/headroom.min.js"></script> 
<script src="js/src/public.js"></script>
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