using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;

public partial class admin_users_manage_add_users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn注册_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select * from Users where username='" + txt用户名.Text + "'";
        MySqlCommand mycommand = new MySqlCommand(str, connection);
        MySqlDataReader dr = mycommand.ExecuteReader();
        if (dr.Read())
        {
            dr.Close();
            Response.Write("<script>alert('该用户名已被注册！');location.href='add-users.aspx';</script>");
        }

        else
        {
            connection.Close();
            connection.Open();
            string myIcon = "~" + "/" + "images" + "/" + "icons" + "/" + "default_icon.jpg";
            mycommand.CommandText = "insert into Users(username,password,sex,age,usergroup,iconpath,jifen) values('" + txt用户名.Text + "','" + txt密码.Text + "','" + ddl性别.Text + "','" + txt年龄.Text + "','普通用户','" + myIcon + "','0')";
            mycommand.ExecuteNonQuery();
            Response.Write("<script>alert('添加成功！');location.href='users-manage.aspx';</script>");
        }
        connection.Close();

        txt用户名.Text = "";
        txt密码.Text = "";
        ddl性别.Text = "";
        txt年龄.Text = "";
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt用户名.Text = "";
        txt密码.Text = "";
        ddl性别.Text = "";
        txt年龄.Text = "";
    }
}