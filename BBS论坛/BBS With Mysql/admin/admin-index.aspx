<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-index.aspx.cs" Inherits="admin_admin_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/png" href="~\images\FO.ico"/>
<title>后台首页</title>
<link href="../style/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #FF9933
}

*{ font-size:16px;}
li {
	list-style:none
}
.banner li {
	font-size:20px;
	color:#FF0000
}
.main {
	width:1200px;
	height:400px;
}
.main ul {
	color: #333333;
	font-weight:bold;
}
.main li {
	color: #333333;
	line-height:30px;
}
.main .main_left {
	width:200px;
	height:400px;
	background:#ecf1f5;
	float:left;
}
.main .main_right {
	width:1000px;
	height:400px;
	background:#00FFFF;
	float:left;
}
-->
</style>
</head>
<body>
<div class="box">
  <div class="header"></div>
  <div class="banner"> <img src="../images/logo.gif" />
    <div align="left">
      <ul>
        <li> 后台管理系统</li>
      </ul>
    </div>
  </div>
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_left"> <br />
      <ul>
        <li><a href="users-manage/users-manage.aspx">用户管理</a></li>
        <li><a href="forum-manage/forumA-manage.aspx">版块管理</a></li>
        <li><a href="sportsevents-manage/sportsevents-manage.aspx">体育项目管理</a></li>
        <li><a href="boards-manage/boards-manage.aspx">留言管理</a></li>
        <li><a href="../index.aspx">返回网站首页</a></li>
      </ul>
    </div>
    <div class="main_right"> </div>
    <br />
    <br />
  </div>
</div>
</body>
</html>