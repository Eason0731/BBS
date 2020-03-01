using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subpages_Sports_News : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        SelectBind();
    }

    protected void SelectBind()
    {
        GridView1.DataSource = da.ExecuteDateSet("select top 8 * from Posts where class like'%新闻%' order by time desc");
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
    }

}