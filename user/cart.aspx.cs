using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }

                //Adding product in Gridview
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {
                        con.Open();
                        dr = dt.NewRow();

                        //SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bcaproject78\Documents\Visual Studio 2010\WebSites\GRO1\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
                        SqlDataAdapter da = new SqlDataAdapter("select * from  Item_info where Pro_id=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["Pro_id"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pro_nm"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["P_img"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Price"].ToString());
                        int Quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                        double TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("cart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        // SqlConnection scon = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bcaproject78\Documents\Visual Studio 2010\WebSites\GRO1\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
                        SqlCommand cmd = new SqlCommand("select * from  Item_info where Pro_id=" + Request.QueryString["id"], con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["Pro_id"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pro_nm"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["P_img"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];


                        double price = Convert.ToDouble(ds.Tables[0].Rows[0]["Price"].ToString());
                        Session["price"] = price;
                        int Quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                        double TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("cart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Session["total"] = GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    }
                }

            }

            string OrderDate = DateTime.Now.ToShortDateString();
            string time = System.DateTime.Now.ToString("hh:mm:ss");
            Session["Orderdate"] = OrderDate;
            Session["time"] = time;
            orderid();
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

     

        // calculatig final price

        public int grandtotal()
        {
            
                DataTable dt = new DataTable();
                dt = (DataTable)Session["buyitems"];
                int nrow = dt.Rows.Count;
                int i = 0;
                int totalprice = 0;
                while (i < nrow)
                {
                    totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());

                    i = i + 1;

                }
                return totalprice;
                Session["total"] = totalprice;
            
        }

        public void orderid()
        {
           
                string alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
                Random r = new Random();
                char[] myArray = new char[5];

                for (int i = 0; i < 5; i++)
                {
                    myArray[i] = alpha[(int)(35 * r.NextDouble())];
                }
                string orderid;
                orderid = DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
                Session["Orderid"] = orderid;
            
          
        }

    protected void  GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;

                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    //item has been deleted from shopping cart
                    break;
                }

            }

            //setting sno. after  deleting row item from cart
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();

            }
            Session["buyitems"] = dt;
            Response.Redirect("cart.aspx");

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
            if (Session["username"] != null)
            {
                DataTable dt;
                dt = (DataTable)Session["buyitems"];

                string st = "Pending";

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    //SqlConnection scon = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bcaproject78\Documents\Visual Studio 2010\WebSites\GRO1\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into OrderDetails(unm,orderid,sno,productid,productname,price,quantity,orderdate,status)values('" + Session["username"] + "','" + Session["Orderid"] + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + Session["Orderdate"] + "','" + st + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            //if session is null redirecting to login else placing oreder
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (GridView1.Rows.Count.ToString() == "0")
                {
                    Response.Write("<script>alert('Your Cart is Empty. You cannot place an order');</script>");
                }
                else
                {
                    Response.Redirect("placeorder.aspx");
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

      
}
 