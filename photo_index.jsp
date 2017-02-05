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
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/model.css" />
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/page/pagination.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/user_collect.css"> -->
<link rel="stylesheet" type="text/css" href="css/photo_index.css">
<link rel="stylesheet" type="text/css" href="css/page.css">
<!-- <link rel="stylesheet" type="text/css" href="load/css/default.css" /> -->
<link rel="stylesheet" type="text/css" href="load/css/component.css" />

<style>
</style>
</head>
<body>
	<%
		PageBean pages = (PageBean) session.getAttribute("Indexsearchworks");
	   	List list = pages.getList();
		Iterator iter = list.iterator();
		
		String searchContent = (String) session.getAttribute("searchContent");
		String class1 = (String)session.getAttribute("workclass1");
		String class2 = (String)session.getAttribute("workclass2");
		String class3 = (String)session.getAttribute("workclass3");
		String order = (String)session.getAttribute("workorder");
		List<Work> someworks = (List)session.getAttribute("someworks");
		Iterator iter2 = someworks.iterator();
	%>
	<jsp:include page="templtate/header.jsp"></jsp:include>
	<div class="contain">
		<div class="searchTop">
			<div class="searchMain" style="width:550px;padding:9px 0 9px;">
				<div class="search_div" style="border-radius:4px;height:48px;">
					<form action="commonPhotosearch.allwork?CPindex=1" id="p_form"
						method="post" class="clear">
						<input type="text" name="searchContent"
							style="height:28px;line-height:28px;width:380px;"
							class="fl input_search" placeholder="搜索你要找的" value=""
							data-type="4"> <a href="javascript:;"
							style="height:48px;line-height:48px;" class="fl sub_search">
							搜 索 </a>
						<!-- 				<input type="submit" value="搜索" class="fl sub_search" style="height:48px;line-height:48px;" > -->
						<br />
					</form>
					
				</div>
				<p class="mp">找不到想要的？试试<a href="" id="photo_search">图片搜索</a></p>

				<p style="margin-top:5px;">
					${search} <a
						href="commonPhotosearch.allwork?CPindex=1&searchContent=${search1}"
						data-pinyin="16" target="_blank" class="searchItem">${search1}</a>
					<a
						href="commonPhotosearch.allwork?CPindex=1&searchContent=${search2}"
						data-pinyin="16" target="_blank" class="searchItem">${search2}</a>
					<a
						href="commonPhotosearch.allwork?CPindex=1&searchContent=${search3}"
						data-pinyin="16" target="_blank" class="searchItem">${search3}</a>
					<a
						href="commonPhotosearch.allwork?CPindex=1&searchContent=${search4}"
						data-pinyin="16" target="_blank" class="searchItem">${search4}</a>
				</p>
			</div>
			<div class="subnav clear">
				<div class="filterBox fl clear">
					<div class="fl filterList">
						<div class="filterItemBox">
							<a href=""> 分类： </a>
							<div class="tags clear" id="art_type">
								<a href="resultClass1.allwork?workclass1=全部&W1index=1"
									<%if(class1.equals("全部")) {%> class="current" <%}%>>全部</a> <a
									href="resultClass1.allwork?workclass1=字体设计&W1index=1"
									<%if(class1.equals("字体设计")) {%> class="current" <%}%>>字体设计</a>
								<a href="resultClass1.allwork?workclass1=UI设计&W1index=1"
									<%if(class1.equals("UI设计")) {%> class="current" <%}%>>UI设计</a>
								<a href="resultClass1.allwork?workclass1=海报&W1index=1"
									<%if(class1.equals("海报")) {%> class="current" <%}%>>海报</a> <a
									href="resultClass1.allwork?workclass1=插画设计&W1index=1"
									<%if(class1.equals("插画设计")) {%> class="current" <%}%>>插画设计</a>
								<a href="resultClass1.allwork?workclass1=平面设计&W1index=1"
									<%if(class1.equals("平面设计")) {%> class="current" <%}%>>平面设计</a>
								<a href="resultClass1.allwork?workclass1=摄影&W1index=1"
									<%if(class1.equals("摄影")) {%> class="current" <%}%>>摄影</a> <a
									href="resultClass1.allwork?workclass1=VI设计&W1index=1"
									<%if(class1.equals("VI设计")) {%> class="current" <%}%>>VI设计</a>
								<a href="resultClass1.allwork?workclass1=logo设计&W1index=1"
									<%if(class1.equals("logo设计")) {%> class="current" <%}%>>logo设计</a>
							</div>
						</div>
					</div>
					<div class="fl filterList">
						<div class="filterItemBox">
							<a href=""> 类别： </a>
							<div class="tags clear">
								<a href="resultClass2.allwork?workclass2=全部&W1index=1"
									<%if(class2.equals("全部")) {%> class="current" <%}%>>全部</a><!--  <a
									href="resultClass2.allwork?workclass2=psd&W1index=1"
									<%if(class2.equals("psd")) {%> class="current" <%}%>>psd</a> --> <a
									href="resultClass2.allwork?workclass2=jpg&W1index=1"
									<%if(class2.equals("jpg")) {%> class="current" <%}%>>jpg</a> <a
									href="resultClass2.allwork?workclass2=png&W1index=1"
									<%if(class2.equals("png")) {%> class="current" <%}%>>png</a><!--  <a
									href="resultClass2.allwork?workclass2=AI&W1index=1"
									<%if(class2.equals("AI")) {%> class="current" <%}%>>AI</a> -->

							</div>
						</div>
					</div>
					<div class="fl filterList">
						<div class="filterItemBox">
							<a href=""> 性质： </a>
							<div class="tags clear">
								<a href="resultClass3.allwork?workclass3=全部&W1index=1"
									<%if(class3.equals("全部")) {%> class="current" <%}%>>全部</a> <a
									href="resultClass3.allwork?workclass3=原创&W1index=1"
									<%if(class3.equals("原创")) {%> class="current" <%}%>>原创</a> <a
									href="resultClass3.allwork?workclass3=转载&W1index=1"
									<%if(class3.equals("转载")) {%> class="current" <%}%>>转载</a>
							</div>
						</div>
					</div>
					<div class="fl filterList last">
						<div class="filterItemBox">
							<a href="">排序：</a>
							<div class="tags currentSyleOrder">
								<a href="orderwork.allwork?workorder=默认&W1index=1"
									<%if(order.equals("默认")) {%> class="current" <%}%>>默认</a> <a
									href="orderwork.allwork?workorder=热门下载&W1index=1"
									<%if(order.equals("热门下载")) {%> class="current" <%}%>>热门下载</a>
								<a href="orderwork.allwork?workorder=热门阅读&W1index=1"
									<%if(order.equals("热门阅读")) {%> class="current" <%}%>>热门阅读</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<ul id="wrap" class="container-fluid clear effect-2 wrap">
				<%
					int k = 0;
					while (iter.hasNext()) {
						Work work = (Work) iter.next();
				%>
				<li class="box">
					<div class="info">
						<div class="pic">
							<img
								src="<%=basePath%>/work/pic/<%=work.getEmail()%>/<%=work.getPath()%>">
						</div>
						<div class="infoBox">
							<div class="title">
								<%=work.getTitle()%>
							</div>
							<div class="activeProporty clear">
								<a class="downloadNum"> <span class="downloadNumText">已下载<span
										style="color:#b51d1a;font-size:13px;margin:0 5px;"><%=work.getDownload()%></span>次
								</span>
								</a>
							</div>
						</div>
						<a href="show.onework?id=<%=work.getId()%>" class="mask"></a>
					</div> <%
 	if(work.getCategory().equals("原创")){
 %><div class="icon_yuanchuang"></div>
					<%
						}
					%> <%
 	if(work.getCategory().equals("转载")){
 %><div
						class="icon_zhuanzai"></div>
					<%
						}
					%>
				</li>
				<%
					k++;}
				%>
			</ul>
		</div>
		<div class="guesslike">
			<div class="guess-title">猜你喜欢</div>
			
			<div class="list-ul">
				<ul>
				<%
				int i=0;
				while (iter2.hasNext()&&i<4) {
				Work onework = (Work) iter2.next();
			%>
					<li>
						<div class="box">
							<img class="lazy"
								src="<%=basePath%>/work/pic/<%=onework.getEmail()%>/<%=onework.getPath()%>">
							<div class="infoBox">
								<div class="title">
									<%=onework.getTitle()%>
								</div>
								<div class="activeProporty clear">
									<a class="downloadNum"> <span class="downloadNumText">已下载<span
											style="color:#b51d1a;font-size:13px;margin:0 5px;"><%=onework.getDownload()%></span>次
									</span>
									</a>
								</div>
							</div>
							<a href="#" class="mask"></a>
						</div>
					</li>
					<%
				i++;}
			%>
				</ul>
			</div>
			
		</div>
	</div>
<div class="model">
    <div class="model_content">
		<div class="prvid_form">
			<form action="PicSearchServlet?CPindex=1" method="post" enctype="multipart/form-data">

				<input type="file" name="searchPic" id="filep"><br> 
				<input type="button" class="btn" value="上传文件">
				<input type="submit" value="查找" class="btn">
			</form>
		</div>
		<div id="prvid">预览</div>
    </div>
    <div class="model_close">
      ×
    </div>
</div>
	<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
	<!-- <script src="js/lib/jquery.masonry.min.js"></script> -->
	<script type="text/javascript" src="js/lib/headroom.min.js"></script>
	<script>
		var elem = document.querySelector("header");
		var headroom = new Headroom(elem, {
			"tolerance" : 12,
			"offset" : 30,
			"classes" : {
				"initial" : "headroom",
				"pinned" : "headroom--pinned",
				"unpinned" : "headroom--unpinned"
			}
		});
		headroom.init();
	</script>
	<script src="js/src/model.js"></script>
	<!-- <script src="js/src/user.js"></script> -->
	<script src="js/src/public.js"></script>
	<script src="js/src/photo_index.js"></script>
	<script src="load/js/modernizr.custom.js"></script>
	<script src="load/js/masonry.pkgd.min.js"></script>
	<script src="load/js/imagesloaded.js"></script>
	<script src="load/js/classie.js"></script>
	<script src="load/js/AnimOnScroll.js"></script>
	<script>
            new AnimOnScroll(document.getElementById('wrap'), {
                minDuration: 0.4,
                maxDuration: 0.7,
                viewportFactor: 0.2
            });
        </script>
</body>
</html>