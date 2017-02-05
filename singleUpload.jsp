<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="singleUpload" enctype="multipart/form-data" method="post">
	Author:<input type="text" name="anthor"><br/>
	Select file to upload:<input type="file" name="filename" /><br/>
	<input type="submit" value="upload"/>

</form>
</body>
</html>