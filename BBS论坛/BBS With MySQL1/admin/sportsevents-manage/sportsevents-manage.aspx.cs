using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sportsevents_manage_sportsevents_manage : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectBind();
        }
    }
    protected void SelectBind()
    {
        GridView1.DataSource = da.ExecuteDateSet("select * from Sports_Event");
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SelectBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        da.ExecuteSQL("delete from Sports_Event where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'");
        Response.Write("<script>alert('删除成功！');location.href='sportsevents-manage.aspx';</script>");
        SelectBind();
    }
}