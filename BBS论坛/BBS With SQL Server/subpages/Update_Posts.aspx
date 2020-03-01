<%@ Page Title="编辑帖子" Language="C#" MasterPageFile="~/subpages/MasterPage-subpage.master" AutoEventWireup="true" CodeFile="Update_Posts.aspx.cs" Inherits="subpages_Update_Posts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    编辑帖子-<asp:Label ID="lblType" runat="server" Text="Label"></asp:Label>
    <asp:HiddenField ID="TypeHiddenField1" runat="server" />
    <asp:HiddenField ID="PostIDHiddenField1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
<table border="0">
<tr>
        <td>
        <div align="right">分类：</div>
        </td>
        <td>
            <asp:DropDownList ID="ddl分类_赛车" runat="server" Width="200px">
                <asp:ListItem Value="">请选择主题分类...</asp:ListItem>
                <asp:ListItem>法拉利</asp:ListItem>
                <asp:ListItem>麦克拉伦</asp:ListItem>
                <asp:ListItem>梅赛德斯GP</asp:ListItem>
                <asp:ListItem>红牛</asp:ListItem>
                <asp:ListItem>威廉姆斯</asp:ListItem>
                <asp:ListItem>F1新闻</asp:ListItem>
                <asp:ListItem>车手</asp:ListItem>
                <asp:ListItem>原创</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
            </asp:DropDownList>
             <asp:DropDownList ID="ddl分类_篮球" runat="server" Width="200px">
                <asp:ListItem Value="">请选择主题分类...</asp:ListItem>
                <asp:ListItem>NBA/NBA新闻</asp:ListItem>
                <asp:ListItem>CBA/CBA新闻</asp:ListItem>
                <asp:ListItem>中国篮球-国家队</asp:ListItem>
                <asp:ListItem>球星</asp:ListItem>
                <asp:ListItem>原创</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddl分类_灌水" runat="server" Width="200px">
                <asp:ListItem Value="">请选择主题分类...</asp:ListItem>
                <asp:ListItem>综合体育</asp:ListItem>
                <asp:ListItem>演艺明星</asp:ListItem>
                <asp:ListItem>纯灌水</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddl分类_足球" runat="server" Width="200px">
                <asp:ListItem Value="">请选择主题分类...</asp:ListItem>
                <asp:ListItem>中超/中超新闻</asp:ListItem>
                <asp:ListItem>中甲/中甲新闻</asp:ListItem>
                <asp:ListItem>中国足球-国家队</asp:ListItem>
                <asp:ListItem>世界杯</asp:ListItem>
                <asp:ListItem>英超/英超新闻</asp:ListItem>
                <asp:ListItem>西甲/西甲新闻</asp:ListItem>
                <asp:ListItem>德甲/德甲新闻</asp:ListItem>
                <asp:ListItem>法甲/法甲新闻</asp:ListItem>
                <asp:ListItem>意甲/意甲新闻</asp:ListItem>
                <asp:ListItem>欧冠/欧冠新闻</asp:ListItem>
                <asp:ListItem>球星</asp:ListItem>
                <asp:ListItem>原创</asp:ListItem>
                <asp:ListItem>其他</asp:ListItem>
            </asp:DropDownList>
             <asp:DropDownList ID="ddl分类_公告" runat="server" Width="200px">
                <asp:ListItem Value="">请选择主题分类...</asp:ListItem>
                <asp:ListItem>公告</asp:ListItem>
                <asp:ListItem>任命版主</asp:ListItem>
                <asp:ListItem>禁言用户</asp:ListItem>
                <asp:ListItem>解封用户</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFV_公告" runat="server" 
                ErrorMessage="分类不能为空！" ControlToValidate="ddl分类_公告" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV_篮球" runat="server" 
                ErrorMessage="分类不能为空！" ControlToValidate="ddl分类_篮球" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV_灌水" runat="server" 
                ErrorMessage="分类不能为空！" ControlToValidate="ddl分类_灌水" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV_足球" runat="server" 
                ErrorMessage="分类不能为空！" ControlToValidate="ddl分类_足球" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RFV_赛车" runat="server" 
                ErrorMessage="分类不能为空！" ControlToValidate="ddl分类_赛车" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
          <td width="35%"><div align="right">标题：</div></td>
          <td width="65%">
              <label>
              <asp:TextBox ID="txt标题" runat="server" Width="350px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ControlToValidate="txt标题" ErrorMessage="标题不能为空！" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
          </label>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right">内容：</div></td>
          <td>
              <asp:TextBox ID="txt内容" runat="server" CssClass="txtwid " 
            Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="txt内容" ErrorMessage="内容不能为空！" ValidationGroup="ValidataGroup1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
         
        <tr>
          <td colspan="2">
            <div align="center">
               
                <asp:Button ID="btn编辑" runat="server" Text="编辑" onclick="btn编辑_Click" ValidationGroup="ValidataGroup1"/>
                <asp:Button ID="btn重置" runat="server" Text="重置" onclick="btn重置_Click" />
                
                <asp:LinkButton ID="lb返回" runat="server" onclick="lb返回_Click">返回</asp:LinkButton>
                
          </div>
          </td>
        </tr>
      </table>
</asp:Content>

