<%@ Page Title="编辑回复" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Update_Floor.aspx.cs" Inherits="subpages_Update_Floor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    编辑回复&nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <table width="50%" border="0">
       
        <tr>
        <td > <div align="right">
           </div>
        </td>
        
        <td>
            <asp:TextBox ID="txt编辑内容" runat="server" Height="200px" TextMode="MultiLine" 
                Width="700px"></asp:TextBox>
        </td>
        </tr>
        
        <tr>
          <td colspan="2"><label>
            <div align="center">
            <br />
                <asp:Button ID="btn更新" runat="server" Text="更新" onclick="btn更新_Click"  />
&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">返回</asp:LinkButton>
                &nbsp;
                <asp:HiddenField ID="PostidHiddenField1" runat="server" />
                </div>
          </label></td>
        </tr>
      </table>

</asp:Content>

