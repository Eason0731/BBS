using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class admin_sportsevents_manage_add_sportsevents : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn新增_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select * from Sports_Event where eventname='" + txt项目名.Text + "'";
        SqlCommand mycommand = new SqlCommand(str, connection);
        
        SqlDataReader dr = mycommand.ExecuteReader();
        if (dr.Read())
        {
            dr.Close();
            Response.Write("<script>alert('该运动项目已经存在！');window.location.href=window.location.href;;</script>");
        }

        else
        {
            connection.Close();
            connection.Open();
            mycommand.CommandText = "insert into Sports_Event(eventname,eventintro) values('" + txt项目名.Text + "','" + txt项目介绍.Text + "')";
            mycommand.ExecuteNonQuery();
            
            Response.Write("<script>alert('添加成功！');location.href='sportsevents-manage.aspx';</script>");
        }
        connection.Close();
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt项目名.Text = "";
        txt项目介绍.Text = "";
    }
   
    
}