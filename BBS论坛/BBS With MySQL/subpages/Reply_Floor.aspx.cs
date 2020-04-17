using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

public partial class subpages_Reply_Floor : System.Web.UI.Page
{
     SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Comments where id='" + Request["id"] + "'", "Reply");
            DataTable dt = ds.Tables["Reply"];
            foreach (DataRow dr in dt.Rows)
            {
                PostidHiddenField1.Value = dr["postid"].ToString();
                lbl作者.Text = dr["username"].ToString();
                lbl内容.Text=dr["content"].ToString();
            }
           
        }

        if (Session["usergroup"].ToString()== "禁言用户")
        {
            btn回复.Enabled=false;
        }
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Show_Article.aspx?id=" +PostidHiddenField1.Value + "");
    }
    protected void btn回复_Click(object sender, EventArgs e)
    {
        string sqlstring = "insert into Comments(content,username,time,postid,quote) values('" + txt评论.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','" + PostidHiddenField1.Value + "','引用" + lbl作者.Text + "发表的" + lbl内容.Text + "');";
        MySqlDataReader sdr = da.ExecuteRead(sqlstring);
        sdr.Close();
        string sqlstring2 = "update Users set jifen=jifen+2 where username='" + Session["name"].ToString() + "'";
        MySqlDataReader sdr2 = da.ExecuteRead(sqlstring2);
        Response.Write("<script>alert('评论成功');location.href='Show_Article.aspx?id=" + PostidHiddenField1.Value + "';</script>");

        
    }
}