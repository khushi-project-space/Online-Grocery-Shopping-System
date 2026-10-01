using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                GetUserCount();  // Fetch user count on page load
                GetCatCount();
                GetProductCount();
                GetOrderCount();
                GetFeedbackCount();
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
    protected void btnUsers_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            Response.Redirect("usermanage.aspx");
            GetUserCount();
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
    private void GetUserCount()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM User_info", con);
            int count = (int)cmd.ExecuteScalar();
            lblOverlay.Text = "Total Users :- " + count.ToString(); // Show only count number
        }
        catch (Exception ex)
        {
            lblOverlay.Text = "Error!";
        }
        finally
        {
            con.Close();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            GetCatCount();
            Response.Redirect("category.aspx");
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
    private void GetCatCount()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Category_info", con);
            int count = (int)cmd.ExecuteScalar();
            Label2.Text ="Total Categories:- "  + count.ToString(); // Show only count number
        }
        catch (Exception ex)
        {
            Label2.Text = "Error!";
        }
        finally
        {
            con.Close();
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            GetProductCount();
            Response.Redirect("product.aspx");
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
    private void GetProductCount()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Item_info", con);
            int count = (int)cmd.ExecuteScalar();
            Label3.Text = "Total Product:-"+count.ToString(); // Show only count number
        }
        catch (Exception ex)
        {
            Label3.Text = "Error!";
        }
        finally
        {
            con.Close();
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            GetOrderCount();
            Response.Redirect("update_status.aspx");
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
    private void GetOrderCount()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM OrderDetails", con);
            int count = (int)cmd.ExecuteScalar();
            Label4.Text += "Total Order:- "+count.ToString()+" "; // Show only count number

            string cs = "Pending";
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(status) FROM OrderDetails where status='" + cs + "'", con);
            int count1 = (int)cmd1.ExecuteScalar();
            Label4.Text +=  "Pending:-"+count1.ToString()+" ";

            string cs1 = "Delivered";
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(status) FROM OrderDetails where status='" + cs1 + "'", con);
            int count2 = (int)cmd2.ExecuteScalar();
            Label4.Text += "Delivered:-"+count2.ToString()+" ";
        }
        catch (Exception ex)
        {
            Label4.Text = "Error!";
           
        }
        finally
        {
            con.Close();
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        try
        {

            GetFeedbackCount();
            Response.Redirect("feedback.aspx");
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
    private void GetFeedbackCount()
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Feedback_info", con);
            int count = (int)cmd.ExecuteScalar();
            Label5.Text ="Total Feedback:-"+  count.ToString(); // Show only count number
        }
        catch (Exception ex)
        {
            Label5.Text = "Error!";
        }
        finally
        {
            con.Close();
        }
    }
}