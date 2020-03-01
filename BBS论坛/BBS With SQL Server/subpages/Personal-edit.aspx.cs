using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class subpages_Personal_edit : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = da.datesetExecute("select * from Users where id='" + Request["id"] + "'", "Users");
            DataTable dt = ds.Tables["Users"];
            foreach (DataRow dr in dt.Rows)
            {
                lbl用户名.Text = Session["name"].ToString();
                txt密码.Text = dr["password"].ToString();
                ddl性别.Text = dr["sex"].ToString();
                txt年龄.Text = dr["age"].ToString();
                txt来自.Text = dr["location"].ToString();
                txt职业.Text = dr["career"].ToString();
                txt邮箱.Text = dr["youxiang"].ToString();
                txt个人简介.Text = dr["intro"].ToString();
            }
            this.Image1.Visible = false;
        }
    }

    protected void btn更新_Click(object sender, EventArgs e)
    {
        string sqlstring = " UPDATE Users SET  password = '" + txt密码.Text + "', sex = '" + ddl性别.Text + "', age = '" + txt年龄.Text + "',location = '" + txt来自.Text + "',career = '" + txt职业.Text + "',youxiang = '" + txt邮箱.Text + "',intro='"+txt个人简介.Text+"' WHERE ID = '" + Request.QueryString["id"] + "'";
        SqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>alert('修改个人信息成功！');window.location.href=window.location.href;</script>");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("personal-info.aspx");
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
            string savapath = Server.MapPath("..\\images\\icons");//图片保存到文件夹下
            this.FileUpload1.PostedFile.SaveAs(savapath + "\\" + name);//保存路劲
            this.Image1.Visible = true;
            this.Image1.ImageUrl = "~"+"/"+"images"+"/"+"icons"+"/"+ name; //界面显示图片

            string sql = "update Users Set iconpath='~\\images\\icons\\" + name + "' WHERE ID = '" + Request.QueryString["id"] + "'";
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