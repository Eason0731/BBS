<%@ Page Title="绿茵场" Language="C#" MasterPageFile="~/subpages/MasterPage-Bankuai.master" AutoEventWireup="true" CodeFile="Football_Index.aspx.cs" Inherits="subpages_forum_football_Football_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    欢迎进入绿茵场
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
<asp:GridView ID="GridView1" runat="server" Width="100%" 
          AutoGenerateColumns="False" class="STYLE2" Font-Size="Large"  
        onrowdeleting="GridView1_RowDeleting" 
        onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" GridLines="None">
          <Columns>

                  <asp:BoundField DataField="class" HeaderText="主题分类" >
            
              <ItemStyle Width="10%" />
              </asp:BoundField>

              <asp:HyperLinkField DataNavigateUrlFields="id" 
                  DataNavigateUrlFormatString="../Show_Article.aspx?id={0}" DataTextField="title" 
                  HeaderText="标题">
              
              <ItemStyle Width="60%" />
              </asp:HyperLinkField>
              <asp:BoundField DataField="username" HeaderText="作者">
              
              <ItemStyle Width="10%" />
              </asp:BoundField>
              <asp:BoundField DataField="Time" HeaderText="发布时间" >
             
              <ItemStyle Width="10%" />
              </asp:BoundField>
          </Columns>

          <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
          <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
          <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
          <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#594B9C" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#33276A" />

      </asp:GridView>
</asp:Content>

