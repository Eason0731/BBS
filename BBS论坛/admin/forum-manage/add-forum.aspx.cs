using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_forum_manage_add_forum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn新增_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select * from Forum where forumname='" + txt版块名.Text + "'";
        SqlCommand mycommand = new SqlCommand(str, connection);
        SqlDataReader dr = mycommand.ExecuteReader();
        if (dr.Read())
        {
            dr.Close();
            Response.Write("<script>alert('该版块名已存在！');location.href='add-forum.aspx';</script>");
        }

        else
        {
            connection.Close();
            connection.Open();
            mycommand.CommandText = "insert into Forum(forumname,,forumintro) values('" + txt版块名.Text + "','" + txt版块简介.Text + "')";
            mycommand.ExecuteNonQuery();
            Response.Write("<script>alert('添加成功！');location.href='forumA-manage.aspx';</script>");
        }
        connection.Close();

        txt版块名.Text = "";
        txt版块简介.Text = "";
       
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt版块名.Text = "";
        txt版块简介.Text = "";
       
    }
}