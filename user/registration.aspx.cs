using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            Image1.Visible = false;
            Label4.Visible = false;
            string str = System.IO.Path.GetExtension(FileUpload1.FileName);
           
            if (FileUpload1.HasFile)
            {

                Image1.Visible = true;
                if (str.ToLower() != ".jpg" && str.ToLower() != ".jpeg" && str.ToLower() != ".png")
                {
                    Label4.ForeColor = System.Drawing.Color.Red;
                    Label4.Text = "only jpg jpeg and png files are allowed";
                }

                else
                {
                    int size = FileUpload1.PostedFile.ContentLength;

                    if (size > 1048576)
                    {
                        Label4.ForeColor = System.Drawing.Color.Red;
                        Label4.Text = "only limited size is allowed";
                    }
                    else
                    {
                       
                        FileUpload1.SaveAs(Server.MapPath("~/user/userimage/" + FileUpload1.FileName));

                        Image1.ImageUrl = "~/user/userimage/" + System.IO.Path.GetFileName(FileUpload1.FileName);
                        Label4.ForeColor = System.Drawing.Color.Green;
                        Label4.Text = "file uploaded successfully";
                    }
                }
            }
            else
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label5.Visible = true;
                Label4.Text = "Please select file";
            }
            Label3.Visible=false;
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
    protected void btnregister_Click(object sender, EventArgs e)
    {   
        try
        {

            string s;
            if (DropDownList1.SelectedIndex == 0)
            {
                s = "Anand";
            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                s = "Nadiad";
            }
            else
            {
                s = "Borshad";
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into User_info values('"+Image1.ImageUrl+"','" + txtunm.Text + "','" + txtfname.Text + "','" + txtmname.Text + "','" + txtlname.Text + "','" + s + "','" + txtaddresss.Text + "','" + txtno.Text + "','" + txtemail.Text + "','" + txtpass.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("login.aspx");
            Label6.Text = "Registration successful!.";
            Label6.ForeColor = System.Drawing.Color.Green;

            txtunm.Text = "";
            txtfname.Text = "";
            txtmname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
            DropDownList1.Text = "";
            txtaddresss.Text = "";
            txtpass.Text = "";
            txtrepass.Text = "";
            txtno.Text = "";
       }
         catch (SqlException ex)
        {
            if (ex.Number == 2601)
            {
                // Console.WriteLine("This username is already exsist");
                Label5.Text = "Please enter unique email";
                Label5.Visible = true;
                Label5.ForeColor = System.Drawing.Color.Red;
               

            }
            else if(ex.Number==2627)
            {
                Label5.Text = "This username is already exsist Please enter unique username ";
                Label5.Visible = true;
                Label5.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Console.WriteLine("sql error:" + ex.Message);
            }

        }
    }

    protected void FileUpload1_Load(object sender, EventArgs e)
    {
        Image1.Visible = true;
    }
}