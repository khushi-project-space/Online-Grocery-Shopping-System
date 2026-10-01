using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
            Label1.Visible = false;
            Label2.Visible = false;
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
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from User_info where unm='" + txtusername.Text + "' and password='" + txtpassword.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Session["username"] = txtusername.Text;
                Label2.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("home.aspx");
                
            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Login Not Successfull! Check Username and Password..";
                Label2.ForeColor = System.Drawing.Color.Red;
                
            }
            con.Close();

            con.Open();
            SqlCommand cmd2 = new SqlCommand("select * from Admin_info where Admin_nm='" + txtusername.Text + "' and Admin_pass='" + txtpassword.Text + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);


             if (dt2.Rows.Count == 1)
            {
                Session["adminname"] = txtusername.Text;
                Label2.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("../admin/dashboard.aspx");
               
            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Login Not Successfull! Check Username and Password..";
                Label2.ForeColor = System.Drawing.Color.Red;
               
            }
            con.Close();
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