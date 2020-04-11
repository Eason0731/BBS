<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update-SE.aspx.cs" Inherits="admin_sportsevents_manage_update_SE" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/png" href="~\images\FO.ico"/>
<title>更新体育项目</title>
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
	height:800px;
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
	height:800px;
	background:#ecf1f5;
	float:left;
}
.main .main_right {
	width:1000px;
	height:800px;
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
        <li>更新用户</li>
      </ul>
    </div>
  </div>
  <div class="main" style="border:2px #000000 solid;">
    <div class="main_left"> 
    <br />
    <ul><li></li> 
    <li></li> 
    <li></li>  
    <li><a href="sportsevents-manage.aspx">返回上一级</a></li>
    </ul>  
    </div>
    <div class="main_right"> 
    <br />
    <table width="50%" border="0">
        <tr>
          <td width="40%"><div align="right">项目名：</div></td>
          <td width="60%">
              <label>
              <asp:TextBox ID="txt项目名" runat="server" Width="278px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="txt项目名" ErrorMessage="项目名不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">项目介绍：</div></td>
          <td>
              <asp:TextBox ID="txt项目介绍" runat="server" CssClass="txtwid " Height="255px" 
                  TextMode="MultiLine" Width="413px"></asp:TextBox>
              <label>
              <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txt项目介绍" ErrorMessage="项目介绍不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
              &nbsp;</td>
        </tr>

        <tr>
        <td>
        <div align="right">上传图片：</div>
        </td>  
        <td>
         <asp:FileUpload ID="FileUpload1" runat="server" />
         <asp:Label ID="label1" runat="server" ForeColor="Red"></asp:Label>
         <asp:Button ID="UploadButton" runat="server" Text="上传图片" OnClick="UploadButton_Click" />
        </td>
        </tr>
        <tr>
         <td>
       
        </td>
        <td>
         <asp:Image ID="Image1" runat="server" Height="118px" Width="131px" />
        </td>
        </tr>
        
        <tr>
        <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn更新" runat="server" Text="更新" onclick="btn更新_Click" ValidationGroup="group1"  />
&nbsp;
                <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click"  />
              &nbsp;
                </div>
          </label></td>
      </table>
    </div>
    <br />
    <br />
  </div>
</div>
    </form>
</body>
</html>
