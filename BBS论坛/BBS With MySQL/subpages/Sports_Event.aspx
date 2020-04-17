<%@ Page Title="体育项目" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Sports_Event.aspx.cs" Inherits="subpages_Sports_Event" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
体育项目
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<br />
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" Width="100%" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black">
        <AlternatingItemStyle BackColor="PaleGoldenrod" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td style="width:15%">
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "images")%>' Width="100px" Height="80px"/> </td>
                    <td style="width:10%">
                       <%#DataBinder.Eval(Container.DataItem, "eventname")%></td>
                    <td style="width:80%">
                       <%#DataBinder.Eval(Container.DataItem, "eventintro")%></td>
                </tr>
               <hr />
            </table>
             
        </ItemTemplate>
        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    </asp:DataList>          
</asp:Content>

