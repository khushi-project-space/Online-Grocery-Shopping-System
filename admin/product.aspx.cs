using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
        Image1.Visible = false;
        string str = System.IO.Path.GetExtension(FileUpload1.FileName);

        if (FileUpload1.HasFile)
        {
            Image1.Visible = true;
            if (str.ToLower() != ".jpg" && str.ToLower() != ".jpeg" && str.ToLower() != ".png")
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "only jpg jpeg and png files are allowed";
            }

            else
            {
                int size = FileUpload1.PostedFile.ContentLength;

                if (size > 1048576)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "only limited size is allowed";
                }
                else
                {


                    FileUpload1.SaveAs(Server.MapPath("~/admin/pro/" + FileUpload1.FileName));


                    Image1.ImageUrl = "~/admin/pro/" + System.IO.Path.GetFileName(FileUpload1.FileName);
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "file uploaded successfully";
                }
            }
        }
        else
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Please select file";
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
    protected void submitButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (productName.Text == "" && productPrice.Text == "" && productqnt.Text == "")
            {
                Label7.Text = "Please enter data";
                Label7.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Item_info values('" + productName.Text + "','" + productPrice.Text + "','" + productqnt.Text + "','" + Image1.ImageUrl + "','" + DropDownList1.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                Label7.Text = "Product add successfully";
                Label7.ForeColor = System.Drawing.Color.Green;
                con.Close();
                GridView1.DataBind();
                //productName.Text = "";
                //productPrice.Text = "";
                //productqnt.Text = "";
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
        productName.Text = "";
        productPrice.Text = "";
        productqnt.Text = "";
        Image1.ImageUrl = "";
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
