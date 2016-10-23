using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class subpages_Sports_Event : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        string strxm1 = "select * from Sports_Event";
        SqlDataReader dr = da.ExecuteRead(strxm1);
        DataList1.DataSource = dr;
        DataList1.DataKeyField = "id";
        DataList1.DataBind();
        dr.Close();

        
    }
}