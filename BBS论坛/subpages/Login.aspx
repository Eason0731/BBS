<%@ Page Title="登录" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="subpages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
用户登录
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
<table width="70%" border="0">
        <tr>
          <td width="40%" style="height: 23px"><div align="right">用户名：</div></td>
          <td width="60%" style="height: 23px">
              <label>
              <asp:TextBox ID="txt用户名" runat="server"></asp:TextBox>
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">密码：</div></td>
          <td>
              <asp:TextBox ID="txt密码" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>

        <tr>
          <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn登录" runat="server" Text="登录" onclick="btn登录_Click" BackColor="#0066FF" Width="158px" 
                    Font-Size="Medium" Height="29px" />
&nbsp;
                <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click" BackColor="#0066FF" Width="158px" 
                    Font-Size="Medium" Height="29px" />
              </div>
          </label></td>
        </tr>
      </table>
</asp:Content>

