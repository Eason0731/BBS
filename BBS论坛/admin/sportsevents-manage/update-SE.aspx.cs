using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_sportsevents_manage_update_SE : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Sports_Event where id='" + Request["id"] + "'", "Events");
            DataTable dt = ds.Tables["Events"];
            foreach (DataRow dr in dt.Rows)
            {
                txt项目名.Text = dr["eventname"].ToString();
                txt项目介绍.Text = dr["eventintro"].ToString();
            }
            this.Image1.Visible = false;
        }
    }

    protected void btn更新_Click(object sender, EventArgs e)
    {
        string sqlstring = " UPDATE Sports_Event SET eventname= '" + txt项目名.Text + "', eventintro = '" + txt项目介绍.Text + "' WHERE ID = '" + Request.QueryString["id"] + "'";
        SqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>alert('修改体育项目成功！');location.href='sportsevents-manage.aspx';</script>");
    }
    protected void btn重置_Click(object sender, EventArgs e)
    {
        txt项目名.Text = "";
        txt项目介绍.Text = "";
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());

        string fullname = FileUpload1.PostedFile.FileName;//获取图片物理地址
        FileInfo fi = new FileInfo(fullname);
        string name = fi.Name;//获取图片名称
        string type = fi.Extension;//获取图片类型

        if (type == ".jpg" || type == ".gif" || type == ".bmp" || type == ".png")
        {
            string savapath = Server.MapPath("..\\..\\images\\SE");//图片保存到文件夹下
            this.FileUpload1.PostedFile.SaveAs(savapath + "\\" + name);//保存路劲
            this.Image1.Visible = true;
            this.Image1.ImageUrl = "~" + "/" + "images" + "/" + "SE" + "/" + name; //界面显示图片

            string sql = "update Sports_Event Set images='~\\images\\SE\\" + name + "' WHERE ID = '" + Request.QueryString["id"] + "'";
            SqlCommand cmd = new SqlCommand(sql, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            this.label1.Text = "上传成功！";
        }
        else
        {
            this.label1.Text = "请选择正确格式的图片！";
        }
    }
}