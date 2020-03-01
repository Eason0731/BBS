using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class subpages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn登录_Click(object sender, EventArgs e)
    {

        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select username from Users where username='" + txt用户名.Text + "'and password='" + txt密码.Text + "'";    //SQL语句将前台中TextBox中的存到数据库的字段中        
        SqlCommand cmd = new SqlCommand(str, connection);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["name"] = txt用户名.Text.Trim();
            Response.Redirect("../Index.aspx");
        }
        else
        {
            Response.Write("<script>alert('用户名或密码错误！');window.location.href=window.location.href;</script>");
        }
        connection.Close();

        
    }

    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt密码.Text = "";
        txt用户名.Text = "";
    }
}