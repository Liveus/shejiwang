<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Teach"%>
<%@ page import="dao.FUserDAO"%>
<%@ page import="entity.PageBean"%>
<%@ page import="entity.TeachView"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>作品详情</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/teach_detail.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		Teach teach =(Teach)session.getAttribute("teach");
		List someteaches = (List)session.getAttribute("someteaches");
		String items = request.getParameter("items");
		String zanORcai = request.getParameter("zanORcai");
		PageBean pages = (PageBean) session.getAttribute("allviews");
  	 	List list = pages.getList();
		Iterator iter2 = list.iterator();
		Iterator iter = someteaches.iterator();
		Date date = new Date();
	    String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(date);
	    java.sql.Date sqldate=java.sql.Date.valueOf(dateStr);
	%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="teach_top">
		<div class="postion">
			<a href="">
				设集网
			</a>
			 &gt;
			<a href="">
				<%=teach.getTclass() %>
			</a>
			&gt; <%=teach.getTitle() %>
		</div>
		<div class="tit">
			<h1><%=teach.getTitle() %></h1>
			<div class="user_info">
				<dl>
					<dd>
						<a href="" class="dsHomeAvator">
							<img src="<%=basePath %>/user/head/<%=new FUserDAO().findByEmail(teach.getEmail()).getHead()%>" width="42">
						</a>
					</dd>
					<dt>
						设计师：
						<a href=""></a>
						<a href="usrInfoHead usrInfo dsHomeLink">
							<b><%=new  FUserDAO().findByEmail(teach.getEmail()).getName() %></b>
						</a>
					</dt>
					<dt><%=teach.getTime() %>上传</dt>
				</dl>
			</div>
			<div class="user_rq">
				人气
				<b>
					471
				</b>
			</div>
		</div>
	</div>
	<div class="wrapepr show_con">		
		<div class="shop_c">
			<div class="shop_cc">
				<p>
				<!-- 教程说明 -->
				<%=teach.getDescribe() %>
				</p>
			</div>
			<div class="bigImg">
			
<!-- 			<%if(teach.getPic().equals("&")==false) {%>
	<img src="<%=basePath %>/TeachWork/pic/<%=teach.getEmail() %>/<%=teach.getPic() %>" alt="">
	<%}%> -->	
			</div>
		</div>
		<div class="socialBox praiseBox">
			<div class="Praise">
<%-- 				<%if(zanORcai.equals("false")){%> --%>
				<div class="zan_input">赞</div>
<%-- 				<%}%>
				<%if(zanORcai.equals("true")){%>
				已赞
				<%}%> --%>
				<div class="Praise_text">已有 <b class="juhong" id="z_num"><%=teach.getZan() %></b> 人赞过</div>
			</div>
			<div class="Tread">
<%-- 				<%if(zanORcai.equals("false")){%> --%>
				<div class="cai_input">踩</div>
<%-- 				<%}%>
				<%if(zanORcai.equals("true")){%>
				已踩
				<%}%> --%>
				<div class="Tread_text">已有 <b class="juhong" id="tread_num"><%=teach.getCai() %></b> 人踩过</div>
			</div>
			<div class="Praise">
				<div class="xiazai">
					<a href="loadteach?path=<%=basePath %>/work/pic/<%=teach.getPic() %>">下载教程</a>
				</div>
			</div>
			<div class="clear">
			</div>
		</div>	
		<div class="newsDesign">
			<div class="pl_tit block">75%的童鞋学习了这些</div>
			<div class="designListBox">
				<div class="designList fl">
					<ul>
					<%	
	  					int i=0;
						while (iter.hasNext()&&i<4) {
						Teach oneteach = (Teach) iter.next();
					%>
						<li class="fl"><a href="#" title="" target="_blank" class="designLink"><img class="lazy" src="<%=basePath %>/TeachWork/pic/<%=oneteach.getEmail() %>/<%=oneteach.getPic() %>" data-original="" width="141" height="90" alt="" style="display:inline"></a></li>
					<%
						}
					 %>	
						<a href="" class="fl getMore" target="_blank">查看全部</a>
					</ul>
				</div>
			</div>
		</div>
		<div class="comment">
			<div class="comment_input">
				<form action="add.teachView">
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
									11天前
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
               <td width="40" align="right"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=${OTindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span > 
               <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
             	</span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=${OTindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
    <!--     <form action="show.oneTeach?teachId=<%=teach.getId() %>" method="post">
        	<input type="text" name = "OTindex">
        	<input type="submit" value ="提交">
        </form> -->
	</div>
</div>
<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="js/lib/headroom.min.js"></script>
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
<script src="js/src/teach_detail.js"></script>
</body>
</html>