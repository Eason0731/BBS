<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update-users.aspx.cs" Inherits="admin_users_manage_update_users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/png" href="~\images\FO.ico"/>
<title>更新用户</title>
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
    <li><a href="users-manage.aspx">返回上一级</a></li>
    </ul>  
    </div>
    <div class="main_right"> 
    <br />
    <table width="50%" border="0">
        <tr>
          <td width="40%"><div align="right">用户名：</div></td>
          <td width="60%">
              <label>
              <asp:TextBox ID="txt用户名" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="txt用户名" ErrorMessage="用户名不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">密码：</div></td>
          <td>
              <label>
              <asp:TextBox ID="txt密码" runat="server" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txt密码" ErrorMessage="密码不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
              &nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">性别：</div></td>
          <td>
              <asp:DropDownList ID="ddl性别" runat="server">
                  <asp:ListItem>男</asp:ListItem>
                  <asp:ListItem>女</asp:ListItem>
              </asp:DropDownList>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">年龄：</div></td>
          <td>
              <label>
              <asp:TextBox ID="txt年龄" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                  ControlToValidate="txt年龄" ErrorMessage="年龄不能为空！" ValidationGroup="group1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
              <div align="right">
                  来自：</div>
            </td>
          <td>
              <label>
              <asp:TextBox ID="txt来自" runat="server"></asp:TextBox>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
              <div align="right">
                  职业：</div>
            </td>
          <td>
              <label>
              <asp:TextBox ID="txt职业" runat="server"></asp:TextBox>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
              <div align="right">
                  邮箱：</div>
            </td>
          <td>
              <label>
              <asp:TextBox ID="txt邮箱" runat="server"></asp:TextBox>
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
                  用户组：</div>
            </td>
          <td>
              <asp:DropDownList ID="ddl阅读权限" runat="server">
                  <asp:ListItem>普通用户</asp:ListItem>
                  <asp:ListItem>足球区版主</asp:ListItem>
                  <asp:ListItem>篮球区版主</asp:ListItem>
                  <asp:ListItem>赛车区版主</asp:ListItem>
                  <asp:ListItem>灌水区版主</asp:ListItem>
                  <asp:ListItem>禁言用户</asp:ListItem>
              </asp:DropDownList>
            </td>
        </tr>
        <tr>
          <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn更新" runat="server" Text="更新" onclick="btn更新_Click" ValidationGroup="group1" />
&nbsp;
                <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click"  />
              &nbsp;
                </div>
          </label></td>
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

