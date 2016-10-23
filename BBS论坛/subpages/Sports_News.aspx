<%@ Page Title="体育新闻" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Sports_News.aspx.cs" Inherits="subpages_Sports_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
体育新闻
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="80%" AutoGenerateColumns="False" Font-Size="Medium">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="Show_Article.aspx?id={0}" DataTextField="title" 
                HeaderText="标题">
            <ItemStyle Width="65%" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="username" HeaderText="作者" >
            <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="class" HeaderText="类型" />
            <asp:BoundField DataField="time" HeaderText="发布时间" />
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
</asp:Content>

