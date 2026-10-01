using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_menu1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            Session["addproduct"] = "false";
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
   
   
    protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    {

        
        try
        { 
            
            Session["addproduct"] = "true";
            if (e.CommandName == "AddtoCart")
            {
                TextBox list = (TextBox)(e.Item.FindControl("Textbox1"));
                Response.Redirect("cart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.Text);
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

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            
                SqlDataAdapter da = new SqlDataAdapter("select * from Item_info where (Pro_nm like '%" + TextBox2.Text + "%')", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
           
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