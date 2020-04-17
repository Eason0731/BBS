<%@ Page Title="个人信息编辑" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Personal-edit.aspx.cs" Inherits="subpages_Personal_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    个人信息编辑
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
<table width="45%" border="0">
        <tr>
          <td width="40%"><div align="right">用户名：</div></td>
          <td width="60%">
              <asp:Label ID="lbl用户名" runat="server"></asp:Label>
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
                  ControlToValidate="txt密码" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
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
                  ControlToValidate="txt年龄" ErrorMessage="年龄不能为空！"></asp:RequiredFieldValidator>
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
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>

        <tr>
        <td>
        <div align="right">
                  上传头像：</div>
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
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>

        <tr>
        <td> <div align="right">
        个人简介:</div>
        </td>
        
        <td>
            <asp:TextBox ID="txt个人简介" runat="server" Height="150px" TextMode="MultiLine" 
                Width="400px"></asp:TextBox>
        </td>
        </tr>
        
        <tr>
          <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn更新" runat="server" Text="更新" onclick="btn更新_Click" 
                    BackColor="#FF3300" Font-Size="Medium" Height="52px" Width="118px"  />
&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                &nbsp;
                </div>
          </label></td>
        </tr>
      </table>
</asp:Content>

