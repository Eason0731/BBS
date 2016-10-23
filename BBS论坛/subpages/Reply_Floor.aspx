<%@ Page Title="回复" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Reply_Floor.aspx.cs" Inherits="subpages_Reply_Floor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    回复帖子
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <table width="60%" border="0">
       <tr>
       
       <td>
           
       </td>
       <td>
           <strong>
           <asp:Label ID="lbl引用" runat="server" Text="引用"></asp:Label>
           <asp:Label ID="lbl作者" runat="server" ForeColor="Red"></asp:Label><asp:Label
               ID="lbl发表的" runat="server" Text="发表的"></asp:Label> <asp:Label ID="lbl内容" 
               runat="server" ForeColor="Red"></asp:Label>
           </strong>
       </td>
       </tr>
       <tr>
      
       <td>
          </td>
       </tr>
        <tr>
        <td > <div align="right">
           </div>
        </td>
        
        <td>
            <asp:TextBox ID="txt评论" runat="server" Height="200px" TextMode="MultiLine" 
                Width="700px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txt评论" ErrorMessage="回复不能为空！"></asp:RequiredFieldValidator>
        </td>
        </tr>
        
        <tr>
          <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn回复" runat="server" Text="回复" onclick="btn回复_Click" 
                    BackColor="#FF3300" Font-Size="Medium" Height="41px" Width="115px"  />
&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                &nbsp;
                <asp:HiddenField ID="PostidHiddenField1" runat="server" />
                </div>
          </label></td>
        </tr>
      </table>

</asp:Content>

