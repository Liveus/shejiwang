<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="css/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_index.css">
<header>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
	%>
	<nav class="header">
		<div class="container">
			<a href="index.jsp">
				<img src="images/logo.png" alt="" class="logo">
			</a>
			<div class="header-left">
				<ul>
					<li class="li-active">
						<a href="index.jsp">首页</a>
					</li>
					<li>
						<a href="">资源</a>
					</li>
					<li>
						<a href="">社区</a>
					</li>
				</ul>
			</div>
		<div class="header-right">
			<ul>
				<!-- 未登录 -->
				<!-- <li class="login-active" id="reg">
					注册
				</li>
				<li class="login-active" id="log">
					登录
				</li> -->
				<!-- 登录成功 -->
				<li>
					<img src="images/header3.png">
				</li>
				<li>
					<img src="images/header1.png">
				</li>
				<li>
					<img src="images/header2.png">
				</li>
				<li class="user-img">
					<img src="<%=basePath %>/user/head/<%=user.getHead() %>">
					<div class="header-ul">
						<div class="card-inner">
							<div class="card-top">
								<a href="">仲夏</a>
								<p class="">
									<a href="">经验<%=user.getExperience()%></a>
									<a href="">积分<%=user.getIntegral()%></a>
								</p>
							</div>
							<div class="card-set">
								<a href="" target="_blank" class="fl">个人设置</a>
								<a href="exit.go" class="fr">退出</a>
							</div>
						</div>
						<i class="card-arr"></i>
					</div>
				</li>
			</ul>
		</div>
		</div>
	</nav>
</header>