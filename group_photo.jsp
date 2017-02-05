<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Group"%>
<%@ page import="dao.FUserDAO"%>
<%@ page import="entity.PageBean"%>
<%@ page import="dao.WorkDAO"%>
<%@ page import="entity.GroupWork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>团队原创</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/page/pagination.css" />
	<link rel="stylesheet" type="text/css" href="css/user_collect.css">
	<link rel="stylesheet" type="text/css" href="css/group_photo.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		Group nowgroup = (Group)session.getAttribute("NowGroup");
		PageBean pages = (PageBean) session.getAttribute("groupPhotos");
   		List list = pages.getList();
		Iterator iter = list.iterator();
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="group_top clear">
		<div class="information fl">
			<h3><%=nowgroup.getName()%></h3>
			<p><%=nowgroup.getLocation()%></p>
			<p><%=nowgroup.getGclass()%></p>
			<p>
				<span><b><%=nowgroup.getSentiment()%></b>人气</span>
				<span><b><%=nowgroup.getWorkamount()%></b>原创</span>
				<span><b><%=nowgroup.getAmount()%></b>成员</span>
				<span><b><%=nowgroup.getFans()%></b>粉丝</span>
			</p>
		</div>
		<div class="slider fr">
			<img src="<%=basePath %>/usergroup/head/<%=nowgroup.getPic() %>">
		</div>
		<br class="clear" />
		<div class="create_user clear">
			<p><span>联系人:</span><%=nowgroup.getLinkman()%></p>
			<p><span>邮箱:</span><%=nowgroup.getLinkemail()%></p>	
		</div>
	</div>
	<div class="group_contain">
		<div class="group_title">
			<div class="title">
				<a href="photo.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=1" class="select">
					原创
				</a>
				<a href="member.groupDetail?groupID=<%=nowgroup.getId()%>&GMindex=1">
					成员
				</a>
				<a href="fan.groupDetail?groupID=<%=nowgroup.getId()%>&GFindex=1">
					粉丝
				</a>
			</div>
		</div>
		<div class="group_main">
			<div id="masonry" class="container-fluid">
				<%
					while (iter.hasNext()) {
					GroupWork groupwork = (GroupWork) iter.next();
				%>
	  			<div class="box">
		  			<img class="lazy" data-original="<%=basePath %>/usergroup/<%=nowgroup.getId()%>/<%=groupwork.getPic() %>">
		  			<div class="infoBox">
			  			<div class="title">
			  				<%=groupwork.getDescribe()%>
			  			</div>
			  			<div class="activeProporty clear">
			  				<a class="downloadNum">
			  					<span class="downloadNumText">已下载<span style="color:#b51d1a;font-size:13px;margin:0 5px;"><%=groupwork.getDownload()%></span>次</span>
			  				</a>
			  			</div>
		  			</div>
					<a href="show.onework?id=<%=new dao.WorkDAO().queryOneWorkByPicEmail(groupwork.getPic(),groupwork.getFormuser()).getId()%>" class="mask"></a>
		  		</div>
				<%
					}
				%>
			</div>
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
               <td width="40" align="right"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=${GPindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span >
			   <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
			   </span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=${GPindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.groupDetail?groupID=<%=nowgroup.getId()%>&GPindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script src="js/lib/jquery.masonry.min.js"></script>
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
//
var $container = $('#masonry');
    $container.imagesLoaded(function() {
        $container.masonry({
                itemSelector : '.box',
	            gutterWidth : 21,
	            isAnimated: true,
	            columnWidth : 282
            });
     });
//
function scroll(){
	var seeheight = $(window).height();
	var scrollTop = $(document).scrollTop();
	$(".box").each(function(){
		if($(this).offset().top<seeheight+scrollTop){
			var url = $(this).children().data('original');
			$(this).children(".lazy").attr('src',url);
			$(this).addClass('fadeIn');
		}
	})
}
scroll(); 
window.onscroll=function(){
    scroll(); 
}
</script>
<script type="text/javascript" src="js/lib/jquery.pagination.js"></script>
<script src="js/src/public.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").pagination("15");
});
</script>
</body>
</html>