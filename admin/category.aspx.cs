using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_category : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (categaoryName.Text == "")
            {
                Label1.Text = "Please enter category name";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Category_info values('" + categaoryName.Text + "')", con);
                cmd.ExecuteNonQuery();
                Label1.Text = "Added Successfully";
                Label1.ForeColor = System.Drawing.Color.Green;
                con.Close();
                GridView1.DataBind();
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
    protected void clear_Click(object sender, EventArgs e)
    {
        try
        {

            categaoryName.Text = "";
            Label1.Text = "";
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
