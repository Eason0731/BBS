using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;

public partial class subpages_boards : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "留言板";
        if (Session["name"] == null)
        {
            Response.Write("<script>alert('匿名用户无法访问该页，请回主页登录！');location.href='../index.aspx';</script>");
        }
        
        if (!IsPostBack)
        {
            SelectBind();
            
        }
        

       


        
    }

    protected void btn提交_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "insert into Boards(username,class,title,content) values('" + Session["name"].ToString() + "','" + ddl分类.Text + "','" + txt标题名.Text + "','" + txt留言内容.Text + "')";
        MySqlCommand mycommand = new MySqlCommand(str, connection);
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('提交成功！');location.href='boards.aspx';</script>");
        connection.Close();

        ddl分类.Text = "";
        txt标题名.Text = "";
        txt留言内容.Text = "";
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        ddl分类.Text = "";
        txt标题名.Text = "";
        txt留言内容.Text = "";
    }

    protected void SelectBind()
    {

        GridView1.DataSource = da.ExecuteDateSet("select * from Boards where username ='" + Session["name"]+ "'");
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        da.ExecuteSQL("delete from Boards where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
        Response.Write("<script>alert('删除成功！');location.href='boards.aspx';</script>");
        SelectBind();
    }
    //((Label)Page.Master.FindControl("lbl用户")) 将母版页的控件名获取并调用，这里调用的是label控件
}