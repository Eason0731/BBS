using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
//using System.Data.SqlClient;

public partial class subpages_Search : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
       {
          
           
       }

       //开始日期Calendar.Visible = false;
       //结束日期Calendar.Visible = false;
    }
    protected void btn搜索_Click(object sender, EventArgs e)
    {

        SelectBind();
   
        
    }

    protected void SelectBind()
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        MySqlCommand mycommand = new MySqlCommand("", connection);
        mycommand.CommandText = "select * from Posts where 1>0";
        if (txt搜素内容.Text != "")
        {
            mycommand.CommandText += " and title like '%" + txt搜素内容.Text + "%' or content like '%" + txt搜素内容.Text + "%'";
        }
        if (txt作者.Text != "")
        {
            mycommand.CommandText += " and username like '%" + txt作者.Text + "%'"; //SQL Server = " and username like '%'+'" + txt作者.Text + "'+'%'";
        }
        if( ddl板块.Text!="")
        {
            mycommand.CommandText += " and type = '"+ddl板块.Text+"'";
        }

       if(KSRQ.Text!="")
       {
           mycommand.CommandText+=" and time>='"+KSRQ.Text+"'";
       }

       if (JSRQ.Text != "")
       {
           mycommand.CommandText += " and time<='" + JSRQ.Text + "'";
       }
        
        GridView1.DataSource = da.ExecuteDateSet(mycommand.CommandText);
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();

       

    }



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SelectBind();
    }

   
}