<%@ Page Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Show_Article.aspx.cs" Inherits="subpages_Show_Article"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul>
        [<asp:Label ID="lbl分类" runat="server"></asp:Label>]-
        [<asp:Label ID="lblTitle" runat="server" Font-Bold="True"></asp:Label>]
        <asp:Label ID="lblType" runat="server" Visible="False"></asp:Label>
        <asp:HiddenField ID="TypeHiddenField1" runat="server" />
        <asp:HiddenField ID="TypeHiddenField2" runat="server" />
    </ul>
  <style>
      .style1
      {
          width: 13%;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table  width="100%">
                <tr>
                <td valign="top" width="13%">
                <asp:Label ID="lbl作者" runat="server"></asp:Label>
                <br />
                    <asp:Image ID="IM楼主" runat="server" Width="131px" Height="118px"/>
                    <br />
                    发布时间：<br />
                        <asp:Label ID="lbl发布时间" runat="server"></asp:Label>
                        <br />
                        
                        <br />
                        楼主
                </td>
                <td valign="top">
 
                        
                        <asp:Label ID="lbl帖子内容" runat="server" Width="1050px"></asp:Label>
                       <br />
                        <br />
                        <asp:Label ID="lbl备注" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                       
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div align="right">
                        <br />
                        <br />
                            <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">赞</asp:LinkButton>
                            <asp:Label ID="lbl赞" runat="server"></asp:Label>
&nbsp;<asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">踩</asp:LinkButton>
                            <asp:Label ID="lbl踩" runat="server"></asp:Label>
&nbsp;<asp:LinkButton ID="LB置顶" runat="server" onclick="LB置顶_Click">置顶</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LB解除置顶" runat="server" onclick="LB解除置顶_Click">解除置顶</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="lb编辑" runat="server" onclick="lb编辑_Click">编辑</asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LB删除" runat="server" onclick="LB删除_Click">删除</asp:LinkButton>
                        </div>
                        
                    </td>
                </tr>
                <tr>
                    <td style="font-size:16px" valign="top">
                        
                        </td>
                </tr>
              
            </table>
             <HR style="COLOR: red;border-style:outset; HEIGHT: 8;">
            <asp:DataList ID="DaraList评论" runat="server" Width="100%" 
        BackColor="#66FF33" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" GridLines="Vertical">
                <AlternatingItemStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
        <ItemTemplate>
            <table width="100%">
                <tr>
                    <td style=" width:10%" valign="top">
                        <asp:Label ID="lbl评论作者" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "username")%>'></asp:Label><br />
                        
                        <br />
                        <br />
                        <asp:Image ID="Image1" runat="server" Height="118px" 
                            ImageUrl='<%# DataBinder.Eval(Container.DataItem, "iconpath") %>' 
                            Width="138px" />
                        <br />
                        <br />
                
                        
                    </td>
                    <td valign="top">
                        <div class="quote">
                        <asp:Label ID="lbl引用内容" runat="server" 
                            Text='<%# DataBinder.Eval(Container.DataItem, "quote") %>' BackColor="#FFCCCC"></asp:Label>
                      
                       <br />
                       <%#DataBinder.Eval(Container.DataItem, "content")%></td>
                    </tr>
                    <tr>
                    <td valign="top" height="80" class="style1">
                        <asp:Label ID="lbl楼层" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Floor")%>'></asp:Label>楼
                        <br />
                        发表时间:<br /><%#DataBinder.Eval(Container.DataItem, "time")%><br /><br /></td>
                    
                    <td>
                    <div align="left"><asp:Label ID="Label1" runat="server" 
                            Text='<%# DataBinder.Eval(Container.DataItem, "remark") %>' ForeColor="Red" Font-Bold="true"></asp:Label></div>
                        <div align="right">
                           
                          <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ReplyFloor" oncommand="Button1_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "id")%>'>回复</asp:LinkButton>  
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="EditFloor" oncommand="Button1_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "id")%>'>编辑本楼</asp:LinkButton>
                         <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DeleteFloor" oncommand="Button1_Command" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "id")%>'>删除本楼</asp:LinkButton>
                    </td>
                </tr>
               
            </table>
          <HR style="COLOR: red;border-style:outset; HEIGHT: 8;">
        </ItemTemplate>
                <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
        当前页：<asp:Label ID="lblCurrent" runat="server" Text="1"></asp:Label>
        总页数：<asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
        <asp:LinkButton ID="lbtnFirst" runat="server" OnClick="lbtnFirst_Click">第一页</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="lbntUp" runat="server" OnClick="lbntUp_Click">上一页</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="lbtnDown" runat="server" OnClick="lbtnDown_Click">下一页</asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="lbtnLast" runat="server" OnClick="lbtnLast_Click">最后一页</asp:LinkButton>
    <br />
    <br />
    
    <ul>评论区域：</ul><br />
    
      <asp:TextBox id="txt评论" cols="100" rows="8" style="width:1100px;height:300px;" runat="server"></asp:TextBox>
   
    <br />
   
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txt评论" ErrorMessage="评论不能为空!" ForeColor="Red" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
      <br />
      <asp:Button ID="btn评论" runat="server" Text="评论" onclick="btn评论_Click" 
        ValidationGroup="ValidationGroup1" BackColor="#FF3300" Font-Size="Medium" 
        Height="39px" Width="138px" />
      <asp:LinkButton ID="LB返回" runat="server" onclick="LB返回_Click">返回板块</asp:LinkButton>
      
      <br />
      <div align="center">
          </div>
      <br />
      </asp:Content>

