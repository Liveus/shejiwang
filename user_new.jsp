<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>个人空间</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
    
</head>
<body>

<script type="text/javascript" src="js/lib/jquery-1.11.3.min.js"></script>
<script  type="text/javascript"  src="js/lib/headroom.min.js"></script> 
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
<script src="js/lib/distpicker.data.js"></script>
<script src="js/lib/distpicker.js"></script>
<script src="js/src/user.js"></script>
<script src="js/src/public.js"></script>
</body>
</html>