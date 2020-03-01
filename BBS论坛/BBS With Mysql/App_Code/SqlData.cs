using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;

public class SqlData
{
    private MySqlConnection con;
    private MySqlCommand cmd;
    private MySqlDataAdapter da;

    public SqlData()
    {
        //string connStr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString; //获取MySql数据库连接字符串
        //con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Con"].ConnectionString);
        //con.Open();

        string connStr = ConfigurationManager.ConnectionStrings["Con"].ConnectionString; //获取MySql数据库连接字符串
        con = new MySqlConnection(connStr); //数据库连接
        con.Open();
    }

    public MySqlDataReader ExecuteRead(string str)
    {
        cmd = new MySqlCommand(str, con);
        MySqlDataReader sdr = cmd.ExecuteReader();
        return sdr;
    }

    public DataSet ExecuteDateSet(string str)
    {
        cmd = new MySqlCommand(str, con);
        da = new MySqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    public bool ExecuteSQL(string str)
    {
        cmd = new MySqlCommand(str, con);
        cmd.ExecuteNonQuery();
        return true;
    }

    public DataSet datesetExecute(string str, string tableName)
    {
            MySqlDataAdapter da = new MySqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            da.Fill(ds, tableName);
            return ds;
    }
}