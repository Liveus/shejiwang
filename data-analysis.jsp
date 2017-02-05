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
    <link href="assets/stylesheets/application-a07755f5.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/images/favicon.ico" rel="icon" type="image/ico" />
    <link rel="stylesheet" type="text/css" href="css/admun_style.css">
  </head>
  <body class='main page'>
  
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
          <li class='launcher'>
            <i class='icon-bug'></i>
            <a href='data-analysis.jsp'>数据分析</a>
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
            <strong></strong>
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
        
        <div id="container" style="max-width:900px;height:400px"></div>
      </div>
    </div>
    <!-- Footer -->
    <!-- Javascripts -->
<script src="jquery.min.js" type="text/javascript"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/highcharts-3d.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>
<script>
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Contents of Highsoft\'s weekly fruit delivery'
        },
        subtitle: {
            text: '3D donut in Highcharts'
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: 'Delivered amount',
            data: [
                ['Bananas', 8],
                ['Kiwi', 3],
                ['Mixed nuts', 1],
                ['Oranges', 6],
                ['Apples', 8],
                ['Pears', 4],
                ['Clementines', 4],
                ['Reddish (bag)', 1],
                ['Grapes (bunch)', 1]
            ]
        }]
    });
});

</script>
  </body>
</html>

