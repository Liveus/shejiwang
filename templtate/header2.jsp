<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		String login = (String) session.getAttribute("login");
	%>
	<nav class="header">
		<div class="containerh">
			<a href="index.jsp">
				<img src="../images/logo.png" alt="" class="logo">
			</a>
			<div class="header-left">
				<ul>
				<li class="li-active">
					<a href="../index.jsp">首页</a>
				</li>
				<li>
					<a href="../commonPhotosearch.allwork?CPindex=1&searchContent=">作品</a>
				</li>
				<li>
					<a href="../show.allwork?search=全部作品&AWindex=1">素材</a>
				</li>
				<li>
					<a href="../show.allteach?ATindex=1">教程</a>
				</li>
				<li>
					<a href="../index.question?QAindex=1">悬赏</a>
				</li>
				<li>
					<a href="" class="means2">上传</a>
					<div class="means_list">
						<a href="../upload_photo.jsp">上传作品</a>
						<a href="../upload_teach.jsp">上传教程</a>
						<a href="../upload_photo.jsp">上传素材</a>
					</div>
				</li>
				</ul>
			</div>
		<%if(login.equals("1")){%>	
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
					<img src="../images/header3.png">
				</li>
				<li>
					<img src="../images/header1.png">
				</li>
				<li>
					<img src="../images/header2.png">
				</li>
				<li class="user-img">
				<a href="list.work">
					<img src="<%=basePath %>/user/head/${user.head}">
				</a>
					<div class="header-ul">
						<div class="card-inner">
							<div class="card-top">
								<a href="list.work">${user.name }</a>
								<p class="">
									<a href="">经验${user.experience }</a>
									<a href="">积分${user.name}</a>
								</p>
							</div>
							<div class="card-set">
								<a href="../user_setting.jsp" target="_blank" class="fl">个人设置</a>
								<a href="../exit.go" class="fr">退出</a>
							</div>
						</div>
						<i class="card-arr"></i>
					</div>
				</li>
			</ul>
		</div>
		<%}%>
		<%if(login.equals("0")){%>
			<div class="header-right">
		<ul>
			<li class="login-active" id="reg">
				注册
			</li>
			<li class="login-active" id="log">
				登录
			</li>
		</ul>
	</div>
		<%}%>
		</div>
	</nav>
</header>