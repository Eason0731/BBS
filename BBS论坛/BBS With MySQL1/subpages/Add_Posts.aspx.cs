using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
//using System.Data.SqlClient;

public partial class subpages_Add_Posts : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddl分类_公告.Visible = false;
            ddl分类_赛车.Visible = false;
            ddl分类_灌水.Visible = false;
            ddl分类_篮球.Visible = false;
            ddl分类_足球.Visible = false;
            RFV_公告.Visible = false;
            RFV_赛车.Visible = false;
            RFV_灌水.Visible = false;
            RFV_篮球.Visible = false;
            RFV_足球.Visible = false;
            lblType.Text = Session["type"].ToString();
          
        }
        switch (lblType.Text)
        {
            case "公告区":
                RFV_公告.Visible = true;
                ddl分类_公告.Visible = true;
                break;

            case "绿茵场":
                RFV_足球.Visible = true;
                ddl分类_足球.Visible = true;
                break;

            case "篮球场":
                RFV_篮球.Visible = true;
                ddl分类_篮球.Visible = true;
                break;

            case "赛车场":
                RFV_赛车.Visible = true;
                ddl分类_赛车.Visible = true;
                break;

            case "灌水区":
                RFV_灌水.Visible = true;
                ddl分类_灌水.Visible = true;
                break;
        }

        

       
    }
    protected void btn发表_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        MySqlCommand mycommand = new MySqlCommand("", connection);
        switch (lblType.Text)
        {
            case "公告区":
        mycommand.CommandText = "insert into Posts(title,class,content,username,time,type,zhiding,good,bad) values('" + txt标题.Text + "','" + ddl分类_公告.Text + "','" + txt内容.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','公告','0','0','0')";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('发布帖子成功！（公告区）');location.href='forum_Notice/Notice_Index.aspx';</script>");
                break;

            case "绿茵场":
                mycommand.CommandText = "insert into Posts(title,class,content,username,time,type,zhiding,good,bad) values('" + txt标题.Text + "','" + ddl分类_足球.Text + "','" + txt内容.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','足球','0','0','0')";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('发布帖子成功！（绿茵场）');location.href='forum_Football/Football_Index.aspx';</script>");
                break;

            case "篮球场":
                mycommand.CommandText = "insert into Posts(title,class,content,username,time,type,zhiding,good,bad) values('" + txt标题.Text + "','" + ddl分类_篮球.Text + "','" + txt内容.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','篮球','0','0','0')";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('发布帖子成功！（篮球场）');location.href='forum_basketball/Basketball_Index.aspx';</script>");
                break;

            case "赛车场":
                mycommand.CommandText = "insert into Posts(title,class,content,username,time,type,zhiding,good,bad) values('" + txt标题.Text + "','" + ddl分类_赛车.Text + "','" + txt内容.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','赛车','0','0','0')";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('发布帖子成功！（赛车场）');location.href='forum_Racing/Racing_Index.aspx';</script>");
                break;

            case "灌水区":
                mycommand.CommandText = "insert into Posts(title,class,content,username,time,type,zhiding,good,bad) values('" + txt标题.Text + "','" + ddl分类_灌水.Text + "','" + txt内容.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','灌水','0','0','0')";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('发布帖子成功！（灌水区）');location.href='forum_Chating/Chating_Index.aspx';</script>");
                break;
        }
        mycommand.CommandText = "update Users set jifen=jifen+5 where username='" + Session["name"].ToString() + "'"; //发帖成功加5分
        mycommand.ExecuteNonQuery();
    }

    protected void btn重置_Click(object sender, EventArgs e)
    {

        txt标题.Text = "";
        txt内容.Text = "";
    }

    protected void lb返回_Click(object sender, EventArgs e)
    {
        switch (lblType.Text)
        {
            case "公告区":
                Response.Redirect("forum_Notice/Notice_Index.aspx");
                break;

            case "绿茵场":
                Response.Redirect("forum_Football/Football_Index.aspx");
                break;

            case "篮球场":
                Response.Redirect("forum_Basketball/Basketball_Index.aspx");
                break;

            case "赛车场":
                Response.Redirect("forum_Racing/Racing_Index.aspx");
                break;

            case "灌水区":
                Response.Redirect("forum_Chating/Chating_Index.aspx");
                break;
        }
    }
}