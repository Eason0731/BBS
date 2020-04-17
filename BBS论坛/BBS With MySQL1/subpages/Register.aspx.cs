using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;

public partial class subpages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (CheckBox1.Checked == false) //用户已阅读注册协议的情况下,开放注册按钮
        {
            btn注册.Enabled = false;
        }
        else { btn注册.Enabled = true; }
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
            Response.Write("<script>alert('该用户名已被注册！');window.location.href=window.location.href;</script>");
        }

        else
        {
            connection.Close();
            connection.Open();
            string myIcon = "~" + "/" + "images" + "/" + "icons" + "/" + "default_icon.jpg";
            mycommand.CommandText = "insert into Users(username,password,sex,age,usergroup,iconpath,jifen) values('" + txt用户名.Text + "','" + txt密码.Text + "','" + ddl性别.Text + "','" + txt年龄.Text + "','普通用户','" + myIcon  + "','0')"; //MSSQL:'~\\images\\icons\\default_icon.jpg'
            mycommand.ExecuteNonQuery();
            Session["name"] = txt用户名.Text;
            Response.Write("<script>alert('注册成功！');window.location.href='../index.aspx';</script>");
        }
        connection.Close();

       
    }

    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt用户名.Text = "";
        txt密码.Text = "";
        ddl性别.Text = "";
        txt年龄.Text = "";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Page.RegisterClientScriptBlock("dd", "<script>window.open('Protocol.aspx','_blank','scrollbars=yes, menubar=no,resizable=yes,status=yes,toolbar=no,height=600,width=800,left='+(window.screen.availWidth-800)/2+',top='+(window.screen.availHeight-600)/2)</script>");
    }
}