using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
////using System.Data.SqlClient;
using System.Data;

public partial class subpages_forum_football_Football_Index : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectBind();
            //GridView1.Columns[4].Visible = false;
          
        }
        if (Session["name"] == null)
        {
            ((Button)Page.Master.FindControl("Btn发帖")).Visible = false;


        }
        //if (Session["name"] == null)
        //{

        //    GridView1.Columns[4].Visible = false;
            
        //}

        //else if (Session["name"].ToString() == "admin")
        //{

        //    GridView1.Columns[4].Visible = true;
            
        //}

        //else if (Session["usergroup"].ToString() == "足球区版主")
        //{
        //    GridView1.Columns[4].Visible = true;
           
        //}
        
    }

    protected void SelectBind()
    {
        GridView1.DataSource = da.ExecuteDateSet("select * from Posts where type='足球' order by time desc");
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
    }


    //protected void btn发帖_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("addarticle_notice.aspx");
    //}
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        da.ExecuteSQL("delete from Posts where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
        Response.Write("<script>alert('删除成功！');</script>");
        SelectBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SelectBind();
    }
}