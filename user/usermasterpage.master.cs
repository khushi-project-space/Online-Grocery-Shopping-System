using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class user_usermasterpage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentPage = Request.Url.AbsolutePath.ToLower();

        if (currentPage.EndsWith("home.aspx"))
        {
            ho.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("menu1.aspx"))
        {
            me.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("about.aspx"))
        {
            ab.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("feedback.aspx"))
        {
            fee.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("profile.aspx"))
        {
            pro.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("cart.aspx"))
        {
            c.Attributes.Add("class", "active");
        }
        try
        {
            if (Session["username"] != null)
            {
                Label1.Text = Session["username"].ToString();
                Button2.Visible = false;
                Button1.Visible = true;
            }
            else
            {
                //Label1.Text = "Login here->";
                Button2.Visible = true;
                Button1.Visible = false;
            }
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.Redirect("profile.aspx");
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("login.aspx");
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Response.Redirect("home.aspx");
            Label1.Text = "you have logout successfully..";
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Response.Redirect("cart.aspx");
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something went wrong please do the process again");
        }
    }
}
