<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Work"%>
<%@ page import="entity.Fuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String url = request.getQueryString();
%>

<head>
<meta charset="utf-8">
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"> -->
	<link rel="stylesheet" type="text/css"  href="css/flickerplate.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/user-login.css">
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	
<style>

</style>
</head>
<body>
<%
	Fuser user =(Fuser) session.getAttribute("user");
	try {
		if(user.getEmail()==null){
			session.setAttribute("login","0");
		}else{
			session.setAttribute("login","1");
		}
	} catch (Exception e) {
		session.setAttribute("login","0");
		}
	String login = (String)session.getAttribute("login");
%>
<div class="user-login-register">
	<div class="rl-bg">
	</div>
	<div class="login">
		<div class="login-title">
			注册
		</div>
		<div class="form-inner">
			<form  class="rl-form clear" method="post">
				<div class="login-first">
					<p class="rl-value">
						<input type="email" placeholder="邮箱" name="email" id="name">
					</p>
					<p class="rl-value">
						<input type="password" placeholder="密码" name="pwd" id="pwd">
					</p>
					<p class="rl-value">
						<input type="password" placeholder="确认密码" name="pwd2" id="pwd2">
					</p>
					<p></p>
					<p class="rl-test">
						<input type="text" placeholder="验证码" name="number" id="number">
							<img id ="img1" src ="checkcode"
									onclick="this.src='checkcode?'+Math.random()"/>
					</p>
					<p class="rl-agree">
						<input type="checkbox" checked name="check" value="1" id="checked">
						同意并愿意遵守
						<span>用户协议</span>
					</p>
					<p class="rl_submit">
						<input type="button"  value="立即注册" id="login-next"> 
					</p>
				</div>
			
				<div class="login-next">
					<p>选择你感兴趣的内容，形成自己的个人主页</p>
					<ul class="login-personal clear">
						<li class="select-img">
							<img src="images/hoby1.png">
							<img src="images/select.png" value="字体设计" name="ztsj">
							<div class="type_ll">
								字体设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby2.png">
							<img src="images/select.png" value=" UI设计">
							<div class="type_ll">
								UI设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby3.png">
							<img src="images/select.png" value="海报设计">
							<div class="type_ll">
								海报设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby4.png">
							<img src="images/select.png" value="平面设计">
							<div class="type_ll">
								平面设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby5.png">
							<img src="images/select.png" value="插画设计">
							<div class="type_ll">
								插画设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby6.png">
							<img src="images/select.png" value="摄影">
							<div class="type_ll">
								摄影
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby7.png">
							<img src="images/select.png" value="VI设计">
							<div class="type_ll">
								VI设计
							</div>
						</li>
						<li class="select-img">
							<img src="images/hoby8.png">
							<img src="images/select.png" value="logo设计">
							<div class="type_ll">
								logo设计
							</div>
						</li>
					</ul>
					<div class="login-next-bottom clear" >
						<input type="button" value="上一步" id="login-pre">
						<input type="submit" value="注册完成" id="login-achieve">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="register">
		<div class="register-title">
			登录
		</div>
		<form action="login.go" class="rl-form r-form" method="post">
			<p class="rl-value">
				<input type="email" placeholder="邮箱" name="email">
			</p>
			<p class="rl-value">
				<input type="password" placeholder="密码" name="pwd">
			</p>
			<p></p>
			<p class="rl-test">
				<input type="text" placeholder="验证码" name="number">
					<img id ="img1" src ="checkcode"
									onclick="this.src='checkcode?'+Math.random()"/>
			</p>
			
			<p class="r_submit">
				<span>
					忘记密码
				</span>
				<input type="submit"  value="立即登录">
			</p>	
		</form>		
	</div>
</div>
<nav class="header">
	<div class="container">
		<img src="images/logo.png" alt="">
		<div class="header-left">
				<ul>
				<li class="li-active li">
					<a href="index.jsp">首页</a>
				</li>
				<li class="li">
					<a href="commonPhotosearch.allwork?CPindex=1&searchContent=">作品</a>
				</li>
				<li class="li">
					<a href="show.allwork?search=全部作品&AWindex=1">素材</a>
				</li>
				<li class="li">
					<a href="show.allteach?ATindex=1">教程</a>
				</li>
				<li class="li">
					<a href="index.question?QAindex=1">悬赏</a>
				</li>
				
				</ul>
		</div>
	<%if(login.equals("0")){%>
	<div class="header-right">
		<ul class="index-login">
			<li class="login-active" id="reg">
				注册
			</li>
			<li id="log" >
				登录
			</li>
		</ul>
	</div>
	<%}%>
	<%if(login.equals("1")){%>
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

				<li class="user-img">
				<a href="list.work">
					<img src="<%=basePath %>/user/head/<%=user.getHead() %>">
				</a>
					<div class="header-ul">
						<div class="card-inner">
							<div class="card-top">
								<a href="list.work"><%=user.getName() %></a>
								<p class="">
									<a href="">经验<%=user.getExperience() %></a>
									<a href="">积分<%=user.getIntegral() %></a>
								</p>
							</div>
							<div class="card-set">
								<a href="user_setting.jsp" target="_blank" class="fl">个人设置</a>
								<a href="exit.go" class="fr">退出</a>
							</div>
						</div>
						<i class="card-arr"></i>
					</div>
				</li>
			</ul>
		</div>
	<%}%>
	</div>
</nav>
<section class="banner">
	<div class="flicker-example" data-block-text="false">
	  <ul>
	    <li data-background="images/index.jpg"></li>
	    <li data-background="images/index2.jpg"></li>
	  </ul>
	</div>
	<div class="search">
		<div class="search-input">
		<form action="commonPhotosearch.allwork?CPindex=1" id="index_f" method="post">
			<input type="text" value="" placeholder="搜索你想要的" name="searchContent">
			<input type="submit" style="display:none"> 
			<div class="search-icon">
				<img src="images/search.png">
				<img src="images/search.png">
				<img src="images/search.png">
				<img src="images/search.png">
			</div>
		</form>
			
		</div>
	</div>
</section>
<section class="type">
	<div class="hr">
		<hr/>
		<div class="looked">
			大家正在关注
		</div>
	</div>
	<ul class="type-list">
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=海报设计&CPindex=1">海报设计</a></h2>
            </figcaption>
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=UI设计&CPindex=1">UI设计</a></h2>
            </figcaption>		
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=字体设计&CPindex=1">字体设计</a></h2>
            </figcaption>
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=室内设计&CPindex=1">平面设计</a></h2>
            </figcaption>			
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=海报设计&CPindex=1">插画设计</a></h2>
            </figcaption>
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=UI设计&CPindex=1">摄影</a></h2>
            </figcaption>		
		</li>
		<li>
			<figcaption>
                <h2><a href="commonPhotosearch.allwork?searchContent=字体设计&CPindex=1">VI设计</a></h2>
            </figcaption>
		</li>
		
	</ul>
</section>
<section class="type">
	<div class="hr">
		<hr/>
		<div class="looked">
			为你推荐
		</div>
	</div>
	<ul class="content-list">
		<li class="havebg">
			<div class="bg">		
			</div>
			<a href="show.onework?id=147">
				<img src="<%=basePath %>/user/head/48.jpg" >
			</a>	
		</li>
		<li class="nobg">
			<div class="li">
				<div class="list-left">
					<h2>插画设计</h2>
					<p>我是少女</p>
					<span class="infor">
						33发布
					</span>
					<span  class="infor">
						300经验
					</span>
				</div>
				<div class="triangleleft">
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="li">
				<div class="list-right">
					<h2>插画设计</h2>
					<br class="clear">
					<p>喵大人</p>
					<span class="infor">
						30发布
					</span>
					<span  class="infor">
						280经验
					</span>
				</div>
				<div class="triangleright">
					<span></span>
					<span></span>
				</div>
			</div>
		</li>
		<li class="havebg">
			<div class="bg">
				
			</div>
			<a href="show.onework?id=148">
				<img src="<%=basePath %>/user/head/49.jpg" >
			</a>
			
		</li>
		<li class="havebg hoversth">
			<a href="show.onework?id=149">
			<div class="bg">
			</div>	
			</a>
			
			<div class="bg-tip clear">
				<div class="tip-left">
					插画
				</div>
				<div class="tip-right">
					<h3>父母的爱</h3>
					<p>30psd</p>
				</div>
			</div>
		</li>
		<li class="havebg">
			<div class="bg">
				
			</div>
			<a href="show.onework?id=150">
				<img src="<%=basePath %>/user/head/52.jpg" >
			</a>
			
		</li>
		<li class="havebg hoversth">
			<a href="show.onework?id=151">
			<div class="bg">
				
			</div>		
			</a>
			
			<div class="bg-tip clear">
				<div class="tip-left">
					插画
				</div>
				<div class="tip-right">
					<h3>鲸</h3>
					<p>30psd</p>
				</div>
			</div>		
		</li>
		<li class="nobg">
			<div class="li">
				<div class="list-left">
					<h2>插画设计</h2>
					<p>我是少女</p>
					<span class="infor">
						33发布
					</span>
					<span  class="infor">
						300经验
					</span>
				</div>
				<div class="triangleleft">
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="li">
				<div class="list-right">
					<h2>插画设计</h2>
					<br class="clear">
					<p>喵大人</p>
					<span class="infor">
						30发布
					</span>
					<span  class="infor">
						280经验
					</span>
				</div>
				<div class="triangleright">
					<span></span>
					<span></span>
				</div>
			</div>
		</li>
		<li class="havebg">
			<div class="bg">
				
			</div>
			<a href="show.onework?id=152">
				<img src="<%=basePath %>/user/head/6.jpg" >
			</a>
			
		</li>
		<li class="havebg">
			
			<a href="show.onework?id=153">
			<div class="bg">
				
			</div>	
			</a>		
		</li>
		<li class="nobg">
			<div class="li">
				<div class="list-left">
					<h2>插画设计</h2>
					<p>我是少女</p>
					<span class="infor">
						33发布
					</span>
					<span  class="infor">
						300经验
					</span>
				</div>
				<div class="triangleleft">
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="li">
				<div class="list-right">
					<h2>插画设计</h2>
					<br class="clear">
					<p>喵大人</p>
					<span class="infor">
						30发布
					</span>
					<span  class="infor">
						280经验
					</span>
				</div>
				<div class="triangleright">
					<span></span>
					<span></span>
				</div>
			</div>
		</li>
		<li class="havebg">
			<div class="bg">
				
			</div>
			<a href="show.onework?id=154">
				<img src="<%=basePath %>/user/head/51.jpg" >
			</a>
		</li>
		<li class="havebg hoversth">
			
			<a href="show.onework?id=155">
			<div class="bg">
				
			</div>	
			</a>	
			<div class="bg-tip clear">
				<div class="tip-left">
					插画
				</div>
				<div class="tip-right">
					<h3>icon标致</h3>
					<p>20psd</p>
				</div>
			</div>	
		</li>
	</ul>
	<div class="more">
		加载更多
	</div>
</section>
<footer>
	<div class="foot">
		<div class="foot-left">
			<ul class="foot-ul">
				<li>
					友情链接
				</li>
				<li>
					UI中国
				</li>
				<li>
					创客
				</li>
			</ul>
			<ul class="foot-ul">
				<li>
					市场合作
				</li>
				<li>
					联系我们
				</li>
				<li>
					用户反馈
				</li>
			</ul>
			<ul class="foot-ul">
				<li>
					移动客户端
				</li>
				<li>
					设集iPhone版
				</li>
				<li>
					设集android版
				</li>
			</ul>
		</div>
		<div class="foot-right">
			<p>关注我们</p>
			<img src="images/erwei.png">
			<p>官方微博：@设集网</p>
		</div>
	</div>
</footer>
<script src="js/lib/jquery-1.11.3.min.js"></script>
<script src="js/lib/modernizr.min.js" type="text/javascript"></script>
<script src="js/lib/flickerplate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/lib/sweetalert.min.js"></script>
<script>
	$('.flicker-example').flicker({
		auto_flick_delay:7,
	});	
</script>
<!-- <script src="js/src/index.js"></script> -->
<script src="js/src/public.js"></script>

 </body>
</html>
