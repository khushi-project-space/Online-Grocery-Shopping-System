using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_update_status : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
   

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update OrderDetails set status='" + DropDownList1.SelectedValue + "' where orderid='" + Session["Orderid"] + "'", con);
            cmd.ExecuteNonQuery();
            DataList1.DataBind();
            con.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }

    }
   
    protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "select")
            {
                Label l1 = (Label)(e.Item.FindControl("label9"));
                Session["Orderid"] = e.CommandArgument.ToString();
                Session["status"] = l1.Text;

            }

            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT * from OrderDetails WHERE orderid =@orderid", con);
            cmd.Parameters.AddWithValue("@orderid", Session["Orderid"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Label10.Text = dr["unm"].ToString();
                Label11.Text = dr["orderid"].ToString();
                DropDownList1.SelectedValue = dr["status"].ToString();
            }
            con.Close();
        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }
    }
    protected void btnBill_Click(object sender, EventArgs e)
    {
        try
        {
        Button btn = (Button)sender; // Get the button that was clicked
        string orderId = btn.CommandArgument; // Retrieve Order ID from CommandArgument

        if (!string.IsNullOrEmpty(orderId))
        {
            Session["Orderid"] = orderId; // Store Order ID in Session
            Response.Redirect("billinginfo.aspx"); // Redirect to bill page
        }

        }
        catch (SqlException ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "Something get wrong pls do the process again");
        }
    }
}