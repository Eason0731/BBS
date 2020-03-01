<%@ Page Title="个人信息查看" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Personal-info.aspx.cs" Inherits="subpages_Personal_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    个人信息查看
    <style>
    .main img{ width:131px; height:118px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />

<asp:GridView ID="GridView1" runat="server" Width="70%" 
          AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <Columns>
              <asp:BoundField DataField="username" HeaderText="你的用户名" />
              <asp:ImageField DataImageUrlField="iconpath" HeaderText="头像">
                  
              </asp:ImageField>
              <asp:BoundField DataField="password" HeaderText="密码" />
              <asp:BoundField DataField="sex" HeaderText="性别" />
              <asp:BoundField DataField="age" HeaderText="年龄" />
              <asp:BoundField DataField="location" HeaderText="来自于" />
              <asp:BoundField DataField="career" HeaderText="职业" />
              <asp:BoundField DataField="youxiang" HeaderText="邮箱地址" />
              <asp:BoundField DataField="intro" HeaderText="个人简介" />
              <asp:HyperLinkField DataNavigateUrlFields="id" 
                  DataNavigateUrlFormatString="personal-edit.aspx?id={0}" HeaderText="编辑" 
                  Text="编辑" />
          </Columns>
          <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
          <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
          <SortedAscendingCellStyle BackColor="#FDF5AC" />
          <SortedAscendingHeaderStyle BackColor="#4D0000" />
          <SortedDescendingCellStyle BackColor="#FCF6C0" />
          <SortedDescendingHeaderStyle BackColor="#820000" />
      </asp:GridView>
      <br />
      <br />
</asp:Content>

