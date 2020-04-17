<%@ Page Language="C#" AutoEventWireup="true" CodeFile="boards-manage.aspx.cs" Inherits="admin_boards_manage_boards_manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/png" href="~\images\FO.ico"/>
<title>留言板管理</title>
<link href="../../style/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #FF9933
}
*{ font-size:16px;}
li{ list-style:none}
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

.main li{
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
    <form id="form1" runat="server">
<div class="box">
  <div class="header"></div>
  <div class="banner"> <img src="../../images/logo.gif" />
    <div align="left">
      <ul>
        <li> 留言板管理</li>
      </ul>
    </div>
  </div>
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_left"> 
    <br />
    <ul>  
    <li><a href="../admin-index.aspx">返回后台首页</a></li>
    </ul>  
    </div>
    <div class="main_right"> 
    <br />
        <asp:GridView ID="GridView1" runat="server" Width="70%" 
            AutoGenerateColumns="False" onrowdeleting="GridView1_RowDeleting" onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="7" Font-Size="Medium"  CellPadding="4" ForeColor="#333333" >
           <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="username" HeaderText="留言用户" />
                <asp:BoundField DataField="class" HeaderText="分类" />
                <asp:BoundField DataField="title" HeaderText="标题" />
                <asp:BoundField DataField="content" HeaderText="留言内容" />
                <asp:CommandField HeaderText="操作" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
      </div>
    <br />
    <br />
  </div>
</div>
    </form>
</body>
</html>

