using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_userbill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Textpid.Text = Session["Pid"].ToString();
            Textaddress.Text = Session["baddress"].ToString();
            Texttotal.Text = Session["total"].ToString();
            con.Open();
            SqlCommand cmd = new SqlCommand("select fnm,mnm,lnm,mno,email,city from User_info where unm=@unm", con);
            cmd.Parameters.AddWithValue("@unm", Session["username"]);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cnm.Text = dr["fnm"].ToString() + " " + dr["mnm"].ToString() + " " + dr["lnm"].ToString();
                cnum.Text = dr["mno"].ToString();
                cemail.Text = dr["email"].ToString();
                ccity.Text = dr["city"].ToString();

                if (ccity.Text == "Anand")
                {
                    TextBox8.Text = "30 min";
                }
                else if (ccity.Text == "Nadiad")
                {
                    TextBox8.Text = "35 min";
                }
                else if (ccity.Text == "Borshad")
                {
                    TextBox8.Text = "45 min";
                }
            }
            con.Close();

            con.Open();

            SqlCommand cmd2 = new SqlCommand("select orderid,status,orderdate from OrderDetails where orderid=@orderid", con);
            cmd2.Parameters.AddWithValue("@orderid", Session["Orderid"]);
            SqlDataReader dr2 = cmd2.ExecuteReader();

            while (dr2.Read())
            {

                onm.Text = dr2["Orderid"].ToString();
                ostatus.Text = dr2["status"].ToString();
                odate.Text = dr2["orderdate"].ToString();
            }


            if (ostatus.Text == "Pending")
            {
                Button1.Enabled = false;
            }
            else if (ostatus.Text == "Delivered")
            {
                Button1.Enabled = true;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("invoice.aspx");
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