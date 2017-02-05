<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
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
</head>
<body>
<header>
	<nav class="header">
		<div class="container">
			<a href="index.html">
				<img src="images/logo.png" alt="" class="logo">
			</a>
			<div class="header-left">
				<ul>
					<li class="li-active">
						<a href="">首页</a>
					</li>
					<li>
						<a href="">资源</a>
					</li>
					<li>
						<a href="">社区</a>
					</li>
				</ul>
			</div>
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
					<img src="images/header3.png">
				</li>
				<li>
					<img src="images/header1.png">
				</li>
				<li>
					<img src="images/header2.png">
				</li>
				<li class="user-img">
					<img src="face/10.jpg">
				</li>
			</ul>
		</div>
		</div>
	</nav>
</header>
<div class="contain">
	<div class="teach_top">	
		<div class="searchBox">
			<div class="topTip">
				<h3>共 <font>15,599</font> 组大神教程，加薪必备</h3>
			</div>
			<div class="search-m">
				<div class="search_div">
					<input type="text" class="fl input_search" value="情人节" placeholder="搜索你要找的" data-type="2"><a href="javascript:;" class="fl sub_search sea-but">搜索</a>
					<div class="clear"></div>
				</div>
			</div>
			<div class="keyword-tags">
				<a href="#" data-pinyin="shejijiaocheng" target="_blank" class="searchItem">设计教程</a><a href="#" data-pinyin="16" target="_blank" class="searchItem">海报</a><a href="#" data-pinyin="zititexiao" target="_blank" class="searchItem">字体特效</a><a href="#" data-pinyin="ziti" target="_blank" class="searchItem">字体</a><a href="#" data-pinyin="banner" target="_blank" class="searchItem">banner</a><a href="#" data-pinyin="zhutu" target="_blank" class="searchItem">主图</a><a href="#" data-pinyin="diaosejiaocheng" target="_blank" class="searchItem">调色教程</a><a href="#" data-pinyin="koutu" target="_blank" class="searchItem">抠图</a><a href="#" data-pinyin="xiangqingye" target="_blank" class="searchItem">详情页</a><a href="#" data-pinyin="tongdaokoutu" target="_blank" class="searchItem">通道抠图</a>
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
							<a href="#" class="current">全部</a>		
							<a rel="nofollow" href="#">设计教程</a>
							<a rel="nofollow" href="#">经验分享</a>
							<a rel="nofollow" href="#">字体特效</a>
							<a rel="nofollow" href="#">调色教程</a>
							<a rel="nofollow" href="#">优秀文章</a>
							<a rel="nofollow" href="#">配色教程</a>
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
							<a href="#" class="current">全部</a>
							<a rel="nofollow" href="#">初级</a>
							<a rel="nofollow" href="#">中级</a>
							<a rel="nofollow" href="#">高级</a>
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
							<a href="#" class="current">全部</a>
							<a rel="nofollow" href="#">原创</a>
							<a rel="nofollow" href="#">最新上传</a>
							<a rel="nofollow" href="#">最多评论</a>
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
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="solid">
					<div class="img">
						<a href="#">
							<img src="upload/2.jpg" width="224" height="143">
						</a>
					</div>
					<div class="designInfo">
						<div class="titleTxt">
							<span class="original">
								原创
							</span>
							<a href="">
								教你画小人
							</a>
						</div>
						<div class="introBox usrInfoBox clear">
							<a href="" class="usrInfo fl">
								<img src="group/1.png" width="35" height="35">
								<span class="homeIcon" style="display:none;"></span>
							</a>
							<div class="introTxt fl">
								<p class="usrName">
									<a href="http://xiaosa.90sheji.com" target="_blank"><span>	哥、依旧潇洒</span></a>
								</p>
								<p class="designTitleInfo">
									<span class="hotNum fl" title="人气">
										<font>1,212</font>
									</span>
									<span class="commentNum fl" title="评论">
										<font>14</font>
									</span>
								</p>
							</div>
						</div>
					</div>
				</div>
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
<script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").pagination("15");
});
</script>
<script type="text/javascript"  src="js/src/show_teach.js"></script>
</body>
</html>