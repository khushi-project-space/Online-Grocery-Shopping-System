using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class user_feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
  
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    txtfnm.Text = Session["username"].ToString();
                }
                else if (Session["username"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Response.Write("<script language='javascript'>alert('Without login you are not allow to give feddback');</script>");  // Default value if session is empty
                }
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
  
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {

            string str = txtfnm.Text;
            string c;
            if (RadioButtonList1.SelectedIndex == 0)
            {
                c = "Excellent";
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                c = "Very Good";
            }
            else if (RadioButtonList1.SelectedIndex == 3)
            {
                c = "Average";
            }
            else
            {
                c = "no selected";
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Feedback_info values('" + str + "','" + txtfeed.Text + "','" + c + "')", con);
            cmd.ExecuteNonQuery();
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Thank You for feedback..";
            con.Close();
        }
        catch (SqlException ex)
        {
            Response.Write("Database Error:" + ex.Message+"means your data...");
        }
        catch (Exception ex)
        {
            Response.Write("An error occurred:" + ex.Message);
        }
    }
}