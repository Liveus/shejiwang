<%@ page import="dao.FUserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.Teach"%>
<%@ page import="entity.PageBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>教程</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/font.css">
	<link rel="stylesheet" type="text/css" href="css/page/pagination.css" />
	<link rel="stylesheet" type="text/css" href="css/show_teach.css">
	<link rel="stylesheet" type="text/css" href="css/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="css/page.css">
</head>
<body>
<%
	Fuser user =(Fuser) session.getAttribute("user");
	PageBean pages = (PageBean) session.getAttribute("alleaches");  
   	List list = pages.getList();
	Iterator iter = list.iterator();
	String class1 = (String) session.getAttribute("teachClass1");
	String class2 = (String) session.getAttribute("teachClass2");
	String class3 = (String) session.getAttribute("teachClass3");
	String order = (String) session.getAttribute("order");
%>
<jsp:include page="templtate/header.jsp"></jsp:include>
<div class="contain">
	<div class="teach_top">	
		<div class="searchBox">
			<div class="topTip">
				<h3>共 <font>24</font> 组大神教程，加薪必备</h3>
			</div>
			<div class="search-m">
				<div class="search_div">
					<form action="search.allteach?ATindex=1" id="t_form" method="post" >
						<input type="text" class="fl input_search" value=""
						placeholder="搜索你要找的"
						data-type="2" name = "search">
						<input type="submit" value="搜索" class="fl sub_search sea-but"/>
						<div class="clear"></div>
					</form>
					
				</div>
			</div>
			<div class="keyword-tags">
				<a href="search.allteach?ATindex=1&search=海报" data-pinyin="16" target="_blank" class="searchItem">海报</a>
				<a href="search.allteach?ATindex=1&search=调色教程" data-pinyin="diaosejiaocheng" target="_blank" class="searchItem">调色教程</a>
				<a href="search.allteach?ATindex=1&search=字体特效" data-pinyin="zititexiao" target="_blank" class="searchItem">字体特效</a>
				<a href="search.allteach?ATindex=1&search=字体" data-pinyin="ziti" target="_blank" class="searchItem">字体</a>
				<a href="search.allteach?ATindex=1&search=绘图" data-pinyin="banner" target="_blank" class="searchItem">绘图</a>
				<a href="search.allteach?ATindex=1&search=主图" data-pinyin="zhutu" target="_blank" class="searchItem">主图</a>
				
				<a href="search.allteach?ATindex=1&search=抠图" data-pinyin="koutu" target="_blank" class="searchItem">抠图</a>
				<a href="search.allteach?ATindex=1&search=详情页" data-pinyin="xiangqingye" target="_blank" class="searchItem">详情页</a>
				<a href="search.allteach?ATindex=1&search=通道抠图" data-pinyin="tongdaokoutu" target="_blank" class="searchItem">通道抠图</a>
				<br>
				${search}
				<a href="search.allteach?ATindex=1&search=${Search1}" data-pinyin="16" target="_blank" class="searchItem">${Search1}</a>
				<a href="search.allteach?ATindex=1&search=${Search2}" data-pinyin="16" target="_blank" class="searchItem">${Search2}</a>
				<a href="search.allteach?ATindex=1&search=${Search2}" data-pinyin="16" target="_blank" class="searchItem">${Search2}</a>
				<a href="search.allteach?ATindex=1&search=${Search2}" data-pinyin="16" target="_blank" class="searchItem">${Search2}</a>
			</div>
		</div>
	</div>
	<div class="subnavBox clear">
		<div class="subnav clear">
			<div class="subnav-m fl clear">
				<div class="fl sublist cateSub">
					<a href="" class="navAron">
						分类
						<span>ˇ</span>
					</a>
					<div class="sub-m" style="left: -58.5px;">
						<div class="tags clearfix">
							<a <% if(class1.equals("全部")){%>class="current"<%}%> <% if(class1.equals("全部")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=全部&ATindex=1" >全部</a>
							<a <% if(class1.equals("设计教程")){%>class="current"<%}%> <% if(class1.equals("设计教程")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=设计教程&ATindex=1">设计教程</a>
							<a <% if(class1.equals("经验分享")){%>class="current"<%}%> <% if(class1.equals("经验分享")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=经验分享&ATindex=1">经验分享</a>
							<a <% if(class1.equals("字体特效")){%>class="current"<%}%> <% if(class1.equals("字体特效")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=字体特效&ATindex=1">字体特效</a>
							<a <% if(class1.equals("调色教程")){%>class="current"<%}%> <% if(class1.equals("调色教程")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=调色教程&ATindex=1">调色教程</a>
							<a <% if(class1.equals("优秀文章")){%>class="current"<%}%> <% if(class1.equals("优秀文章")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=优秀文章&ATindex=1">优秀文章</a>
							<a <% if(class1.equals("配色教程")){%>class="current"<%}%> <% if(class1.equals("配色教程")==false){%>rel="nofollow"<%}%> href="class1teach.allteach?teachClass1=配色教程&ATindex=1">配色教程</a>
							<i class="triangle"></i>
						</div>
					</div>
				</div>
				<div class="fl sublist leaveSub">
					<a href="" class="navAron">
						等级
						<span>ˇ</span>
					</a>
					<div class="sub-m" style="left: -58.5px;">
						<div class="tags clearfix">
							<a <% if(class2.equals("全部")){%>class="current"<%}%> <% if(class2.equals("全部")==false){%>rel="nofollow"<%}%> href="class2teach.allteach?teachClass2=全部&ATindex=1">全部</a>
							<a <% if(class2.equals("初级")){%>class="current"<%}%> <% if(class2.equals("初级")==false){%>rel="nofollow"<%}%> href="class2teach.allteach?teachClass2=初级&ATindex=1">初级</a>
							<a <% if(class2.equals("中级")){%>class="current"<%}%> <% if(class2.equals("中级")==false){%>rel="nofollow"<%}%> href="class2teach.allteach?teachClass2=中级&ATindex=1">中级</a>
							<a <% if(class2.equals("高级")){%>class="current"<%}%> <% if(class2.equals("高级")==false){%>rel="nofollow"<%}%> href="class2teach.allteach?teachClass2=高级&ATindex=1">高级</a>
							<i class="triangle"></i>
						</div>
					</div>
				</div>
				<div class="fl sublist orderSub">
					<a href="" class="navAron">
						性质
						<span>ˇ</span>
					</a>
					<div class="sub-m" style="left: -2px;">
						<div class="tags clearfix">
							<a <% if(class3.equals("全部")){%>class="current"<%}%> <% if(class3.equals("全部")==false){%>rel="nofollow"<%}%> href="class3teach.allteach?teachClass3=全部&ATindex=1">全部</a>
							<a <% if(class3.equals("原创")){%>class="current"<%}%> <% if(class3.equals("原创")==false){%>rel="nofollow"<%}%> href="class3teach.allteach?teachClass3=原创&ATindex=1">原创</a>
							<a <% if(class3.equals("转载")){%>class="current"<%}%> <% if(class3.equals("转载")==false){%>rel="nofollow"<%}%> href="class3teach.allteach?teachClass3=转载&ATindex=1">转载</a>
							<i class="triangle"></i>
						</div>
					</div>
				</div>
				
				<div class="fl sublist orderSub">
					<a href="" class="navAron">
						排序
						<span>ˇ</span>
					</a>
					<div class="sub-m" style="left: -2px;">
						<div class="tags clearfix">
							<a <% if(order.equals("全部")){%>class="current"<%}%> <% if(order.equals("全部")==false){%>rel="nofollow"<%}%> href="order.allteach?order=全部&ATindex=1">全部</a>
							<a <% if(order.equals("最新上传")){%>class="current"<%}%> <% if(order.equals("最新上传")==false){%>rel="nofollow"<%}%> href="order.allteach?order=最新上传&ATindex=1">最新上传</a>
							<a <% if(order.equals("最多评论")){%>class="current"<%}%> <% if(order.equals("最多评论")==false){%>rel="nofollow"<%}%> href="order.allteach?order=最多评论&ATindex=1">最多评论</a>
							<i class="triangle"></i>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div class="show_contain clear">
		<div class="show">
			<div class="showcontent clear designCntBox">
					<%
						while (iter.hasNext()) {
						Teach teach = (Teach) iter.next();
					%>
				<div class="solid">
					<div class="img">
						<a href="show.oneTeach?teachId=<%=teach.getId() %>&OTindex=1">
							<img src="<%=basePath %>/TeachWork/pic/<%=teach.getEmail() %>/<%=teach.getPic() %>" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								<%=teach.getXinzhi() %>
							</span>
							<a href="">
								<%=teach.getTitle() %>
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="<%=basePath %>/user/head/<%=new FUserDAO().findByEmail(teach.getEmail()).getHead() %>" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span><%=new FUserDAO().findByEmail(teach.getEmail()).getName() %></span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font><%=teach.getView() %></font>
									</span>
									<span class="commentNum fl" title="评论">
										<font><%=teach.getAttitude() %></font>
									</span>
								</p>
							</div>
						</div>
					</div>
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
               <td width="40" align="right"><a href="show.allteach?ATindex=1" ><span >首页</span></a></td>
               <% if(pages.getCurrentPage()>1){ %>  
               <td width="40" align="right"><a href="show.allteach?ATindex=${ATindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
               <% }%>
               <% if(pages.getCurrentPage()==1){ %>  
               <td width="40" align="right"><a href="show.allteach?ATindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
               <% }%>
               <td width="40" align="center" class="page_center"><span >
               <% if(pages.getPageTotal()==0){%>0/0<%}%>
               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
               </span></td>
               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.allteach?ATindex=${ATindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
               <%} %>
               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
               <td width="40" align="left"><a href="show.allteach?ATindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
               <%} %>
               <td width="40" align="left"><a href="show.allteach?ATindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
             </tr>
        </table>
        <!-- <form action="show.allteach" method="post">
        	<input type="text" name = "ATindex">
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
<script type="text/javascript" src="js/lib/jquery.pagination.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").pagination("15");
});
</script>
<script type="text/javascript"  src="js/src/show_teach.js"></script>
</body>
</html>