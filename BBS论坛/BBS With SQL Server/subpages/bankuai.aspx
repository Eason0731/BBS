<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bankuai.aspx.cs" Inherits="subpages_bankuai" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>板块</title>
<link href="../style/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #FF9933
}
.main {
	width:1200px;
	height:1000px;
}
.main ul {
	color:#3333CC;
	font-weight:bold;
}
.main .main_title {
	width:1200px;
	height:50px;
	background:#ecf1f5
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
<div class="box">
  <div class="header">
      <asp:Label ID="lbl时间" runat="server"></asp:Label>
    </div>
  <div class="banner"> <img src="../images/logo.gif" />
    <div align="right"> &nbsp;<asp:Label 
            ID="lbl用户" runat="server"></asp:Label><asp:Label 
            ID="lbl显示" runat="server"></asp:Label>&nbsp;<asp:Label ID="lbl阅读权限" runat="server"></asp:Label>
      </div>
  </div>
  <div class="nav" style="border:2px #256ebd solid;">
    <ul class="nav">
      <li><a href="../index.aspx">论坛首页</a></li>
      <li><a href="#">板块浏览</a>
        <ul>
          <li><a href="#">中国足球</a></li>
          <li><a href="#">国际足球</a></li>
          <li><a href="#">中国篮球</a></li>
          <li><a href="#">国际篮球</a></li>
          <li><a href="#">赛车运动</a></li>
          <li><a href="#">综合体育</a></li>
          <li><a href="#">聊天灌水</a></li>
        </ul>
      </li>
      <li><a href="#">搜索帖子</a>
        <ul>
          <li><a href="#">个人帖子</a></li>
          <li><a href="#">站内搜索</a></li>
        </ul>
      </li>
      <li><a href="sports-event.aspx">体育项目介绍</a></li>
      <li><a href="boards.aspx">申诉/留言</a></li>
      <li><a href="#">联系我们</a></li>
    </ul>
  </div>
  <br />
  <asp:Button ID="btn发帖" runat="server" BackColor="#FF6600" Height="37px" 
    Text="发帖" Width="87px"/>
   
  <br />
   <br />
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_title">
      <ul>
        <br />欢迎进入XXX板块
     </ul>
      
    </div>
    <br />
    
    <br />
  </div>
  <div class="footer" style="border:2px #000000 solid;">
    <div align="center">
      <ul>
        <li>Powered by Visual Studio</li>
        <li>Copyright(C) 2014 Sports BBS</li>
      </ul>
    </div>
  </div>
</div>
    </form>
</body>
</html>
