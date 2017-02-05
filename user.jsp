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
	<title>个人空间</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="css/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_index.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
<%
	String Wclass = request.getParameter("Wclass");
	Fuser user =(Fuser) session.getAttribute("user");
	List works =(List) session.getAttribute("works");
	List privateworks = (List) session.getAttribute("privateworks");
	Iterator iter = works.iterator();
	Iterator iter2 = works.iterator();
	Iterator iter3 = privateworks.iterator();
	Iterator iter4 = privateworks.iterator();
	String[] sourceStrArray = {"","",""};
	if(iter2.hasNext()){
	Work work1 = (Work) iter2.next();
	sourceStrArray = work1.getTime().toString().split("-");
	}
	String[] sourceStrArray1 = {"","",""};
	if(iter3.hasNext()){
	Work Firstprivatework = (Work) iter3.next();
	sourceStrArray1 = Firstprivatework.getTime().toString().split("-");
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
				<a href="list.work" class="active">
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
			<div class="user-home-type user-click title1">
				公开
			</div>
			<div class="user-home-type title2">
				私密
			</div>
			<div class="user-home-course">
				<select name="" id="type_select">
					<option value="全部课程"<%if(Wclass.equals("0")) {%>selected<%}%>>
						全部课程
					</option>
					<option value="字体设计"<%if(Wclass.equals("1")) {%>selected<%}%>>
						字体设计
					</option>
					<option value="UI设计"<%if(Wclass.equals("2")) {%>selected<%}%>>
						UI设计
					</option>
					<option value="海报设计"<%if(Wclass.equals("3")) {%>selected<%}%>>
						海报设计
					</option>
					<option value="平面设计"<%if(Wclass.equals("4")) {%>selected<%}%>>
						平面设计
					</option>
					<option value="插画设计"<%if(Wclass.equals("5")) {%>selected<%}%>>
						插画设计
					</option>
					<option value="摄影"<%if(Wclass.equals("6")) {%>selected<%}%>>
						摄影
					</option>
					<option value="VI设计"<%if(Wclass.equals("7")) {%>selected<%}%>>
						VI设计
					</option>
				</select>
			</div>
		</div>
		<div class="user-home-contain content1">
			<div class="user-home-list">
				<span class="time">
					<%if(sourceStrArray[0]!=""){%>
	                <b><%=sourceStrArray[0]%></b>
	                <em><%=sourceStrArray[1]%>月<%=sourceStrArray[2]%>日</em><%}%>
	                
<%-- 	                <%if(sourceStrArray[0]==""){%>
	               	还没有上传任何作品，快去上传吧！<%}%> --%>
	            </span>
				<div class="user-course-list">
				 	<ul>
						<%
							while (iter.hasNext()) {
							Work work = (Work) iter.next();
						%>
				 		<li class="course-one clear">
				 			<div class="course-list-img">
				 				<a href="show.onework?id=<%=work.getId()%>">
				 					<img src="<%=basePath %>/work/pic/<%=user.getEmail() %>/<%=work.getPath() %>" width="200" height="110">
				 				</a>
				 			</div>
				 			<div class="course-list-cont">
				 				<h3>
					 				<%=work.getTitle()%>
					 				<span class="user-more">
					 					<img src="images/user-more.png">
					 				</span>
					 				<div class="div-more animated">
					 					<div value="<%=work.getId()%>">
					 						删除
					 					</div>
					 					<div value="<%=work.getId()%>">
											分享
					 					</div>
					 				</div>
				 				</h3>
				 				<div class="list-cont">
				 					<span><%=work.getWclass() %></span>
				 				</div>
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
		<div class="user-home-contain content2" style="display:none">
			<div class="user-home-list">
				<span class="time">
					<%if(sourceStrArray1[0]!=""){%>
	                <b><%=sourceStrArray1[0]%></b>
	                <em><%=sourceStrArray1[1]%>月<%=sourceStrArray1[2]%>日</em><%}%>
	            </span>
				<div class="user-course-list">
				 	<ul>
				 		<%
							while (iter4.hasNext()) {
							Work privatework = (Work) iter4.next();
						%>
				 		<li class="course-one clear">
				 			<div class="course-list-img">
				 				<a href="show.onework?id=<%=privatework.getId()%>">
				 					<img src="<%=basePath %>/work/pic/<%=user.getEmail() %>/<%=privatework.getPath() %>" width="200" height="110">
				 				</a>
				 			</div>
				 			<div class="course-list-cont">
				 				<h3>
					 				<%=privatework.getTitle()%>
					 				<span class="user-more"><img src="images/user-more.png"></span>
				 				</h3>
				 				<div class="list-cont">
									<span><%=privatework.getCategory()%></span>
				 				</div>
				 				<div class="list-cont">
				 					<span>阅读量<em><%=privatework.getRead()%></em></span>
				 					<span>下载量<em><%=privatework.getDownload()%></em></span>
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
<script type="text/javascript" src="js/lib/sweetalert.min.js"></script>
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