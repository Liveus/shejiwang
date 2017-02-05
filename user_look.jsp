<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.Fan"%>
<%@ page import="entity.Follow"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>我的关注</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_look.css">
		<link rel="stylesheet" type="text/css" href="css/animate/animate.min.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		List userfollows =(List) session.getAttribute("userfollows");
		List follows =(List) session.getAttribute("follows");
		List fans = (List) session.getAttribute("fans");
		List userfans = (List) session.getAttribute("userfans");
		Iterator iter = userfollows.iterator();
		Iterator iter1 = userfollows.iterator();
		Iterator iter2 = follows.iterator();
		
		Iterator iter3 = userfans.iterator();
		Iterator iter4 = fans.iterator();
		
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
				<a href="userinfo " >
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
				<a href="usercollect?index=1">
					<i class="icon-heart"></i>
					<span>我的收藏</span>
					<b class="icon-play3"></b>
				</a>
			</li>
			<li>
				<a href="userlook" class="active">
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
		<div class="user-home-title clear">
			<div class="user-home-type user-click title1">
				我的关注
			</div>
			<div class="user-home-type title2">
				我的粉丝
			</div>
			
		</div>
		<div class="user-home-contain content1">
			<div class="concern-list">
				<ul>
		  	<% if(iter1.hasNext()==false)
				{%>没有关注任何人！<%}
			%>
						<%
							while (iter.hasNext()) {
							Fuser followuser = (Fuser) iter.next();
							Follow follow=(Follow)iter2.next();
						%>
					<li class="box">
					 	<div class="left-img">
					 		<a href="/u/10000" target="_blank"><img src="<%=basePath %>/user/head/<%=followuser.getHead() %>" class="top_head"></a>
					 	</div>
					 	<div class="right-c">
					 		<div class="title">
					 			<a href="/u/10000" target="_blank"><span class="nickname"><%=followuser.getName()%></span></a>
					 		</div>
					 		<p class="desc" title="我的私人秘书">
					<%if(follow.getIntroduce()==null){%>
	               	暂未备注<%}%>
	               	<%if(follow.getIntroduce()!=null){%>
	               	<%=follow.getIntroduce()%><%}%>
	               	</p>
					 		<div class="fs-line clear">
					 			<a href="Javascript:" class="u-target"><span class="group"><em>关注</em><em class="u-margin-l-5"><%=followuser.getFollow()%></em></span></a>
							 	<a href="Javascript:" class="u-target u-margin-l-15"><span class="group"><em>粉丝</em><em class="u-margin-l-5"><%=followuser.getFans()%></em></span></a>
					 		</div>
					 		<div class="btn-line" data-is_self="1" data-is-fans="1">
					 			<a href="" target="_blank" class="btn-o btn-gray-o js-concern-msg" value=<%=follow.getFemail()%>>消息</a>
				 			</div>
					 	</div>
					</li>
						<%
							}
						%>	 		 
				</ul>
				
			</div>
		</div>
		<div class="user-home-contain content2" style="display:none">
			<div class="concern-list">
				<ul>
						<%
							while (iter3.hasNext()) {
							Fuser fanuser = (Fuser) iter3.next();
							Fan fan = (Fan)iter4.next();
						%>
					<li class="box">
					 	<div class="left-img">
					 		<a href="/u/10000" target="_blank"><img src="<%=basePath %>/user/head/<%=fanuser.getHead() %>" class="top_head"></a>
					 	</div>
					 	<div class="right-c">
					 		<div class="title">
					 			<a href="/u/10000" target="_blank"><span class="nickname"><%=fanuser.getName()%></span></a>
					 		</div>
					 		<p class="desc" title="我的私人秘书">
					<%if(fan.getIntroduce()==null){%>
	               	暂未备注<%}%>
	               	<%if(fan.getIntroduce()!=null){%>
	               	<%=fan.getIntroduce()%><%}%>
	               	</p>
					 		<div class="fs-line clear">
					 			<a href="Javascript:" class="u-target"><span class="group"><em>关注</em><em class="u-margin-l-5"><%=fanuser.getFollow()%></em></span></a>
							 	<a href="Javascript:" class="u-target u-margin-l-15"><span class="group"><em>粉丝</em><em class="u-margin-l-5"><%=fanuser.getFans()%></em></span></a>
					 		</div>
					 		<div class="btn-line" data-is_self="1" data-is-fans="1">
					 			<a href="" target="_blank" class="btn-o btn-gray-o js-concern-msg" value=<%=fan.getFanemail()%>>消息</a>
				 			</div>
					 	</div>
					</li>
						<%
							}
						%>	 		 
				</ul>
			</div>
		</div>
		<div class="model" id="model">
			<div class="modal-dialog">
				<div class="modal-content animated">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<h4 class="modal-title">
							发送消息
						</h4>
					</div>
					<div class="modal-textarea clear">
						<form action="" method="post" id="email-form">
							<textarea class="input_text" placeholder="说说你想对他说的话..." name = "message"></textarea>
							<div class="modal-submit">
								<input type="submit" value="发送"/>
							</div>
						</form>
					</div>
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
<script src="js/src/user.js"></script>
<script src="js/src/public.js"></script>
</body>
</html>