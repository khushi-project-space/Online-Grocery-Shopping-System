using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;        

public partial class user_placeorder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString); 
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            orderid();
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    TextBox1.Text = Session["username"].ToString();
                }
                else
                {
                    Response.Redirect("login.aspx"); // Default value if session is empty
                }
            }
            if (!IsPostBack)
            {
                if (Session["Pid"] != null)
                {
                    TextBox7.Text = Session["Pid"].ToString();
                }
                else
                {
                    Response.Write("payment id not generated try again...");
                   
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

    public void orderid()
    {
        try
        {
            string alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
            Random r = new Random();
            char[] myArray = new char[5];

            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            string pid;
            pid = "p_id" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Pid"] = pid;
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
            SqlCommand cmd = new SqlCommand("insert into cash_info(pid,unm,address)values('" + Session["Pid"] + "','" + Session["username"] + "','" + TextBox8.Text + "')", con);
            cmd.ExecuteNonQuery();
            if (TextBox8.Text != null)
            {
                Session["baddress"] = TextBox8.Text;
            }

            con.Close();
            Response.Redirect("userbill.aspx");
            //if session is null redirecting to login else placing oreder
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