using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class subpages_Update_Posts : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Posts where id='" + Request["id"] + "'", "Tiezi");
            DataTable dt = ds.Tables["Tiezi"];
            foreach (DataRow dr in dt.Rows)
            {
                ddl分类_公告.Text = dr["class"].ToString();
                ddl分类_足球.Text = dr["class"].ToString();
                ddl分类_篮球.Text = dr["class"].ToString();
                ddl分类_赛车.Text = dr["class"].ToString();
                ddl分类_灌水.Text = dr["class"].ToString();
                txt标题.Text = dr["title"].ToString();
                txt内容.Text = dr["content"].ToString();
                TypeHiddenField1.Value = dr["type"].ToString();
                PostIDHiddenField1.Value = dr["ID"].ToString();

            }
            ddl分类_公告.Visible = false;
            ddl分类_赛车.Visible = false;
            ddl分类_灌水.Visible = false;
            ddl分类_篮球.Visible = false;
            ddl分类_足球.Visible = false;
            RFV_公告.Visible = false;
            RFV_赛车.Visible = false;
            RFV_灌水.Visible = false;
            RFV_篮球.Visible = false;
            RFV_足球.Visible = false;
            lblType.Text = Session["type"].ToString();
          
        }
        switch (TypeHiddenField1.Value)
        {
            case "公告":
                RFV_公告.Visible = true;
                ddl分类_公告.Visible = true;
                break;

            case "足球":
                RFV_足球.Visible = true;
                ddl分类_足球.Visible = true;
                break;

            case "篮球":
                RFV_篮球.Visible = true;
                ddl分类_篮球.Visible = true;
                break;

            case "赛车":
                RFV_赛车.Visible = true;
                ddl分类_赛车.Visible = true;
                break;

            case "灌水":
                RFV_灌水.Visible = true;
                ddl分类_灌水.Visible = true;
                break;
        }

        

       
    }
    protected void btn编辑_Click(object sender, EventArgs e)
    {
        //SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        MySqlCommand mycommand = new MySqlCommand("", connection);
        switch (TypeHiddenField1.Value)
        {
            case "公告":
                mycommand.CommandText = "UPDATE Posts SET title= '" + txt标题.Text + "', class = '" + ddl分类_公告.Text + "', content = '" + txt内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('修改帖子成功！（公告区）');location.href='Show_Article.aspx?id=" + PostIDHiddenField1.Value + "';</script>");
                break;

            case "足球":
                mycommand.CommandText = "UPDATE Posts SET title= '" + txt标题.Text + "', class = '" + ddl分类_足球.Text + "', content = '" + txt内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('修改帖子成功！（绿茵场）');location.href='Show_Article.aspx?id=" + PostIDHiddenField1.Value + "';</script>");
                break;

            case "篮球":
                mycommand.CommandText = "UPDATE Posts SET title= '" + txt标题.Text + "', class = '" + ddl分类_篮球.Text + "', content = '" + txt内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('修改帖子成功！（篮球场）');location.href='Show_Article.aspx?id=" + PostIDHiddenField1.Value + "';</script>");
                break;

            case "赛车":
                mycommand.CommandText = "UPDATE Posts SET title= '" + txt标题.Text + "', class = '" + ddl分类_赛车.Text + "', content = '" + txt内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('修改帖子成功！（赛车场）');location.href='Show_Article.aspx?id=" + PostIDHiddenField1.Value + "';</script>");
                break;

            case "灌水":
                mycommand.CommandText = "UPDATE Posts SET title= '" + txt标题.Text + "', class = '" + ddl分类_灌水.Text + "', content = '" + txt内容.Text + "', remark='本帖最后由" + Session["name"].ToString() + "在" + DateTime.Now.ToString() + "修改' WHERE ID = '" + Request.QueryString["id"] + "'";
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('修改帖子成功！（灌水区）');location.href='Show_Article.aspx?id=" + PostIDHiddenField1.Value + "';</script>");
                break;
        }
    }

    protected void btn重置_Click(object sender, EventArgs e)
    {

        txt标题.Text = "";
        txt内容.Text = "";
    }

    protected void lb返回_Click(object sender, EventArgs e)
    {
        //switch (lblType.Text)
        //{
        //    case "公告区":
        //        Response.Redirect("forum_Notice/Notice_Index.aspx");
        //        break;

        //    case "绿茵场":
        //        Response.Redirect("forum_Football/Football_Index.aspx");
        //        break;

        //    case "篮球场":
        //        Response.Redirect("forum_Basketball/Basketball_Index.aspx");
        //        break;

        //    case "赛车场":
        //        Response.Redirect("forum_Racing/Racing_Index.aspx");
        //        break;

        //    case "灌水区":
        //        Response.Redirect("forum_Chating/Chating_Index.aspx");
        //        break;
        //}
        Response.Redirect("Show_Article.aspx?id="+PostIDHiddenField1.Value+"");
    }

   
}