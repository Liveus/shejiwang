<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.Manager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>后台登录</title>
    <link href="css/application-a07755f5.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/manager-index.css" rel="stylesheet" type="text/css" >

</head>
  <body class='login'>
    <div class='wrapper'>
      <div class='row'>
        <div class='col-lg-12'>
          <div class='brand text-center'>
            <h1>
                <img src="images/logo.png" alt=""/>
            </h1>
          </div>
        </div>
      </div>
      <div class='row'>
        <div class='col-lg-12'>
          <form action="login.manager" method="post">

            <fieldset class='text-center'>
              
              <div class='form-group'>
                <input class='form-control' placeholder='Email address' type='text' name = "email">
              </div>
              <div class='form-group'>
                <input class='form-control' placeholder='Password' type='password' name = "password">
              </div>
              <div class='text-center'>
                <!-- <div class='checkbox'>
                  <label>
                    <input type='checkbox'>
                    记住密码
                  </label>
                </div> -->
			         	<input type=submit value = "登录" class="btn btn-default">
                <br>
               <!--  <a href="forgot_password.jsp">忘记密码?</a> -->
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
   
  </body>
</html>
