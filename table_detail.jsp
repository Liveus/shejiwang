<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.UserDetail"%>
<%@ page import="entity.Teach"%>
<%@ page import="entity.Work"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class='no-js' lang='en'>
<head>
<meta charset='utf-8'>
<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
<title>Tables</title>
<meta content='lab2023' name='author'>
<meta content='' name='description'>
<meta content='' name='keywords'>
<link href="assets/stylesheets/application-a07755f5.css"
	rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/admun_style.css">
<link rel="stylesheet" type="text/css" href="css/table_detail.css">
</head>
<body>
	<%
UserDetail oneDetail = (UserDetail)session.getAttribute("oneDetail");
Iterator iter = oneDetail.getAllWorks().iterator();
%>
	<div class="model_title">
		<span>${oneDetail.user.name}</span> <span></span> 今日登录<span>0小时</span>
	</div>
	<div id="content">
		<div class="row">
			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">全</span>
						<h5>作品</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement1">${oneDetail.workAmount}</h1>
						<!-- <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i>
		          </div>
		          <small>总访问量</small> -->
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">全</span>
						<h5>教程</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement2">${oneDetail.teachAmount }</h1>
						<!-- <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
		          </div>
		          <small>总用户</small> -->
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-primary pull-right">全</span>
						<h5>小组</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement3">${oneDetail.groupAmount }</h1>
						<!-- <div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
		          </div>
		          <small>新作品</small> -->
					</div>
				</div>
			</div>

			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">全</span>
						<h5>关注</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement5">${oneDetail.user.follow}</h1>
						<!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
		          </div>
		          <small>12月</small> -->
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">全</span>
						<h5>粉丝</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement6">${oneDetail.user.fans}</h1>
						<!--  <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
		          </div>
		          <small>12月</small> -->
					</div>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">全</span>
						<h5>累计登录天数</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins" id="myTargetElement4">${oneDetail.logDay}</h1>
						<!--  <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i>
		          </div>
		          <small>12月</small> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="list fl">
		<div class="list_title">作品分布</div>
		<div id="work_bing" style="width:600px"></div>
	</div>
	<div class="list fl">
		<div class="list_title">教程分布</div>
		<div id="teach_bing" style="width:600px"></div>
	</div>
	<br style="clear:both;">
	<p style="height:30px;"></p>
	<div class="list fl">
		<div class="list_title">过去一周发布作品</div>
		<div id="work_zhe" style="width:600px"></div>
	</div>
	<div class="list fl">
		<div class="list_title">过去一周发布教程</div>
		<div id="teach_zhe" style="width:600px"></div>
	</div>
	<br style="clear:both;">

<% 
    if(iter.hasNext()){
    Work oneWork = (Work)iter.next();
    %>
    <div class="list">
        <div class="list_title">最优作品</div>
        <div class="fl zuo_img">
            <img
                src="<%=basePath%>/work/pic/<%=oneWork.getEmail()%>/<%=oneWork.getPath()%>"
                alt="">
        </div>
        <div id="work_zhu" style="width:600px" class="fl"></div>
    </div>
    <%}%>
	<br style="clear:both;height:10px;">
	<script src="jquery.min.js" type="text/javascript"></script>
	<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="http://cdn.hcharts.cn/highcharts/highcharts-3d.js"></script>
	<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>

	<script>
	$(function () {
    $('#work_bing').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        credits: {
         enabled:false
      },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: '比例',
            data: [
                ['字体设计',   45.0],
                ['UI设计',       26.8],
                {
                    name: '海报设计',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['平面设计',    8.5],
                ['插画设计',     6.2],
                ['摄影',   0.7]
            ]
        }]
    });
    $('#teach_bing').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        credits: {
         enabled:false
      },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: '比例',
            data: [
                ['设计教程',   25.0],
                ['经验分享',       46.8],
                
                ['字体特效',12.8],
                ['调色教程',    8.5],
                ['配色教程',     6.9]
            ]
        }]
    });
    $('#work_zhe').highcharts({
        title: {
            text: '',
            x: -20 //center
        },
        credits: {
         enabled:false
      },
        xAxis: {
            categories: ['周一', '周二', '周三', '周四', '周五', '周六',
                         '周日']
        },
        yAxis: {
            title: {
                text: '数量'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
         enabled:false
      },
        series: [{
            name: '作品',
            data: [3.0, 4, 5, 4, 5, 3, 4]
        }]
    });
    $('#teach_zhe').highcharts({
        title: {
            text: '',
            x: -20 //center
        },
        credits: {
         enabled:false
      },
        xAxis: {
            categories: ['周一', '周二', '周三', '周四', '周五', '周六',
                         '周日']
        },
        yAxis: {
            title: {
                text: '数量'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
         enabled:false
      },
        series: [{
            name: '作品',
            data: [5, 6, 4, 5, 6, 3, 4]
        }]
    });
    $('#work_zhu').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: ['下载量', '访问量', '评论量', '收藏量'],
            title: {
                text: null
            }
        },
        
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        credits: {
         enabled:false
      },
        legend: {
         enabled:false
      },
        credits: {
            enabled: false
        },
        series: [{
            name: '目光',
            data: [107, 31, 20, 203]
        }]
    });

});
</script>

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
var demo5 = new CountUp("myTargetElement5", 0, $('#myTargetElement5').html(), 0, 2.5, options);
var demo6 = new CountUp("myTargetElement6", 0, $('#myTargetElement6').html(), 0, 2.5, options);
demo1.start();
demo2.start();
demo3.start();
demo4.start();
demo5.start();
demo6.start();
</script>
</body>
</html>