using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class subpages_MasterPage_Bankuai : System.Web.UI.MasterPage
{
    SqlData da = new SqlData();
    string usergroup;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
        {
            lbl显示.Text = "请你<a href='../login.aspx'>登录</a>或者<a href='../register.aspx'>注册</a>";
            lbl用户.Visible = false;
            lb个人信息.Visible = false;
            lb注销.Visible = false;
            lb后台管理.Visible = false;
            lbl积分.Visible = false;
            Label1.Visible = false;
        }

        else if (Session["name"].ToString() == "admin")
        {
            lbl显示.Text = Session["name"] + ",你好！";
            lb后台管理.Visible = true;
            lbl积分.Visible = true;
            Label1.Visible = true;

            /*显示用户组别的语句*/
            DataSet ds = da.datesetExecute("select * from Users where username='" + Session["name"].ToString() + "'", "Users");
            DataTable dt2 = ds.Tables["Users"];
            foreach (DataRow dr in dt2.Rows)
            {
                usergroup = dr["usergroup"].ToString();
                lbl积分.Text = dr["jifen"].ToString();

                switch (usergroup)
                {
                    case "管理员":
                        lbl用户分组.Text = "用户组：管理员";
                        break;

                }
            }
            /*显示用户组别的语句*/
        }
        else
        {
            lbl显示.Text = Session["name"] + ",你好！";
            lb后台管理.Visible = false;
            lbl积分.Visible = true;
            Label1.Visible = true;


            DataSet ds = da.datesetExecute("select * from Users where username='" + Session["name"].ToString() + "'", "Users");
            DataTable dt2 = ds.Tables["Users"];
            foreach (DataRow dr in dt2.Rows)
            {
                /*读取到数据表中usergroup（用户分类组）的值取出
                  并根据用户所在的组,定义为不同的用户组*/

                usergroup = dr["usergroup"].ToString();
                lbl积分.Text = dr["jifen"].ToString();
                switch (usergroup)
                {
                    //case "管理员":
                    //    lbl用户分组.Text = "用户组：管理员";
                    //    break;

                    case "普通用户":
                        lbl用户分组.Text = "用户组：普通用户";
                        break;

                    case "足球区版主":
                        lbl用户分组.Text = "用户组：足球区版主";
                        break;

                    case "篮球区版主":
                        lbl用户分组.Text = "用户组：篮球区版主";
                        break;

                    case "赛车区版主":
                        lbl用户分组.Text = "用户组：赛车区版主";
                        break;

                    case "灌水区版主":
                        lbl用户分组.Text = "用户组：灌水区版主";
                        break;

                    case "禁言用户":
                        lbl用户分组.Text = "用户组：禁言用户";
                        break;
                }

            }
            /*读取到数据表中usergroup（用户分类组）的值取出
             并根据用户所在的组,定义为不同的用户组*/
        }

        Session["usergroup"] = usergroup;//获取当前用户的用户组
        Session["Type"] = Page.Title.ToString(); //将网页标题作为Type类型，用于后续同一页面不同分类帖子的写入
    }

     protected void lb注销_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Write("<script>alert('退出登录成功！');location.href='../../index.aspx';</script>");
        
    }
    protected void lb个人信息_Click(object sender, EventArgs e)
    {
        Response.Redirect("../personal-info.aspx");
    }

    protected void lb后台管理_Click(object sender, EventArgs e)
    {
        Response.Redirect("../../admin/admin-index.aspx");
    }

    protected void btn发帖_Click(object sender, EventArgs e)
    {
        //switch(Session["Type"].ToString())
        //{
        //    case "公告区":
        //    Response.Redirect("../AddPosts_Notice.aspx");
        //    break;

        //    case "绿茵场":
        //    Response.Redirect("../AddPosts_Football.aspx");
        //    break;

        //    case "篮球场":
        //    Response.Redirect("../AddPosts_Basketball.aspx");
        //    break;

        //    case "赛车场":
        //    Response.Redirect("../AddPosts_Racing.aspx");
        //    break;

        //    case "灌水区":
        //    Response.Redirect("../AddPosts_Chating.aspx");
        //    break;

        //}

        Response.Redirect("../Add_Posts.aspx");
    }

}

