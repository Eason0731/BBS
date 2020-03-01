<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sportsevents-manage.aspx.cs" Inherits="admin_sportsevents_manage_sportsevents_manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>体育项目管理</title>
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
	height:1500px;
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
	height:1500px;
	background:#ecf1f5;
	float:left;
}
.main .main_right {
	width:1000px;
	height:1500px;
	background:#00FFFF;
	float:left;
}

.main img{ width:131px; height:118px}
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
        <li> 体育项目管理</li>
      </ul>
    </div>
  </div>
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_left"> 
    <br />
    <ul>
      <li></li> 
      
    <li><a href="add-sportsevents.aspx">添加项目</a></li>  
    <li><a href="../admin-index.aspx">返回后台首页</a></li>
    </ul>  
    </div>
    <div class="main_right"> 
        <asp:GridView ID="GridView1" runat="server" Width="70%" 
            AutoGenerateColumns="False" 
            onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" 
            onrowdeleting="GridView1_RowDeleting" Font-Size="Medium"  CellPadding="4" ForeColor="#333333" PageSize="4">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ImageField DataImageUrlField="images" HeaderText="图片">
                    <ItemStyle Width="20%" />
                </asp:ImageField>
                <asp:BoundField DataField="eventname" HeaderText="项目名称" />
                <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="update-SE.aspx?id={0}" HeaderText="操作" Text="编辑" />
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
