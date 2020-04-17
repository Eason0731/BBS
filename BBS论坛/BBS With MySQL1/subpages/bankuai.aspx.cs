using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Data;

public partial class subpages_bankuai : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dt = DateTime.Now;
        lbl时间.Text = "今天是：" + dt.ToLongDateString().ToString() + "，" + "现在是北京时间：" + dt.ToLongTimeString().ToString();
        if (!IsPostBack)
        {
            Userpermission();
            Readpermission();

        }
    }

    protected void Readpermission()
    {
        try
        {
            lbl阅读权限.Visible = false;
            DataSet ds = da.datesetExecute("select * from Users where username='" + Session["name"].ToString() + "'", "Users");
            DataTable dt2 = ds.Tables["Users"];
            foreach (DataRow dr in dt2.Rows)
            {
                lbl阅读权限.Text = dr["authority"].ToString();
            }

            double a;
            a = double.Parse(lbl阅读权限.Text);

            if (a <= 0)
            {
                Response.Write("<script>alert('您的账号的阅读权限不足0，请联系网站管理员进行解封！');location.href='boards.aspx';</script>");
            }

            if (a != 5000)
            {
                btn发帖.Visible = false;
            }
        }
        catch
        {
            Userpermission();
        }
    }

    protected void Userpermission()
    {
        if (Session["name"] == null)
        {
            Response.Write("<script>alert('对不起，你还没登录，现在返回首页！');location.href='../../index.aspx';</script>");
        }
        else
        {
            lbl用户.Text = Session["name"].ToString();
            lbl显示.Text = ",你好！";
        }
    }
}