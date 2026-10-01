using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_forgetpass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
 
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Panel1.Visible = false;
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
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from User_info where email='" + txtemail.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                Panel1.Visible = true;
                Button1.Visible = false;
                Button3.Visible = false;
                Label4.Visible = false;
            }
            else
            {
                //Label4.ForeColor = System.Drawing.Color.Red;
                //Label4.Text = "Invalid Email,Please check..";
                //Button1.Visible = true;
                con.Close();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Admin_info where email='" + txtemail.Text + "'", con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);

                if (dt1.Rows.Count == 1)
                {
                    Label4.Visible = false;
                    Panel1.Visible = true;
                    Button1.Visible = false;
                    Button3.Visible = true;
                    Button2.Visible = false;
                   

                }
                else
                {
                    Label4.ForeColor = System.Drawing.Color.Red;
                    Label4.Text = "Invalid Email,Please check..";
                    Button1.Visible = true;
                }
                con.Close();

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
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("update User_info set password='" + txtpass.Text + "' where email='" + txtemail.Text + "'", con);
            cmd1.ExecuteNonQuery();
           
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("update Admin_info set Admin_pass='" + txtpass.Text + "' where email='" + txtemail.Text + "'", con);
            cmd1.ExecuteNonQuery();

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
}