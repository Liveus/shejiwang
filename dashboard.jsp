<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Manager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class='no-js' lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <title>Dashboard</title>
    <meta content='lab2023' name='author'>
    <meta content='' name='description'>
    <meta content='' name='keywords'>
    <link href="css/application-a07755f5.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/images/favicon.ico" rel="icon" type="image/ico" />
    <link rel="stylesheet" type="text/css" href="css/admun_style.css">
  </head>
  <body class='main page'>
  <%
  	Manager manager = (Manager)session.getAttribute("manager");
   %>
    <!-- Navbar -->
    <div id='wrapper'>
      <!-- Sidebar -->
      <section id='sidebar'>
        <i class='icon-align-justify icon-large' id='toggle'></i>
        <ul id='dock'>
          <li class='active launcher'>
            <i class='icon-dashboard'></i>
            <a href="dashboard.jsp">主页</a>
          </li>
          <li class='launcher'>
            <i class='icon-file-text-alt'></i>
            <a href="work.manager?Windex=1">审核状态</a>
          </li>
          <li class='launcher'>
            <i class='icon-table'></i>
            <a href="all.manager?MUindex=1&MMindex=1">用户管理</a>
          </li>
          <li class='launcher dropdown hover'>
            <i class='icon-flag'></i>
            <a href='teachAnalysis.manager?TAindex=1'>教程管理</a>
            <!-- <ul class='dropdown-menu'>
              <li class='dropdown-header'>Launcher description</li>
              <li>
                <a href='#'>Action</a>
              </li>
              <li>
                <a href='#'>Another action</a>
              </li>
              <li>
                <a href='#'>Something else here</a>
              </li>
            </ul> -->
          </li>
          <li class='launcher'>
            <i class='icon-bookmark'></i>
            <a href='#'>小组管理</a>
          </li>
          <li class='launcher'>
            <i class='icon-cloud'></i>
            <a href='workAnalysis.manager?WAindex=1'>作品管理</a>
          </li>
        </ul>
        <div data-toggle='tooltip' id='beaker' title='Made by lab2023'></div>
      </section>
      <!-- Tools -->
      <section id='tools'>
        <!-- <ul class='breadcrumb' id='breadcrumb'>
          <li class='title'>主页</li>
        </ul> -->
        <ul class='nav navbar-nav pull-right'>
        <li class='dropdown'>
          <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
            <i class='icon-envelope'></i>
            消息
            <span class='badge'>5</span>
            <b class='caret'></b>
          </a>
          <ul class='dropdown-menu'>
            <li>
              <a href='#'>新消息</a>
            </li>
            <li>
              <a href='#'>收件箱</a>
            </li>
            <li>
              <a href='#'>发件箱</a>
            </li>
            <li>
              <a href='#'>垃圾箱</a>
            </li>
          </ul>
        </li>
        <li>
          <a href='#'>
            <i class='icon-cog'></i>
            设置
          </a>
        </li>
        <li class='dropdown user'>
          <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
            <i class='icon-user'></i>
            <strong><%=manager.getName() %></strong>
            <b class='caret'></b>
          </a>
          <ul class='dropdown-menu'>
            <li>
              <a href='#'>修改资料</a>
            </li>
            <li class='divider'></li>
            <li>
              <a href="exit.manager">退出</a>
            </li>
          </ul>
        </li>
      </ul>
      </section>
      <!-- Content -->
      <div id='content'>
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">月</span>
                        <h5>访问量</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="myTargetElement1">1023</h1>
                        <div class="stat-percent font-bold text-success">100% <i class="fa fa-bolt"></i>
                        </div>
                        <small>总访问量</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">全年</span>
                        <h5>注册用户</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="myTargetElement2">200</h1>
                        <div class="stat-percent font-bold text-info">100% <i class="fa fa-level-up"></i>
                        </div>
                        <small>总用户</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">月</span>
                        <h5>作品</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="myTargetElement3">106</h1>
                        <div class="stat-percent font-bold text-navy">100% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新作品</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-danger pull-right">最近一个月</span>
                        <h5>活跃用户</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins" id="myTargetElement4">50</h1>
                        <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
                        </div>
                        <small>10月</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="con-in">
			<div class="row">
				
				<div class="col-lg-4 ">
					<h3>
						作品排行榜
					</h3>






					<ul class="list-ul border-right">
						<li class="list-li one">
              <span>&nbsp</span>
              <a href="">节拍K歌APP图形界面设计-用户个人主页</a>
            </li>
            <li class="list-li two">
              <span>&nbsp</span>
              <a href="">爱尚家logo设计</a>
            </li>
            <li class="list-li three">
              <span>&nbsp</span>
              <a href="">节拍K歌APP图形界面设计logo</a>
            </li>
            <li class="list-li">
              <span>4</span>
              <a href="">ZEAL健身APP图形界面设计</a>
            </li>
            <li class="list-li">
              <span>5</span>
              <a href="">平面设计</a>
            </li>
            <li class="list-li">
              <span>6</span>
              <a href="">one Night</a>
            </li>
					</ul>
				</div>
				<div class="col-lg-4 ">
					<h3>
						教程排行榜
					</h3>
					<ul class="list-ul border-right">
            <li class="list-li one">
              <span>&nbsp</span>
              <a href="">2016时尚设计流行趋势分析</a>
            </li>
            <li class="list-li two">
              <span>&nbsp</span>
              <a href="">图片取色配色法-从电影中取色</a>
            </li>
            <li class="list-li three">
              <span>&nbsp</span>
              <a href="">卡通形象绘制流程讲解</a>
            </li>
            <li class="list-li">
              <span>4</span>
              <a href="">产品故事（一）</a>
            </li>
            <li class="list-li">
              <span>5</span>
              <a href="">PS电商产品图后期修图之背包类产品修图视频教程</a>
            </li>
            <li class="list-li">
              <span>6</span>
              <a href="">15个绘画观察建议</a>
            </li>
						
					</ul>
				</div>
				<div class="col-lg-4 ">
					<h3>
						用户排行榜
					</h3>
					<ul class="list-ul ">
						<li class="list-li one">
							<span>&nbsp</span>
							<a href="">我叫丑比
</a>
						</li>
						<li class="list-li two">
							<span>&nbsp</span>
							<a href="">维西亚小姐</a>
						</li>
						<li class="list-li three">
							<span>&nbsp</span>
							<a href="">听闻余生
</a>
						</li>
						<li class="list-li">
							<span>4</span>
							<a href="">欢愉
</a>
						</li>
						<li class="list-li">
							<span>5</span>
							<a href="">曾经蜡笔没有小新
</a>
						</li>
						<li class="list-li">
							<span>6</span>
							<a href="">仲夏
</a>
						</li>
					</ul>
				</div>
			</div>
        </div>

      </div>
    </div>
    <!-- Footer -->

<!-- Google Analytics -->
<script src="js/lib/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts-3d.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>



</body>
<script src="js/lib/countUp.min.js"></script>
<script>
var options = {
  useEasing : true, 
  useGrouping : true, 
  separator : ',', 
  decimal : '.', 
  prefix : '', 
  suffix : '' 
};
var demo1 = new CountUp("myTargetElement1", 0, $('#myTargetElement1').html(), 0, 2.5, options);
var demo2 = new CountUp("myTargetElement2", 0, $('#myTargetElement2').html(), 0, 2.5, options);
var demo3 = new CountUp("myTargetElement3", 0, $('#myTargetElement3').html(), 0, 2.5, options);
var demo4 = new CountUp("myTargetElement4", 0, $('#myTargetElement4').html(), 0, 2.5, options);

demo1.start();
demo2.start();
demo3.start();
demo4.start();
</script>
</html>

