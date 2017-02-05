<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.PageBean" %>
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
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/page/pagination.css" />
	<link rel="stylesheet" type="text/css" href="css/show_index.css">
	<link rel="stylesheet" type="text/css" href="css/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
/* 		List allworks =(List) session.getAttribute("allworks"); */
		PageBean pages = (PageBean) session.getAttribute("allworks2");
   		List list = pages.getList();
		Iterator iter = list.iterator();
		String wclass = request.getParameter("wclass");
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="show_top">	
	</div>
	<div class="show_contain clear">
		<!-- <div class="show_left clear">
			<ul>
				<li>
					<a href="show_index.html" class="active">
						<span>素材库</span>
						<b class="icon-play3"></b>
					</a>
				</li>
				<li>
					<a href="">
						<span>工具包</span>
						<b class="icon-play3"></b>
					</a>
				</li>
				<li>
					<a href="">
						<span>教&nbsp&nbsp&nbsp程</span>
						<b class="icon-play3"></b>
					</a>
				</li>
			</ul>
		</div> -->
		<div class="show_right">
			<div class="showtitle">
				<ul class="ul_show">
					<li class="li_show">
						类目
						<span>ˇ</span>
						<ul class="showshow">
							<li>
								UI设计
							</li>
							<li>
								字体设计
							</li>
							<li>
								海报设计
							</li>
							<li>
								室内设计
							</li>
						</ul>
					</li>
					<li class="li_show">
						风格
						<span>ˇ</span>
						<ul class="showshow">
							<li>
								简约
							</li>
							<li>
								扁平化
							</li>
							<li>
								线条
							</li>
							<li>
								卡通
							</li>
						</ul>
					</li>
					<li class="li_show">
						排序
						<span>ˇ</span>
						<ul class="showshow">
							<li>
								<a href="showDownload.allwork">最多下载</a><br>
							</li>
							<li>
								最新图片
							</li>
						</ul>
					</li>
				</ul>
				<!-- <div class="search">
					<input type="text" value="" /> 
				</div> -->
			</div>
			<div class="showcontent clear">
						<%
							while (iter.hasNext()) {
							Work work = (Work) iter.next();
						%>
				<div class="item-list">
					<a href="show.onework?id=<%=work.getId()%>">
						<div class="box-list">
							<img src="<%=basePath %>/work/pic/<%=work.getEmail() %>/<%=work.getPath() %>">
						</div>
						<div class="item-name clear">
							<div class="title fl">
								<%=work.getTitle()%>
							</div>
							<div class="activepro fr">
								<p class="backDnum " title="下载数"><%=work.getDownload()%></p>
							</div>
						</div>
					</a>
				</div>
						<%
							}
						%>
			</div>
			<!-- Pagination -->
			<div class="pages">
        		<div id="Pagination"></div>
		        <div class="searchPage">
		            <span class="page-sum">共<strong class="allPage">15</strong>页</span>
		            <span class="page-go">跳转<input type="text">页</span>
		         	<a href="javascript:;" class="page-btn">GO</a>
		        </div>
		    </div>
		</div>
		
			<table class="page_table" border="0" cellspacing="0" cellpadding="0">  
             <tr>
               
               <td width="40" align="right"><a href="show.allwork?search=全部作品&AWindex=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.allwork?search=全部作品&AWindex=${AWindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.allwork?search=全部作品&AWindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span > 
               <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
            	</span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.allwork?search=全部作品&AWindex=${AWindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.allwork?search=全部作品&AWindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.allwork?search=全部作品&AWindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
<!--         <form action="show.allwork?search=全部作品" method="post">
        	<input type="text" name = "AWindex">
        	<input type="submit" value ="提交">
        </form> -->
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="js/lib/headroom.min.js"></script> 
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
<script type="text/javascript" src="js/lib/jquery.pagination.js"></script>
<script src="js/src/public.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").pagination("15");
});
</script>
 <script type="text/javascript"  src="js/src/show_index.js"></script>
</body>
</html>