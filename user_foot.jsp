<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.Foot"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>我的小组</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_index.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		List foots =(List) session.getAttribute("foots");
		List footworks =(List) session.getAttribute("footworks");
		
		Iterator iter = foots.iterator();
		Iterator iter2 = footworks.iterator();
		String[] timeStrArray = {"","",""};
		if(iter.hasNext()){
		Foot foot1 = (Foot) iter.next();
		timeStrArray = foot1.getTime().toString().split("-");
		}
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
				<a href="user_inter.jsp">
					<i class="icon-coin-yen"></i>
					<span>积分详情</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href=usercollect?index=1>
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
				<a href="userfoot" class="active">
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
		<div class="user-home-title clear">
			<div class="user-home-type user-click">
				我的足迹
			</div>
			
		</div>
		<div class="user-home-contain">
			<div class="user-home-list">
				<span class="time">
					<%if(timeStrArray[0]!=""){%>
	                <b><%=timeStrArray[0]%></b>
	                <em><%=timeStrArray[1]%>月<%=timeStrArray[2]%>日</em><%}%>
	            </span>
				<div class="user-course-list">
				 	<ul>
				 		<%
							while (iter2.hasNext()) {
							Work work = (Work) iter2.next();
						%>
				 		<li class="course-one clear">
				 			<div class="course-list-img">
				 				<a href="show.onework?id=<%=work.getId()%>">
				 					<img src="<%=basePath %>/work/pic/<%=work.getEmail() %>/<%=work.getPath() %>" >
				 				</a>
				 			</div>
				 			<div class="course-list-cont">
				 				<h3>
					 				<%=work.getTitle()%>
					 				<span class="user-more"><img src="images/user-more.png"></span>
				 				</h3>
				 				<div class="list-cont">
				 					<span><%=work.getWclass() %></span>
				 				</div>
				 				<div class="list-cont">
				 				<div class="list-cont">
				 					<span>阅读量<em><%=work.getRead()%></em></span>
				 					<span>下载量<em><%=work.getDownload()%></em></span>
				 				</div>
				 			</div>
				 		</li>
						<%
							}
						%>
				 	</ul>
				</div>
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