<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.PageBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>我的收藏</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/user.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/user_collect.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<jsp:include page="isLogin.jsp"></jsp:include>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		List works =(List) session.getAttribute("works");
		PageBean pages = (PageBean) session.getAttribute("page");  
   		List list = pages.getList();
		out.print(works.size());
		Iterator iter = works.iterator();
		Iterator iter2 = list.iterator();
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
				<a href="usercollect?index=1" class="active">
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
				我的收藏
			</div>
		</div>
		<div class="user-home-contain">
			<div id="masonry" class="container-fluid">
			<% if(iter2.hasNext()==false)
				{%>未收藏任何作品，快去收藏吧！<%}
			%>
			<%
				while (iter2.hasNext()) {
				Work work = (Work) iter2.next();
			%>
		  		<div class="box">
		  			<img class="lazy" data-original="<%=basePath %>/work/pic/<%=work.getEmail() %>/<%=work.getPath() %>">
		  			<div class="infoBox">
		  			<a href="show.onework?id=<%=work.getId()%>" class="mask"></a>
			  			<div class="title">
			  				<%=work.getTitle()%>
			  			</div>
			  			<div class="activeProporty clear">
			  				<a class="downloadNum">
			  					<span class="downloadNumText">被下载<span style="color:#b51d1a;font-size:13px;margin:0 5px;"><%=work.getDownload()%></span>次</span>
			  				</a>
			  			</div>
		  			</div>
		  		</div>
		  		<%
					}
				%>
			</div>
		</div>
		
		
		
		
		<table class="page_table" border="0" cellspacing="0" cellpadding="0">  
             <tr>  

               <td width="40" align="right"><a href="show.groupDetail?index=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.groupDetail?index=${indexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.groupDetail?index=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span > 
               <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
               </span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.groupDetail?index=${indexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.groupDetail?index=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.groupDetail?index=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
       <!--  <form action="show.groupDetail">
        	输入页码：<input type="text" name = "index">
        	<input type="submit" value ="提交">
        </form> -->
        
        
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script src="js/lib/jquery.masonry.min.js"></script>
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
//
var $container = $('#masonry');
    $container.imagesLoaded(function() {
        $container.masonry({
                itemSelector : '.box',
	            gutterWidth : 15,
	            isAnimated: true,
	            columnWidth : 260
            });
     });
//
function scroll(){
	var seeheight = $(window).height();
	var scrollTop = $(document).scrollTop();
	$(".box").each(function(){
		if($(this).offset().top<seeheight+scrollTop){
			var url = $(this).children().data('original');
			$(this).children().attr('src',url);
			$(this).addClass('fadeIn');
		}
	})
}
scroll(); 
window.onscroll=function(){
    scroll(); 
}
 </script>
</body>
</html>