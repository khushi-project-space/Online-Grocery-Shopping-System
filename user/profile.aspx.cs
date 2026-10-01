using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class user_profile : System.Web.UI.Page
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
                    Label2.Text = Session["username"].ToString();
                    Label2.Visible = false;
                }
                else
                {
                    Label2.Text = "Guest";  // Default value if session is empty
                }
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from User_info where unm='" + Label2.Text + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                DetailsView1.DataBind();
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
   
}