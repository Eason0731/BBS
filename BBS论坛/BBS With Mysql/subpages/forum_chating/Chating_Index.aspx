<%@ Page Title="灌水区" Language="C#" MasterPageFile="~/subpages/MasterPage-Bankuai.master" AutoEventWireup="true" CodeFile="Chating_Index.aspx.cs" Inherits="subpages_forum_chating_Chating_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
欢迎进入灌水区
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
<asp:GridView ID="GridView1" runat="server" Width="100%" 
          AutoGenerateColumns="False" class="STYLE2" Font-Size="Large"  
        onrowdeleting="GridView1_RowDeleting" 
        onpageindexchanging="GridView1_PageIndexChanging" AllowPaging="True" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" PageSize="10">
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

          <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
          <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
          <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
          <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
          <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#FFF1D4" />
          <SortedAscendingHeaderStyle BackColor="#B95C30" />
          <SortedDescendingCellStyle BackColor="#F1E5CE" />
          <SortedDescendingHeaderStyle BackColor="#93451F" />

      </asp:GridView>
</asp:Content>

