<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Fuser"%>
<%@ page import="entity.PageBean"%>
<%@ page import="entity.Question"%>
<%@page import="dao.FUserDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>有问必答</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/header.css">
	<link rel="stylesheet" type="text/css" href="../css/font.css">
	<link rel="stylesheet" type="text/css" href="../css/wenda/index.css">
	<link rel="stylesheet" type="text/css" href="../css/page.css" />
</head>
<body>
	<%
		Fuser user =(Fuser) session.getAttribute("user");
		PageBean pages = (PageBean) session.getAttribute("questions");
   		List list = pages.getList();
		Iterator iter = list.iterator();
		String inters = user.getInterests();
		List<String> memberEmail=new ArrayList<String>();
		String[] sourceStrArray = inters.split("&");
		session.setAttribute("inters", inters);
	    for (int i = 0; i < sourceStrArray.length; i++) {
	    	memberEmail.add(sourceStrArray[i]);
	        }
	    Iterator iter2 = memberEmail.iterator();
	%>
<jsp:include page="../templtate/header2.jsp"></jsp:include>
<div class="contain">
	<div class="wenda clear">
		<div class="wenda-main fl">
			<div class="nav">
				<a href="index2.question?QAindex=1"class="active">推荐</a>
				<a href="time.question?QTindex=1">最新</a>
				<a href="waiting.question?QSindex=1">等待回答</a>
			</div>
			<div class="wenda-list">
			<%
				while(iter.hasNext()){
					Question question =(Question) iter.next();
			 %>
				<div class="ques-answer">
					<div class="tag-img">
						<img src="<%=basePath %>/user/head/<%=new FUserDAO().findByEmail(question.getQuestioner()).getHead()%>">
					</div>
					<div class="from-tag">
						来自
						<a href="">
							<%=question.getQclass() %>
						</a>
					</div>
					<div class="ques-con">
						<a href="show.question?QuestionID=<%=question.getId()%>" class="ques-con-content" target="_blank" title="">
							<%=question.getTitle() %>
						</a> 
					</div>
					<div class="answer-con">
						<div class="ctrl-bar clear">
						 	<span class="agree-with">
						 		<b>赞同</b>
						 		<em><%=question.getAgreements() %></em>
						 	</span>
						 	<span >
						 		<b>回复</b>
						 		<em><%=question.getAnswer() %></em>
						 	</span>
						 	<span >
						 		<b>浏览</b>
						 		<em><%=question.getBrowse() %></em>
						 	</span>
						 	<span >
						 		<b>积分</b>
						 		<em style="color:#81ab25"><%=question.getIntegrate() %></em>
						 	</span>
						 </div>
					</div>
				</div>
				<%
					}
				 %>
				
				<table class="page_table" border="0" cellspacing="0" cellpadding="0">  
		            <tr>
		               <td width="40" align="right"><a href="index2.question?QAindex=1" ><span >首页</span></a></td>
		               <% if(pages.getCurrentPage()>1){ %>
		               <td width="40" align="right"><a href="index2.question?QAindex=${QAindexs-1}&ticket=getNewXsgl"> <span >上一页</span></a></td>  
		               <% }%>
		               <% if(pages.getCurrentPage()==1){ %>
		               <td width="40" align="right"><a href="index2.question?QAindex=1&ticket=getNewXsgl"><span >上一页</span></a></td>  
		               <% }%>
		               <td width="40" align="center" class="page_center"><span > 
		               <% if(pages.getPageTotal()==0){%>0/0<%}%>
		               <% if(pages.getPageTotal()!=0){%><%=pages.getCurrentPage() %>/<%=pages.getPageTotal()%><%}%>
		               </span></td>
		               <% if(pages.getCurrentPage()<pages.getPageTotal()){ %>  
		               <td width="40" align="left"><a href="index2.question?QAindex=${QAindexs+1}&ticket=getNewXsgl"  ><span >下一页</span></a></td>  
		               <%} %>
		               <% if(pages.getCurrentPage()==pages.getPageTotal()){ %>  
		               <td width="40" align="left"><a href="index2.question?QAindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span  >下一页</span></a></td>  
		               <%} %>
		               <td width="40" align="left"><a href="index2.question?QAindex=<%=pages.getPageTotal() %>&ticket=getNewXsgl"><span >尾页</span></a></td>
		             </tr>
		        </table>
			</div>
		</div>
		<div class="wenda-slider fr">
			<div class="slider-top">
				
			</div>
			<div class="user-about">
				<div class="user-info">
			        <div class="user-pic">
			            <a href="/u/1301488/bbs">
			                <img src="<%=basePath %>/user/head/<%=user.getHead() %>" alt="仲夏1">
			            </a>
			        </div>
			        <div class="user-name">
			            <a href="/u/1301488/bbs"><%=user.getName() %></a>
			                                </div>
			        <div class="integral-info clearifx">
			            <a href="/u/1301488/credit" class="integral">积分：<%=user.getIntegral() %></a>
			            <a href="/mall/index" class="integral-mall">积分商城</a>
			        </div>
			    </div>
			    <div class="user-action">
			        <span class="ques"><a href="save.jsp">
			        提问</a></span>
			        <span class="reply"><a href="/u/1301488/bbs?sort=reply">回答</a></span>
			        <span class="follow"><a href="/u/1301488/bbs?sort=follow">关注</a></span>
			    </div>
			</div>
			<div class="my-follow-class">
		        <h3>我关注的分类 <span class="js-open">+</span></h3>
		        <div class="tag-box clear">
		        <%
		        	while(iter2.hasNext()){%>
						<a href="/wenda/12"><%=iter2.next() %></a>
				<%
					}
				%>
                </div><!--.tag-box end-->
		    </div>
		    <div class="recommend-class">
		    	<div class="title clear">
			        <h3>推荐分类</h3>
			        <span class="all-cls">全部分类</span>
			    </div>
			    <ul class="cls-list">
			    	<li>
			            <div class="class-info">
			                <div class="class-icon">
			                    <a href="/wenda/34" target="_blank">
			                        <img src="http://img.mukewang.com/563afdfb000167f300900090.jpg" alt="Cocos2d-x">
			                    </a>
			                </div><!--.class-icon end-->
			                <h4><a href="/wenda/34" target="_blank">工业设计</a></h4>
			                <p class="follow-person">3464人关注</p>
			                <a href="javascript:void(0)" data-tag-id="34" class="follow">关注</a>
			            </div><!--.class-info end-->
			            <div class="desc">
			            	它是各种学科、技术和审美观念的交叉产物。。
			            </div>
			        </li>
			    </ul>
		    </div>
		</div>
		
		
	</div>
</div>
<script type="text/javascript" src="../js/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="../js/lib/headroom.min.js"></script> 
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
<script type="text/javascript" src="../js/lib/jquery.pagination.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").pagination("15");
});
</script>
<script src="../js/src/public.js"></script>
</body>
</html>