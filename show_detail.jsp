<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.PageBean"%>
<%@ page import="entity.TeachView"%>
<%@ page import="dao.FUserDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>资源展示</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/show_detail.css">
	<link rel="stylesheet" type="text/css" href="css/user_collect.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		Fuser workmaker =(Fuser) session.getAttribute("workmaker");
		List someworks = (List)session.getAttribute("someworks");
		Work work =(Work)session.getAttribute("work");
		String exist=request.getParameter("exist");
		String width=request.getParameter("width");
		String height=request.getParameter("height");
		String daxiao=request.getParameter("daxiao");
		Iterator iter = someworks.iterator();
		String items = request.getParameter("items");
		PageBean pages = (PageBean) session.getAttribute("allviews");
		List list = pages.getList();
		Iterator iter2 = list.iterator();
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain clear">
	<div class="Snav"><a href="">首页</a> &gt;<a href=""><%=work.getWclass()%></a> &gt;<%=work.getTitle() %></div>
	<div class="left fl">
	 	<div class="imageBox">
	 		<div class="bigImg">
	 			<img src="<%=basePath %>/work/pic/<%=work.getEmail() %>/<%=work.getPath() %>">
	 		</div>
	 	</div>
	 	<div class="imageInfo">
	 		<h1 class="bt"><%=work.getTitle() %></h1>
	 		<p class="bt info"><%=work.getIntroduce() %></p>
	 	</div>
	</div>
	<div class="right fr">
	 	<div class="right_content clear">
	 		<div class="user_left fl">
	 			<dl class="cl">
	 				<dd>
	 					<a href="">
	 						<img src="<%=basePath %>/user/head/<%=workmaker.getHead() %>" alt="" width="42">
	 					</a>
	 				</dd>
	 				<dt>
	 					<a class="usrInfoHead usrInfo dsHomeLink" href="" target="_blank" title="筱武"><b style=" color:#ff8b3d"><%=workmaker.getName() %></b></a>
	 				</dt>
	 			</dl>
	 		</div>
	 		<%if(user.getEmail().equals(workmaker.getEmail())==false){%>
	 		<span class="useflw_n">
	 		<%if(exist.equals("false"))
	 			{%><a href="adduserfoot">+ 关注</a><%}
	 		else
	 			{%>已关注 <%}
	 		%>
	         </span>
	 		<%}%>
<%-- 	 		<span class="useflw_n">
	 		
	 		<%if(exist.equals("false"))
	 			{%><a href="adduserfoot">+ 关注</a><%}
	 		else
	 			{%>已关注 <%}
	 		%>
	         </span> --%>
	 	</div>
	 	<a class="upload-one_n" href="loadfile?path=<%=basePath %>/work/pic/<%=work.getPath() %>" target="_blank">
	 		<em></em>
	 		<%if(work.getIntegrate()==0) {%>
	 		免费下载
	 		<%}%>
	 		<%if(work.getIntegrate()!=0) {%>
	 		${work.integrate}积分下载
	 		<%}%>
	 	</a>
	 	<a href="javascript:;"  class="likeBut upload-two_n" >
			<em></em>
	 		收藏
	 	</a>
	 	<div class="activeProporty clear" style="padding:0 25px;margin-top:10px;">
		 	<a class="likeNum"><p></p><span class="likeNumText"><%=work.getRead()%></span></a>
		 	<a class="downloadNum"><p></p><span class="downloadNumText"><%=work.getDownload()%></span></a>
		 	<a class="format"><p></p><span class="formatText"><%=work.getPath().substring(work.getPath().lastIndexOf(".")+1)%></span></a>
	 	</div>
	 	<ul class="show_imginfo_ul">
			<li><span>分类：</span><span><%=work.getCategory() %></span></li>
			<li><span>行业：</span><span><%=work.getWclass() %></span></li>
			<li><span>格式：</span><span><%=work.getPath().substring(work.getPath().lastIndexOf(".")+1)%></span></li>
			<li><span>体积：</span><span><%=daxiao %>Kb</span></li>
			<li><span>尺寸：</span><span><%=width %>*<%=height %></span></li>
			<li><span>上传时间：</span><span><%=work.getTime() %></span></li>
		</ul>
	</div>
	<br class="clear"> 
	<div style="width: 1200px;height: 50px;line-height: 50px; margin: 0 auto; color: #a0a0a0;">推荐给你的素材</div>
	<div class="imgListBoxWraper">
		<div id="masonry" class="container-fluid clear">
	  				<%	
	  					int i=0;
						while (iter.hasNext()&&i<4) {
						Work onework = (Work) iter.next();
					%>
	  		<div class="box">
	  			<img class="lazy" data-original="<%=basePath %>/work/pic/<%=onework.getEmail() %>/<%=onework.getPath() %>">
	  			<div class="infoBox">
		  			<div class="title">
		  				<%=onework.getTitle() %>
		  			</div>
		  			<div class="activeProporty clear">
		  				<a class="downloadNum">
		  					<span class="downloadNumText">已下载<span style="color:#b51d1a;font-size:13px;margin:0 5px;"><%=onework.getDownload() %></span>次</span>
		  				</a>
		  			</div>
	  			</div>
	  			<a class="mask ajaxShow" href="show.onework?id=<%=onework.getId()%>" title="七夕情人节梦幻海报"  target="_blank" ></a>
	  		</div>
	  		<%
	  			i++;
	  			}
	  		 %>
		</div>
	</div>
	<div class="comment">
		<div class="comment_input">
			<form action="add2.teachView">
				<div class="commenBox_l" style="float: none; width:100%">
					<div class="pl_tit block">
						认真评论的都成大神了
					</div>
					<div class="comentBox">
						<textarea name="comment" id="comment" autocomplete="off"></textarea>
					</div>
				</div>
				<div class="commentBox">
					<input type="submit" class="disable" value="提交评论">
				</div>
			</form>
		</div>
		<div class="comment_list">
			<h4>全部评论：<b id="c_num"><%=items%></b> 条 </h4>
			<div id="comment_lists">
					<%
						while (iter2.hasNext()) {
						TeachView teachview = (TeachView) iter2.next();
					%>
				<div class="comment_list_a" >
					<div class="cmAvatar fl">
						<a class="dsHomeAvator" href="" target="_blank">
							<img src="<%=basePath %>/user/head/<%=new FUserDAO().findByEmail(teachview.getEmail()).getHead()%>" class="lazy" data-original="" width="45" alt="" style="display: inline;">
							<span class="dsHomeIcon png-fix"></span>
						</a>
					</div>
					<div class="cmInfo fl">
						<div class="cnHeader">
							<div class="cmName fl">
								<a data-id="373114" class="usrInfoCommet usrInfo dsHomeLink" href="" target="_blank">
								<%=new FUserDAO().findByEmail(teachview.getEmail()).getName() %>
								</a>
							</div>
							<div class="cmTime fl">
								<!-- 11天前 -->
							</div>
							<div class="cmOption fl">
								<a href="javascript:;" class="replyBtn addReply" reply="1415363">回复</a>
							</div>
							<div class="cmFloor fr">
								<%=teachview.getFloor() %>F
								
							</div>
						</div>
					<div class="cmContent"><%=teachview.getContent() %></div>
					</div>
					<div class="clear">
					</div>
				</div>
					<%
						}
					 %>
			</div>
		</div>
	</div>
	<table class="page_table" border="0" cellspacing="0" cellpadding="0">  
             <tr>  
               <td width="40" align="right"><a href="show.onework?id=<%=work.getId() %>&OWindex=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.onework?id=<%=work.getId() %>&OWindex=${OWindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.onework?id=<%=work.getId() %>&OWindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span > 
               <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
             	</span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.onework?id=<%=work.getId() %>&OWindex=${OWindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.onework?id=<%=work.getId() %>&OWindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.oneTeach?id=<%=work.getId() %>&OWindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
	<div id="Link">
		<div class="navShip">
			<h3>
				<a href="#" class="links_ship_title">
					你可能感兴趣的素材
				</a>
			</h3>
		</div>

		<div class="hoverBox searchlink">
			<ul class="links_content">
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">狮子海报</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">平面设计</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">旅行</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">大象的爱情</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">手绘米老鼠</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">招新艺术</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">海的魅力</a></li>
				<li><a href="commonPhotosearch.allwork?searchContent=爱情海报" title="爱情海报" target="_blank">爱情海报</a></li>
			</ul>
		</div>
		
		
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="js/lib/headroom.min.js"></script> 
<script src="js/lib/jquery.masonry.min.js"></script>
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