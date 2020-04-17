using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using MySql_Try;

public partial class index : System.Web.UI.Page
{
    SqlData da = new SqlData();
    string usergroup;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["name"] == null)
        {
            lbl显示.Text = "未登录状态！";
            lb注销.Visible = false;
            lb个人信息.Visible = false;
            lb后台管理.Visible = false;
            lbl积分.Visible = false;
            Label1.Visible = false;
            
           
        }

        else if (Session["name"].ToString() == "admin") 
        {
            lbl显示.Text = Session["name"] + ",你好！";
            lb登录.Visible = false;
            lb注册.Visible = false;
            lb后台管理.Visible = true;
            lbl积分.Visible = true;
            Label1.Visible = true;

            /*显示用户组别的语句*/
            DataSet ds = da.datesetExecute("select * from Users where username='" + Session["name"].ToString() + "'", "Users");
            DataTable dt2 = ds.Tables["Users"];
            foreach (DataRow dr in dt2.Rows)
            {
                usergroup=dr["usergroup"].ToString();
                lbl积分.Text = dr["jifen"].ToString();
                Session["userid"] = dr["id"].ToString();
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
            lb登录.Visible = false;
            lb注册.Visible = false;
            lb后台管理.Visible = false;
            lbl积分.Visible = true;
            Label1.Visible = true;

            
            DataSet ds = da.datesetExecute("select * from Users where username='" + Session["name"].ToString() + "'", "Users");
            DataTable dt2 = ds.Tables["Users"];
            foreach (DataRow dr in dt2.Rows)
            {
                /*读取到数据表中usergroup（用户分类组）的值取出
                  并根据用户所在的组,定义为不同的用户组*/
                
                usergroup=dr["usergroup"].ToString();
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

        Session["usergroup"] = usergroup;


        for (int i = 0; i < this.DDL论坛版块.Items.Count; i++)
        {
            LinkButton lb_forumname = (LinkButton)this.DDL论坛版块.Items[0].FindControl("lb论坛版块");
        }

        /*显示最新帖子和最新回复的方法*/
        string sql1 = "select * from Posts order by time desc limit 6 "; //最新帖子,MySQL limit 6 = top 6
        MySqlDataReader dr_newpost = da.ExecuteRead(sql1);
        DDL最新帖子.DataSource = dr_newpost;
        DDL最新帖子.DataKeyField = "id";
        DDL最新帖子.DataBind();
        dr_newpost.Close();

        
        string sql2 = "select Comments.username As HFYH,Comments.time As HFSJ,Posts.* from Posts join Comments on Posts.ID=Comments.postid order by HFSJ desc limit 6"; //最新回复
        //SQL Server语法为：select top 6 Comments.username As HFYH,Comments.time As HFSJ,* from Posts join Comments on Posts.ID=Comments.postid order by HFSJ desc 
        MySqlDataReader dr_newcommand = da.ExecuteRead(sql2);
        DDL最新回复.DataSource = dr_newcommand;
        DDL最新回复.DataKeyField = "id";
        DDL最新回复.DataBind();
        dr_newpost.Close();
        
    }

    protected void lb登录_Click(object sender, EventArgs e)
    {
        Response.Redirect("subpages/login.aspx");
    }
    protected void lb注册_Click(object sender, EventArgs e)
    {
        Response.Redirect("subpages/register.aspx");
    }
    protected void lb注销_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Write("<script>alert('退出登录成功！');location.href='index.aspx';</script>");
        
    }
   
    protected void lb后台管理_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin/admin-index.aspx");
    }
    protected void lb个人信息_Click(object sender, EventArgs e)
    {
        Response.Redirect("subpages/personal-info.aspx");
    }


    /*以下两个方法的作用：因Datalist控件无法直接将控件中的Linkbutton控件调用，以下的两个方法是先找到Linkbutton后，再调用*/
    //protected void DDL论坛版块_ItemCommand(object source, DataListCommandEventArgs e)
    //{
    //    if (e.CommandName == "lb_forumname")
    //    {
    //        myEevent(source, e);
    //    }
    //}

    //private void myEevent(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    //{

    //    LinkButton lb论坛版块 = (LinkButton)e.Item.FindControl("lb论坛版块");
    //    //string forumname = lb论坛版块.Text;
        
    //}


   
    protected void DDL论坛版块_SelectedIndexChanged(object sender, EventArgs e)
    {
        LinkButton myT = (LinkButton)DDL论坛版块.Items[DDL论坛版块.SelectedIndex].FindControl("lb论坛版块");
        string a = myT.Text; 
    }

    protected void lb论坛版块_Click(object sender, EventArgs e)
    {
        LinkButton myT = (LinkButton)sender;
        string a = myT.Text;

        switch (a)
        {
            case "公告发布区":
            Response.Redirect("subpages/forum_notice/Notice_Index.aspx");
            break;

            case "绿茵场":
            Response.Redirect("subpages/forum_football/Football_Index.aspx");
            break;

            case "篮球场":
            Response.Redirect("subpages/forum_basketball/basketball_index.aspx");
            break;

            case "赛车场":
            Response.Redirect("subpages/forum_racing/racing_index.aspx");
            break;

            case "灌水天地":
            Response.Redirect("subpages/forum_chating/chating_index.aspx");
            break;
        }
    }

    /*以上两个方法的作用：因Datalist控件无法直接将控件中的Linkbutton控件调用，以上的两个方法是先找到Linkbutton后，再调用*/

  

    
}
    

    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
        
    //}

