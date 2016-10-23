using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public class SqlData
{
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataAdapter da;

    public SqlData()
    {
        con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        con.Open();
    }

    public SqlDataReader ExecuteRead(string str)
    {
        cmd = new SqlCommand(str, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        return sdr;
    }

    public DataSet ExecuteDateSet(string str)
    {
        cmd = new SqlCommand(str, con);
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    public bool ExecuteSQL(string str)
    {
        cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        return true;
    }

    public DataSet datesetExecute(string str, string tableName)
    {
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds, tableName);
            return ds;
    }
}