<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="icon" type="image/png" href="images\FO 2 years.ico"/>
<title>论坛首页</title>
<link href="style/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	color: #FF9933
}
    .main img{ width:200px; height:100px;}
    
 .main .New_Posts{ width:500px;}
 
*{ margin:0 auto; font-size:14px; }
-->
</style>

<SCRIPT language=javascript>
<!--
    //document.write("");

    function show_date_time() {
        window.setTimeout("show_date_time()", 1000);
        var now = new Date(); //获取系统日期
        //获取时间 
        var hh = now.getHours(); //获取小时
        var mm = now.getMinutes(); //获取分钟
        var ss = now.getTime() % 60000; //获取时间，因为系统中时间是以毫秒计算的， 
        //所以秒要通过余60000得到。 
        ss = (ss - (ss % 1000)) / 1000; //然后，将得到的毫秒数再处理成秒 
        span_dt_dt.innerHTML = hh + "时" + mm + "分" + ss + "秒" + now;
    }
    show_date_time();
//-->
   

</SCRIPT>


</head>
<body>
    <form id="form1" runat="server">
<div class="box">
  <div class="header">
      <span id="span_dt_dt" style='border:1px solid black;background-color:#FFFFFF' ></span>
    </div>
  <div class="banner"> <img src="images/logo.gif" />
    <div align="right">  
        <asp:LinkButton ID="lb登录" runat="server" onclick="lb登录_Click">登录</asp:LinkButton>&nbsp;<asp:LinkButton 
            ID="lb注册" runat="server" onclick="lb注册_Click">注册</asp:LinkButton>&nbsp;<asp:Label 
            ID="lbl显示" runat="server"></asp:Label>
            &nbsp;<asp:LinkButton ID="lb个人信息" runat="server" onclick="lb个人信息_Click">个人信息</asp:LinkButton>
&nbsp;<asp:LinkButton ID="lb注销" runat="server" onclick="lb注销_Click">注销</asp:LinkButton>
      &nbsp;<asp:LinkButton ID="lb后台管理" runat="server" onclick="lb后台管理_Click">后台管理</asp:LinkButton>
        <br />
        <asp:Label ID="lbl用户分组" runat="server"></asp:Label>
        &nbsp;<asp:Label ID="Label1" runat="server" Text="积分："></asp:Label>
        <asp:Label ID="lbl积分" runat="server"></asp:Label>
      </div>
  </div>
  <div class="nav" style="border:2px #256ebd solid;">
    <ul class="nav">
      <li><a href="index.aspx">论坛首页</a></li>
      <li><a href="#">板块浏览</a>
        <ul>
          <li><a href="subpages/forum_notice/Notice_Index.aspx">公告区</a></li>
          <li><a href="subpages/forum_Football/Football_Index.aspx">绿茵场</a></li>
          <li><a href="subpages/forum_Basketball/Basketball_Index.aspx">篮球场</a></li>
          <li><a href="subpages/forum_Racing/Racing_Index.aspx">赛车场</a></li>
          <li><a href="subpages/forum_chating/Chating_Index.aspx">灌水天地</a></li>
        </ul>
      </li>
      <li><a href="Subpages/Search.aspx">搜索帖子</a>
      </li>
      <li><a href="subpages/sports_event.aspx">体育项目介绍</a></li>
      <li><a href="subpages/boards.aspx">申诉/留言</a></li>
     
      <li><a href="subpages/Sports_News.aspx">体育新闻</a></li>  
    </ul>
  </div>
  <div class="main" style="border:2px #000000 solid;">
      <table width="100%">
      <tr>
      <td>
      <asp:DataList ID="DDL最新帖子" runat="server" Width="100%" RepeatLayout="Flow" 
          BackColor="#AAAAAA" BorderColor="#999999" BorderWidth="3px" 
              CellPadding="2" ForeColor="Black" Font-Size="Smaller" BorderStyle="Dotted">
          <AlternatingItemStyle BackColor="PaleGoldenrod" />
          <FooterStyle BackColor="Tan" />
          <HeaderStyle BackColor="Tan" Font-Bold="True" />
          <headertemplate>
           <table width="100%">
           <tr>
           <td width="60%" style=" font-weight:bold; color:Blue">最新主题列表：</td>
           
            </tr>
            </table>
            </headertemplate>
          <ItemTemplate>
              <table style="width:100%;">
                  <tr>
                     <td width="60%">
                        <a href="subpages/Show_Article.aspx?id=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "title")%></a></td>
                     
                  </tr>
              </table>
          </ItemTemplate>
          <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
      </asp:DataList>
      </td>
      <td>
       <asp:DataList ID="DDL最新回复" runat="server" Width="100%" RepeatLayout="Flow" 
          BackColor="#AAAAAA" BorderColor="#999999" BorderStyle="Solid" 
              BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" 
              GridLines="Both" Font-Size="Smaller">
           <FooterStyle BackColor="#CCCCCC" />
           <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
          <headertemplate>
           <table width="100%">
           <tr>
           <td width="60%" style=" font-weight:bold; color:Blue">最新回复帖子：</td>
           
            </tr>
            </table>
            </headertemplate>
           <ItemStyle BackColor="White" />
          <ItemTemplate>
              <table style="width:100%;">
                  <tr>
                      <td width="60%">
                          <a href="subpages/Show_Article.aspx?id=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "title")%></a></td>
                      
                  </tr>
              </table>
          </ItemTemplate>
           <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
      </asp:DataList>
      </td>
      </tr>
      </table>

      <asp:DataList ID="DDL论坛版块" runat="server" RepeatColumns="1" 
          DataSourceID="SqlDataSource1" Width="100%" 
          onselectedindexchanged="DDL论坛版块_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" 
          >
          <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <ItemTemplate>
          <table width="100%" border="0">
  <tr>
     
    <td width="15%" height="100" rowspan="2">
        <asp:Image ID="Image1" runat="server" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "forumpic")%>'/> </td>
    <td width="50%" height="49" > 
        <asp:LinkButton ID="lb论坛版块" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "forumname")%>' CommandName="lb_forumname" OnClick="lb论坛版块_Click"></asp:LinkButton></td>
    <td width="40%" height="100" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="49" ><%#DataBinder.Eval(Container.DataItem, "forumintro")%></td>
  </tr>
  <br />
</table>

          </ItemTemplate>
          <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
      </asp:DataList>
    
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:BBS-ZhangConnectionString %>" 
          SelectCommand="SELECT * FROM [Forum]"></asp:SqlDataSource>
    
  </div>
  <div class="links" style="border:2px #000000 solid;">
    <ul>
    <br />
      <li>友情链接：</li>
      <li><a href="http://sports.sina.com.cn/" target="_blank">新浪体育</a></li>
      <li><a href="http://sports.163.com/" target="_blank">网易体育</a></li>
      <li><a href="http://sports.qq.com/" target="_blank">腾讯体育</a></li>
      <li><a href="http://www.hupu.com/" target="_blank">虎扑体育</a></li>
      <li><a href="http://bbs.hupu.com/" target="_blank">虎扑论坛</a></li>
      <li><a href="http://www.zhibo8.cc/" target="_blank">直播吧</a></li>
      <li><a href="http://www.fengyunzhibo.com/" target="_blank">风云直播</a></li>
      <li><a href="http://china.nba.com/index.html?gr=www" target="_blank">NBA中文官网</a></li>
      <li><a href="http://www.fernandoalonso.com/" target="_blank">阿隆索官网</a></li>
      <li><a href="http://sports.3g.cn/sport3g.php?cin=306&amp;lt=nav&amp;sid=&amp;wid=&amp;waped=9&amp;pvs=" target="_blank">3G门户体育</a></li>
    </ul>
  </div>
  <div class="footer" style="border:2px #000000 solid;">
    <div align="center">
      <ul>
        <li>Powered by Visual Studio</li>
        <li>Copyright(C) 2014 Sports BBS</li>
      </ul>
    </div>
  </div>
</div>
    </form>
</body>
</html>
