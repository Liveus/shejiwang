<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.Group"%>
<%@ page import="java.sql.Date"%>
<%@ page import="dao.FUserDAO"%>
<%@ page import="dao.GroupDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_information.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
<%
	Fuser user =(Fuser) session.getAttribute("user");
	List FollowGroup = (List) session.getAttribute("FollowGroup");
	List FollowWorks =(List) session.getAttribute("FollowWorks");
	Iterator Giter = FollowGroup.iterator();
	Iterator Witer = FollowWorks.iterator();
	Work work = (Work)Witer.next();
	Group group = (Group)Giter.next();
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
				<a href="userinfo " class="active">
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
		<div class="user-home-title clear">
			<div class="user-home-type">
				最新动态
			</div>
		</div>
		<div class="user-home-contain">
		<% 
			while(Witer.hasNext()||Giter.hasNext()){%>
			<%if(work.getTime().compareTo(group.getFoundtime())==1){%>
			<div class="item user-course clear">
				<a href="" class="user-head" >
					<img src="<%=basePath %>/user/head/<%=new dao.FUserDAO().findByEmail(work.getEmail()).getHead() %>">
				</a>
				<div class="content infor">
					<div class="head">
						<div class="i-name">
							<%=new dao.FUserDAO().findByEmail(work.getEmail()).getName() %>
						</div>
						<div class="i-time">
							<%=work.getTime() %>
						</div>
						<div class="i-title">
							发布了作品
						</div>
					</div>
					<div class="body">
					<a href="show.onework?id=<%=work.getId()%>">
						<img src="<%=basePath %>/work/pic/<%=new dao.FUserDAO().findByEmail(work.getEmail()).getEmail() %>/<%=work.getPath() %>" alt="" class="fl" width="240" height="135">
					</a>
						<div class="">
							
						</div>
						<div class="sub-content">
							<div class="sub-title">
								<%=work.getTitle()%>
							</div>
							<div class="sub-describe">
								<span><%=work.getCategory()%></span>
							</div>
							<div class="sub-detail">
								阅读量<%=work.getRead()%> 下载量<%=work.getDownload()%>
							</div>
						</div>
					</div>
				</div>
			</div>
				<%if(Witer.hasNext()==false) {%>
				<%work = new Work();work.setTime(new Date(1111));%>
				<%}%>
				<%if(Witer.hasNext()) {%>
				<%work = (Work)Witer.next();%>
				<%}%>
			<%}%>
			<%if(work.getTime().compareTo(group.getFoundtime())==0){%>
			<div class="item user-course clear">
				<a href="" class="user-head" >
					<img src="<%=basePath %>/user/head/<%=new dao.FUserDAO().findByEmail(work.getEmail()).getHead() %>">
				</a>
				<div class="content infor">
					<div class="head">
						<div class="i-name">
							<%=new dao.FUserDAO().findByEmail(work.getEmail()).getName() %>
						</div>
						<div class="i-time">
							<%=work.getTime() %>
						</div>
						<div class="i-title">
							发布了作品
						</div>
					</div>
					<div class="body">
					<a href="show.onework?id=<%=work.getId()%>">
						<img src="<%=basePath %>/work/pic/<%=work.getPath() %>" alt="" class="fl" width="240" height="135">
					</a>
						<div class="">
							
						</div>
						<div class="sub-content">
							<div class="sub-title">
								<%=work.getTitle()%>
							</div>
							<div class="sub-describe">
								<span><%=work.getCategory()%></span>
							</div>
							<div class="sub-detail">
								阅读量<%=work.getRead()%> 下载量<%=work.getDownload()%>
							</div>
						</div>
					</div>
				</div>
			</div>
				<%if(Witer.hasNext()==false) {%>
				<%work = new Work();work.setTime(new Date(1111));%>
				<%}%>
				<%if(Witer.hasNext()) {%>
				<%work = (Work)Witer.next();%>
				<%}%>
			<%}%>
			
			<%if(work.getTime().compareTo(group.getFoundtime())==-1){%> 
			<div class="item user-group clear">
				<a href="" class="user-head" >
					<img src="<%=basePath %>/user/head/<%= new FUserDAO().findByEmail(group.getFounder()).getHead() %>">
				</a>
				<div class="content infor">
					<div class="head">
						<div class="i-name">
							
						</div>
						<div class="i-time">
							<%=group.getFoundtime() %>
						</div>
						<div class="i-title">
							<%= new FUserDAO().findByEmail(group.getFounder()).getName() %>  创建了一个小组
						</div>
					</div>
					<div class="body">
					<a href="show.groupDetail?groupID=<%=group.getId() %>" >
						<img src="<%=basePath %>/usergroup/head/<%=group.getPic() %>" alt="" class="fl" width="125" height="125">
					</a>
						<div class="group-content-2">
							<div class="group-joined">
								<!-- <div class="joining">
									加入
								</div> -->
								<div class="joined">
									
								<%if(new GroupDAO().IfMemberExist(group.getId(),user.getEmail())==true){%>
	               					已加入<%}%>
	               				<%if(new GroupDAO().IfMemberExist(group.getId(),user.getEmail())==false){%>
	               					暂未加入<%}%>
								</div>
							</div>
							
						</div>
						<div class="group-content-1">
							<div class="group-title">
								<%=group.getName() %>
							</div>
							<div class="group-describe">
								人数：<%=group.getAmount() %>人
							</div>
							<div class="group-detail">
								<%=group.getDescribe() %>
							</div>
						</div>
						
					</div>
				</div>
			</div>
				<%if(Giter.hasNext()==false) {%>
				<%group = new Group();group.setFoundtime(new Date(11111));%>
				<%}%>
				<%if(Giter.hasNext()) {%>
				<%group = (Group)Giter.next();%>
				<%}%>
			<%}%>
		<%}%>
		
		<%if(work.getTime().getTime()!=new Date(1111).getTime()){%>
		<div class="item user-course clear">
				<a href="" class="user-head" >
					<img src="<%=basePath %>/user/head/<%=new dao.FUserDAO().findByEmail(work.getEmail()).getHead() %>">
				</a>
				<div class="content infor">
					<div class="head">
						<div class="i-name"><%=work.getTime().getTime() %>
							<%=new dao.FUserDAO().findByEmail(work.getEmail()).getName() %>
							<%=new Date(1111).getTime() %>
						</div>
						<div class="i-time">
							<%=work.getTime() %>
						</div>
						<div class="i-title">
							发布了作品
						</div>
					</div>
					<div class="body">
					<a href="show.onework?id=<%=work.getId()%>">
						<img src="<%=basePath %>/work/pic/<%=work.getEmail() %>/<%=work.getPath() %>" alt="" class="fl" width="240" height="135">
					</a>
						<div class="">
							
						</div>
						<div class="sub-content">
							<div class="sub-title">
								<%=work.getTitle()%>
							</div>
							<div class="sub-describe">
								<span><%=work.getCategory()%></span>
							</div>
							<div class="sub-detail">
								阅读量<%=work.getRead()%> 下载量<%=work.getDownload()%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		
		<%if(group.getFoundtime().getTime()!=new Date(11111).getTime()){%>
		<div class="item user-group clear">
				<a href="" class="user-head" >
					<img src="<%=basePath %>/user/head/<%= new FUserDAO().findByEmail(group.getFounder()).getHead() %>">
				</a>
				<div class="content infor">
					<div class="head">
						<div class="i-name">
							
						</div>
						<div class="i-time">
							<%=group.getFoundtime() %>
						</div>
						<div class="i-title">
							<%= new FUserDAO().findByEmail(group.getFounder()).getName() %>  创建了一个小组
						</div>
					</div>
					<div class="body">
					<a href="show.groupDetail?groupID=<%=group.getId() %>" >
						<img src="<%=basePath %>/usergroup/head/<%=group.getPic() %>" alt="" class="fl" width="125" height="125">
					</a>
						<div class="group-content-2">
							<div class="group-joined">
								<!-- <div class="joining">
									加入
								</div> -->
								<div class="joined">
									
								<%if(new GroupDAO().IfMemberExist(group.getId(),user.getEmail())==true){%>
	               					已加入<%}%>
	               				<%if(new GroupDAO().IfMemberExist(group.getId(),user.getEmail())==false){%>
	               					暂未加入<%}%>
								</div>
							</div>
							
						</div>
						<div class="group-content-1">
							<div class="group-title">
								<%=group.getName() %>
							</div>
							<div class="group-describe">
								人数：<%=group.getAmount() %>人
							</div>
							<div class="group-detail">
								<%=group.getDescribe() %>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<%}%>
		
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