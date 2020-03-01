using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_forum_manage_update_forum : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Forum where id='" + Request["id"] + "'", "Forum");
            DataTable dt = ds.Tables["Forum"];
            foreach (DataRow dr in dt.Rows)
            {
                txt版块名.Text = dr["forumname"].ToString();
                txt版块简介.Text = dr["forumintro"].ToString();
                IM显示图片.ImageUrl = dr["forumpic"].ToString();
            }
        }
    }
    protected void btn更新_Click(object sender, EventArgs e)
    {
        string sqlstring = " UPDATE Forum SET forumname= '" + txt版块名.Text + "', forumintro = '" + txt版块简介.Text + "' WHERE ID = '" + Request.QueryString["id"] + "'";
        SqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>alert('修改版块成功！');location.href='forumA-manage.aspx';</script>");
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt版块名.Text = "";
        txt版块简介.Text = "";
    }
}