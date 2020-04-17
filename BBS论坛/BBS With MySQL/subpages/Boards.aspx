<%@ Page Title="留言板" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Boards.aspx.cs" Inherits="subpages_boards"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        申诉及留言</p>
     
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table width="40%" border="0">
        <tr>
          <td width="40%"><div align="right">
              <asp:DropDownList ID="ddl分类" runat="server">
                  <asp:ListItem Value="">请选择...</asp:ListItem>
                  <asp:ListItem>投诉</asp:ListItem>
                  <asp:ListItem>解封账号</asp:ListItem>
                  <asp:ListItem>意见及建议</asp:ListItem>
                  <asp:ListItem>删除/修改帖子</asp:ListItem>
                  <asp:ListItem>申请版主/超版</asp:ListItem>
                  <asp:ListItem>其他</asp:ListItem>
              </asp:DropDownList>
              <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                  ControlToValidate="ddl分类" ErrorMessage="分类不能为空！" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
              </div></td>
          <td width="60%">
              <asp:TextBox ID="txt标题名" runat="server" Width="302px"></asp:TextBox>
              <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txt标题名" ErrorMessage="标题不能为空！" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">内容：</div></td>
          <td>
              <asp:TextBox ID="txt留言内容" runat="server" TextMode="MultiLine" Height="133px" 
                  Width="336px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="txt留言内容" ErrorMessage="内容不能为空！" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
              <br />
            </td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td>
              &nbsp;</td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td>
              我的留言记录：</td>
        </tr>

        <tr>
          <td colspan="2">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  onrowdeleting="GridView1_RowDeleting" Width="100%" 
                  BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                  CellPadding="2" ForeColor="Black" GridLines="None" Font-Size="Medium">
                  <AlternatingRowStyle BackColor="PaleGoldenrod" />
                  <Columns>
                      <asp:BoundField DataField="username" HeaderText="留言用户" />
                      <asp:BoundField DataField="class" HeaderText="分类" />
                      <asp:BoundField DataField="title" HeaderText="标题" />
                      <asp:BoundField DataField="content" HeaderText="留言内容" />
                  </Columns>
                  <FooterStyle BackColor="Tan" />
                  <HeaderStyle BackColor="Tan" Font-Bold="True" />
                  <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                      HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                  <SortedAscendingCellStyle BackColor="#FAFAE7" />
                  <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                  <SortedDescendingCellStyle BackColor="#E1DB9C" />
                  <SortedDescendingHeaderStyle BackColor="#C2A47B" />
              </asp:GridView>
            </td>
        </tr>

        <tr>
          <td colspan="2">
            <div align="center">
            
                <asp:Button ID="btn提交" runat="server" Text="提交" onclick="btn提交_Click" 
                    ValidationGroup="ValidataGroup1" BackColor="#FF3300" Font-Size="Medium" 
                    Height="47px" Width="110px" />
                <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click" 
                    BackColor="#FF3300" Font-Size="Medium" Height="49px" Width="98px"/>
              </div>
         </td>
        </tr>
      </table>
</asp:Content>

