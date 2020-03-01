<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update-forum.aspx.cs" Inherits="admin_forum_manage_update_forum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更新版块</title>
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
	height:600px;
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
	height:600px;
	background:#ecf1f5;
	float:left;
}
.main .main_right {
	width:1000px;
	height:600px;
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
        <li>更新版块</li>
      </ul>
    </div>
  </div>
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_left"> 
    <br />
    <ul><li></li> 
    <li></li> 
    <li></li>  
    <li><a href="forumA-manage.aspx">返回上一级</a></li>
    </ul>  
    </div>
    <div class="main_right"> 
    <br />
    <table border="0" width="50%">
            <tr>
                <td width="40%">
                    <div align="right">
                        版块名：</div>
                </td>
                <td width="60%">
                    <label>
                    <asp:TextBox ID="txt版块名" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt版块名" ErrorMessage="论坛名不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <div align="right">
                        版块简介：</div>
                </td>
                <td>
                    <label>
                    <asp:TextBox ID="txt版块简介" runat="server" TextMode="MultiLine" Height="200px" 
                        Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt版块简介" ErrorMessage="论坛简介不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
                    </label>
                </td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td>
                   <div align="right">上传图片:</div></td>
                <td>
                    <asp:FileUpload ID="FU图片" runat="server" /></td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>
                   <div align="right">显示图片：</div></td>
                <td>
                    <asp:Image ID="IM显示图片" runat="server" Width="100px" Height="80px"/></td>
            </tr>

            <tr>
                <td colspan="2">
                    <label>
                    <div align="center">
                        <br />
                        <asp:Button ID="btn更新" runat="server" onclick="btn更新_Click" Text="更新" ValidationGroup="group1" />
                        &nbsp;
                        <asp:Button ID="btn重置" runat="server" onclick="btn重置_Click" Text="重置" />
                        &nbsp;
                        <asp:Label ID="lbl显示" runat="server"></asp:Label>
                    </div>
                    </label>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
  </div>
</div>
    </form>
</body>
</html>

