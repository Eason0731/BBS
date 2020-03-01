<%@ Page Title="搜索帖子" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="subpages_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        搜索帖子</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />

    <table>
    <tr>
    <td>搜索内容：</td>
    <td><asp:TextBox ID="txt搜素内容" runat="server"></asp:TextBox></td>
    <td>帖子发布者：
    </td><td><asp:TextBox ID="txt作者" runat="server"></asp:TextBox>
    </td>
    
    <td>板块：</td>
    <td>
        <asp:DropDownList ID="ddl板块" runat="server">
            <asp:ListItem Value="">请选择板块</asp:ListItem>
            <asp:ListItem>公告</asp:ListItem>
            <asp:ListItem>足球</asp:ListItem>
            <asp:ListItem>篮球</asp:ListItem>
            <asp:ListItem>赛车</asp:ListItem>
            <asp:ListItem>灌水</asp:ListItem>
        </asp:DropDownList>
    </td>
    </tr>

    <tr>
    <td>时间：</td>
    <td>
        <asp:TextBox ID="KSRQ" runat="server" onClick="WdatePicker()" Width="100px" class="Wdate"></asp:TextBox>-<asp:TextBox ID="JSRQ" runat="server" onClick="WdatePicker()" Width="100px" class="Wdate"></asp:TextBox> </td>
    <td><br />
    </td>
 
    <td><asp:Button ID="btn搜索" runat="server" Text="搜索" onclick="btn搜索_Click" /></td>
    </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        Font-Names="Verdana" Font-Size="Medium" ForeColor="#333333" CellPadding="4"
    GridLines="None" Width="80%" onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="10" EmptyDataText="没有找的相关帖子">
    <HeaderStyle BackColor="#990000" Font-Bold="true" ForeColor="White"  />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="Show_Article.aspx?id={0}" DataTextField="title" 
                HeaderText="标题" Target="_blank" >
            <ItemStyle Width="60%" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="username" HeaderText="作者" >
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="class" HeaderText="主题分类" >
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="time" HeaderText="发布时间" >
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="type" HeaderText="所属板块" >
            <ItemStyle Width="10%" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
</asp:Content>

