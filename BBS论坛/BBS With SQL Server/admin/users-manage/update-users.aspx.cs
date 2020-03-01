using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_users_manage_update_users : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Users where id='" + Request["id"] + "'", "Users");
            DataTable dt = ds.Tables["Users"];
            foreach (DataRow dr in dt.Rows)
            {
                txt用户名.Text = dr["username"].ToString();
                txt密码.Text = dr["password"].ToString();
                ddl性别.Text = dr["sex"].ToString();
                txt年龄.Text = dr["age"].ToString();
                txt来自.Text = dr["location"].ToString();
                txt职业.Text = dr["career"].ToString();
                txt邮箱.Text = dr["youxiang"].ToString();
                ddl阅读权限.Text = dr["usergroup"].ToString();
            }
        }
    }
    protected void btn更新_Click(object sender, EventArgs e)
    {
        string sqlstring = " UPDATE Users SET username= '" + txt用户名.Text + "', password = '" + txt密码.Text + "', sex = '" + ddl性别.Text + "', age = '" + txt年龄.Text + "',location = '" + txt来自.Text + "',career = '" + txt职业.Text + "',youxiang = '" + txt邮箱.Text + "',usergroup='" + ddl阅读权限.Text + "' WHERE ID = '" + Request.QueryString["id"] + "'";
        SqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>alert('修改用户信息成功！');location.href='users-manage.aspx';</script>");
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt用户名.Text = "";
        txt密码.Text = "";
        ddl性别.Text = "";
        txt年龄.Text = "";
        txt来自.Text = "";
        txt职业.Text = "";
        txt邮箱.Text = "";
    }
}