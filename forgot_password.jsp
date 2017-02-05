<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html class='no-js' lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <title>Forgot password</title>
    <meta content='lab2023' name='author'>
    <meta content='' name='description'>
    <meta content='' name='keywords'>
    <link href="assets/stylesheets/application-a07755f5.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/images/favicon.ico" rel="icon" type="image/ico" />
    
  </head>
  <body class='login'>
    <div class='wrapper'>
      <div class='row'>
        <div class='col-lg-12'>
          <form>
            <fieldset>
              <legend>Reset your password</legend>
            </fieldset>
            <div class='form-group'>
              <label class='control-label'>Email address</label>
              <input class='form-control' placeholder='Enter your email address' type='text'>
            </div>
            <a class="btn btn-default" href="/">Send</a>
            <a href="/">Go back</a>
          </form>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <!-- Javascripts -->
     <script src="//cdn.bootcss.com/jquery/1.10.1/jquery.min.js" type="text/javascript"></script><script src="//cdn.bootcss.com/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script><script src="modernizr.min.js" type="text/javascript"></script><script src="assets/javascripts/application-985b892b.js" type="text/javascript"></script>
    <!-- Google Analytics -->
    
  </body>
</html>

