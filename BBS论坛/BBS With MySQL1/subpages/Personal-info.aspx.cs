using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class subpages_Personal_info : System.Web.UI.Page
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
        GridView1.DataSource = da.ExecuteDateSet("select * from Users where username ='" + Session["name"].ToString() + "'");
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
    }
}