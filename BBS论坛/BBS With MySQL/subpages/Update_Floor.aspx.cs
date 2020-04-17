using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

public partial class subpages_Update_Floor : System.Web.UI.Page
{
     SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Comments where id='" + Request["id"] + "'", "Comments");
            DataTable dt = ds.Tables["Comments"];
            foreach (DataRow dr in dt.Rows)
            {
                PostidHiddenField1.Value = dr["postid"].ToString();
                txt编辑内容.Text = dr["Content"].ToString();
            }
           
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Show_Article.aspx?id=" +PostidHiddenField1.Value + "");
    }
    protected void btn更新_Click(object sender, EventArgs e)
    {
        string sqlstring = " UPDATE Comments SET Content= '" + txt编辑内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        MySqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>alert('编辑回复成功！');location.href='Show_Article.aspx?id=" + PostidHiddenField1.Value + "';</script>");

        
    }
}