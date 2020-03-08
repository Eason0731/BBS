using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using System.Data.SqlClient;
using MySql.Data.MySqlClient;

public partial class subpages_Show_Article : System.Web.UI.Page
{
    SqlData da = new SqlData();
    protected void Page_Load(object sender, EventArgs e)
    {

        ShowComments();
        
        if (!IsPostBack)
        {
            
            BackPage();
            //txt内容.Attributes.Add("readonly", "true");
            //DataSet ds = da.datesetExecute("select * from Posts where id='" + Request["id"] + "'", "Posts");
            //DataSet ds = da.datesetExecute("select * from Posts join Users on Posts.username=Users.username where Posts.id='" + Request["ID"] + "'", "Posts");
            DataSet ds = da.datesetExecute("select a.id,a.title,a.class,a.content,a.username,a.time,a.type,a.remark,a.zhiding,a.good,a.bad,b.password,b.sex,b.age,b.career,b.youxiang,b.usergroup,b.intro,b.iconpath,b.jifen from Posts a join Users b on a.username=b.username where a.id='" + Request["ID"] + "'", "Posts");
            DataTable dt = ds.Tables["Posts"];
            foreach (DataRow dr in dt.Rows)
            {
                //TypeHiddenField1.Value = dr["ID"].ToString();//将帖子id保存到隐藏的控件中
                //TypeHiddenField2.Value = dr["ID1"].ToString();//将用户id保存到隐藏的控件中
                lbl分类.Text = dr["class"].ToString();
                lblType.Text = dr["type"].ToString();
                lblTitle.Text = dr["title"].ToString();
                
                lbl作者.Text = dr["username"].ToString();
                lbl发布时间.Text = dr["time"].ToString();
                lbl帖子内容.Text= dr["content"].ToString();
                lbl备注.Text = dr["remark"].ToString();
                IM楼主.ImageUrl = dr["iconpath"].ToString();
                lbl赞.Text = dr["good"].ToString();
                lbl踩.Text = dr["bad"].ToString();
                //TypeHiddenField1.Value = dr["class"].ToString();//将帖子类型保存到隐藏的控件中
            }
            lb编辑.Visible = false;
            LB删除.Visible = false;
            LB置顶.Visible = false;
            LB解除置顶.Visible = false;

            /*将数据表查询的结果显示到Datalist控件中，显示评论*/


            //LinkButton a=((LinkButton)DaraList评论.Items[0].FindControl("Lb删除本楼"));
           


        }
        lbl帖子内容.Text = lbl帖子内容.Text.Replace("&nbsp", "<br/>");
        /*取出Datalist控件中的Linkbutton按钮*/
       
        /*取出Datalist控件中的Linkbutton按钮*/
        //string strComment = "select * from Comments where postid ='" + Request["id"] + "'";
       
       
        /*将数据表查询的结果显示到Datalist控件中，显示评论*/


        this.Title = lblTitle.Text;

        if (Session["name"] == null)
        {
            //txt评论.Enabled = false;
            txt评论.EnableViewState = false;
            btn评论.Enabled = false;
            lb编辑.Visible = false;
            //LBDel.Visible = false;
            lbl赞.Visible = false;
            lbl踩.Visible = false;
            LinkButton4.Visible = false;
            LinkButton5.Visible = false;
        }

        else if (Session["usergroup"].ToString() == "禁言用户")
        {
            //txt评论.Enabled = false;
            txt评论.EnableViewState = false;
            btn评论.Enabled = false;
            lb编辑.Visible = false;
            //LBDel.Visible = false;
        }

        else if (Session["usergroup"].ToString() == "管理员")
        {
            lb编辑.Visible = true;
            LB删除.Visible = true;
            LB置顶.Visible = true;
            LB解除置顶.Visible = true;
        }

        else
        {
            switch (lblType.Text)
            {

                case "篮球":
                    if (Session["usergroup"].ToString() == "篮球区版主")
                    {
                        lb编辑.Visible = true;
                        LB删除.Visible = true;
                        //LBDel.Visible = true;
                    }
                    break;

                case "足球":
                    if (Session["usergroup"].ToString() == "足球区版主")
                    {
                        lb编辑.Visible = true;
                        LB删除.Visible = true;
                        //LBDel.Visible = true;
                    }
                    break;

                case "赛车":
                    if (Session["usergroup"].ToString() == "赛车区版主")
                    {
                        lb编辑.Visible = true;
                        LB删除.Visible = true;
                        //LBDel.Visible = true;
                    }
                    break;

                case "灌水":
                    if (Session["usergroup"].ToString() == "灌水区版主")
                    {
                        lb编辑.Visible = true;
                        LB删除.Visible = true;
                        //LBDel.Visible = true;
                    }
                    break;
            }

        }

    }


   protected void ShowComments() 
    {
        /*DataList评论区域，Comments评论表连接Users表显示用户头像*/
        int current_page = Convert.ToInt32(lblCurrent.Text);
        MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Con"].ConnectionString);

        //string sqlcommd = "SET @rowno = 1;Select @rowno:=@rowno+1 as rowno,Comments.*,Users.iconpath from Comments join Users on Comments.username=Users.username where postid ='" + Request["ID"] + "' order by time asc;";
        //MySqlDataAdapter oda = new MySqlDataAdapter(sqlcommd, con);
        
        MySqlDataAdapter oda = new MySqlDataAdapter("Select Comments.*,Users.iconpath from Comments join Users on Comments.username=Users.username where postid ='" + Request["ID"] + "' order by time asc;", con);
        //SQL Server 语句: select ROW_NUMBER() over (order by [time]) +1 as floorid,* from Comments join Users on Comments.username=Users.username where postid ='" + Request["id"] + "' order by [time] asc
        DataSet ds = new DataSet();
        oda.Fill(ds);
        /*DataList评论区域，Comments评论表连接Users表显示用户头像*/

        /*显示评论楼层*/
        ds.Tables[0].Columns.Add("Floor");
        int i = 1;
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            i++;
            row["Floor"] = i.ToString();
        }
        /*显示评论楼层*/
        

        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = ds.Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 5;
        lblTotal.Text = ps.PageCount.ToString();
        ps.CurrentPageIndex = current_page - 1;
        lbtnFirst.Enabled = true;
        lbntUp.Enabled = true;
        lbtnDown.Enabled = true;
        lbtnLast.Enabled = true;
        
        if (current_page == 1)
        {
            lbtnFirst.Enabled = false;
            lbntUp.Enabled = false;
        }
        if (current_page == Convert.ToInt32(lblTotal.Text))
        {
            lbtnLast.Enabled = false;
            lbtnDown.Enabled = false;
        }

        DaraList评论.DataSource = ps;
        DaraList评论.DataBind();
    }
    


    protected void LB返回_Click(object sender, EventArgs e)
    {
        BackPage();
    }

    protected void btn评论_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        MySqlCommand mycommand = new MySqlCommand("", connection);
        mycommand.CommandText = "insert into Comments(content,username,time,postid) values('" + txt评论.Text + "','" + Session["name"].ToString() + "','" + DateTime.Now.ToString() + "','" + Request["ID"] + "');";
        //mycommand.ExecuteNonQuery();
        mycommand.CommandText += "update Users set jifen=jifen+2 where username='" + Session["name"].ToString() + "';"; //发帖成功加5分
        mycommand.ExecuteNonQuery();
        Response.Write("<script>alert('评论成功！');window.location.href=window.location.href;</script>");

     

    }

    protected void lb编辑_Click(object sender, EventArgs e)
    {

        Response.Redirect("Update_Posts.aspx?id="+Request.QueryString["id"]+"");
    }
    protected void LB删除_Click(object sender, EventArgs e)
    {
        da.ExecuteSQL("update Users set jifen=jifen-5 where username='" + lbl作者.Text + "'");
        da.ExecuteSQL("delete from Posts where id=" + Request.QueryString["id"].ToString() + "");

        
        switch (lblType.Text)
        {
            case "公告":
                Response.Write("<script>alert('删除成功！');window.location.href='forum_notice/Notice_Index.aspx'</script>");
                break;

            case "足球":
                Response.Write("<script>alert('删除成功！');window.location.href='forum_Football/Football_Index.aspx'</script>");
                break;

            case "篮球":
                Response.Write("<script>alert('删除成功！');window.location.href='forum_Basketball/Basketball_Index.aspx'</script>");
                break;

            case "赛车":
                Response.Write("<script>alert('删除成功！');window.location.href='forum_racing/Racing_Index.aspx'</script>");
                break;

            case "灌水":
                Response.Write("<script>alert('删除成功！');window.location.href='forum_chating/Chating_Index.aspx'</script>");
                break;

        }
       
        



    }



    protected void BackPage()
    {
        switch (lblType.Text)
        {
            case "公告":
                Response.Redirect("forum_notice/Notice_Index.aspx");
                break;

            case "足球":
                Response.Redirect("forum_Football/Football_Index.aspx");
                break;

            case "篮球":
                Response.Redirect("forum_Basketball/Basketball_Index.aspx");
                break;

            case "赛车":
                Response.Redirect("forum_Racing/Racing_Index.aspx");
                break;

            case "灌水":
                Response.Redirect("forum_chating/Chating_Index.aspx");
                break;

        }

    }

   

    protected void Button1_Command(object sender, CommandEventArgs e)
    {
       
        string id = e.CommandArgument.ToString(); //评论表（Comments）的ID
        string pinglunren = e.CommandName.ToString();
        if (Session["name"]!= null)
        {
            if (Session["usergroup"].ToString() == "管理员" || (Session["usergroup"].ToString() == "足球区版主" && lblType.Text == "足球") || (Session["usergroup"].ToString() == "篮球区版主" && lblType.Text == "篮球") || (Session["usergroup"].ToString() == "赛车区版主" && lblType.Text == "赛车") || (Session["usergroup"].ToString() == "灌水区版主" && lblType.Text == "灌水"))
            {
            if (e.CommandName == "DeleteFloor")
            {


              
                    string strDel = "delete from Comments where id='" + id + "'";
                    MySqlDataReader dadel = da.ExecuteRead(strDel);
                    DaraList评论.DataSource = dadel;
                    DaraList评论.DataKeyField = "id";
                    DaraList评论.DataBind();
                    dadel.Close();
                    Response.Write("<script>alert('删除成功');window.location.href=window.location.href;</script>");
            

                }

                if (e.CommandName == "EditFloor")
                {
                    Response.Redirect("Update_Floor.aspx?id=" + id + "");
                }
            }
            else { Response.Write("<script>alert('您不是管理员或本区版主，无法进行此操作！');window.location.href=window.location.href;</script>"); }
            
            if(e.CommandName=="ReplyFloor")
            {
                Response.Redirect("Reply_Floor.aspx?id=" + id + "");
            }

          

        }
        else { Response.Write("<script>alert('您无权进行此操作！');window.location.href=window.location.href;</script>"); }
    }

    protected void LB置顶_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select * from Posts where zhiding=1 and id='" + Request.QueryString["id"] + "'";
        MySqlCommand mycommand = new MySqlCommand(str, connection);
        MySqlDataReader dr = mycommand.ExecuteReader();
        if (dr.Read())
        {
            
            dr.Close();
            Response.Write("<script>alert('该帖子已被置顶！');window.location.href=window.location.href;</script>");
        }

        else
        {
            connection.Close();
            connection.Open();
            string sql_zd = "update Posts set zhiding=1 where id='" + Request.QueryString["id"] + "'";
            MySqlDataReader sdr = da.ExecuteRead(sql_zd);
            Response.Write("<script>alert('置顶成功！');window.location.href=window.location.href;</script>");

        }
    }
    protected void LB解除置顶_Click(object sender, EventArgs e)
    {
        MySqlConnection connection = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString());
        connection.Open();
        string str = "select * from Posts where zhiding=1 and id='" + Request.QueryString["id"] + "'";
        MySqlCommand mycommand = new MySqlCommand(str, connection);
        MySqlDataReader dr = mycommand.ExecuteReader();
        if (dr.Read())
        {
            connection.Close();
            connection.Open();
            string sql_zd = "update Posts set zhiding=0 where id='" + Request.QueryString["id"] + "'";
            MySqlDataReader sdr = da.ExecuteRead(sql_zd);
            Response.Write("<script>alert('解除置顶成功！');window.location.href=window.location.href;</script>");

           
        }

        else
        {
            dr.Close();
            Response.Write("<script>alert('该帖子未被置顶！');window.location.href=window.location.href;</script>");
        }
    }


    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        lblCurrent.Text = "1";
        ShowComments();
    }
    protected void lbtnDown_Click(object sender, EventArgs e)
    {
        lblCurrent.Text = (Convert.ToInt32(lblCurrent.Text) + 1).ToString();
        ShowComments();
    }
    protected void lbntUp_Click(object sender, EventArgs e)
    {
        lblCurrent.Text = (Convert.ToInt32(lblCurrent.Text) - 1).ToString();
        ShowComments();
    }
    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        lblCurrent.Text = lblTotal.Text;
        ShowComments();
    }

    //protected void ShowComments() //原显示评论的方法，因需要分页，注释
    //{
    //    /*DataList评论区域，Comments评论表连接Users表显示用户头像*/
    //    string strComment = "select * from Comments join Users on Comments.username=Users.username where postid ='" + Request["id"] + "' order by [time] asc";
    //    SqlDataReader dar = da.ExecuteRead(strComment);
    //    DaraList评论.DataSource = dar;
    //    DaraList评论.DataKeyField = "id";
    //    DaraList评论.DataBind();
    //    dar.Close();
    //    /*DataList评论区域，Comments评论表连接Users表显示用户头像*/
    //}

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        string sqlstring = "update Posts set good=good+1 where id='"+ Request.QueryString["id"]+"'";
        MySqlDataReader sdr = da.ExecuteRead(sqlstring);
        Response.Write("<script>window.location.href=window.location.href;</script>");
         //赞+1
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        string sqlstring = "update Posts set bad=bad+1 where id='" + Request.QueryString["id"] + "'";
        MySqlDataReader sdr = da.ExecuteRead(sqlstring); //踩+1
        Response.Write("<script>window.location.href=window.location.href;</script>");
    }
}