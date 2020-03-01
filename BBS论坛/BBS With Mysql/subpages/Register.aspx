<%@ Page Title="用户注册" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="subpages_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
用户注册

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />


       	<div class="login_main_white"  style=" width:50%">
            	<div class="login_main_announce">
                	<ol style="color:red"><b>注册须知：</b>
					<li>在本站注册的会员，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业机密等信息。</li>
					<li>在所有在本站发表的文章，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将有权不作任何通知使用你在本站发布的作品。</li>
					</ol>
                </div>
                <div class="clearfix"></div>
         </div>
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
              <asp:TextBox ID="txt密码" runat="server" TextMode="Password"></asp:TextBox>
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
          <td><div align="right">确认密码：</div></td>
          <td>
              <label>
              <asp:TextBox ID="txt确认密码" runat="server" TextMode="Password"></asp:TextBox>
              <asp:CompareValidator ID="CompareValidator1" runat="server" 
                  ControlToValidate="txt确认密码" ErrorMessage="两次密码不一致！" 
                  ControlToCompare="txt密码" ValidationGroup="group1"></asp:CompareValidator>
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
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
        <td></td>
        <td></td>
        </tr>
       <tr>
        <td></td>
        <td></td>
        </tr>
        <tr>
          <td>
              </td>
          <td><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" />我已阅读本<asp:LinkButton
                  ID="LinkButton1" runat="server" onclick="LinkButton1_Click">论坛注册协议</asp:LinkButton></td>
        </tr>
        <tr>
        
          <td colspan="2"><label>
            <div align="center">
            <br />
&nbsp;<label>
          </label>&nbsp;
          <asp:Button ID="btn注册" runat="server" Text="注册" onclick="btn注册_Click" 
                    ValidationGroup="group1" BackColor="#0066FF" Width="158px" 
                    Font-Size="Medium" Height="29px"/>
          &nbsp;
          <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click"  
                    BackColor="#0066FF" Width="158px" Font-Size="Medium" Height="29px" />
              &nbsp;
                <asp:Label ID="lbl显示" runat="server"></asp:Label>
              </div>
          </label></td>
        </tr>
      </table>


</asp:Content>

