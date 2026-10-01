using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Configuration;

public partial class user_invoice : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string orderid = Session["orderid"].ToString();
            Label1.Text = orderid;
            findorderdate(Label2.Text);
            string address = Session["baddress"].ToString();
            Label3.Text = address;
            showgrid(Label1.Text);
            Label5.Text = Session["username"].ToString();
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
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Do nothing. This is required for GridView to render correctly in a PDF
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            exportpdf();
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
    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        // Assuming the GridView1 is part of the Panel1
        Panel1.RenderControl(hw);  // Render the whole Panel (if GridView is in it)

        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();

        Response.Write(pdfDoc);
        Response.End();
    }

    private void findorderdate(String orderid)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label2.Text = ds.Tables[0].Rows[0]["orderdate"].ToString();
        }
        con.Close();
    }

    private void showgrid(string orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add("sno");
        dt.Columns.Add("productid");
        dt.Columns.Add("productname");
        dt.Columns.Add("quantity");
        dt.Columns.Add("price");
        dt.Columns.Add("totalprice");

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid=@OrderId", con);
        cmd.Parameters.AddWithValue("@OrderId", orderid);  // Use parameterized query
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        int totalrows = ds.Tables[0].Rows.Count;
        double grandtotal = 0;

        for (int i = 0; i < totalrows; i++)
        {
            dr = dt.NewRow();

            dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString(); // Correct row reference
            dr["productname"] = ds.Tables[0].Rows[i]["productname"].ToString(); // Correct row reference
            dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString(); // Correct row reference
            dr["price"] = ds.Tables[0].Rows[i]["price"].ToString(); // Correct row reference

            double price = Convert.ToDouble(ds.Tables[0].Rows[i]["price"].ToString());
            int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["quantity"].ToString());
            double totalprice = price * quantity;
            dr["totalprice"] = totalprice;

            grandtotal += totalprice;  // Add to grand total

            dt.Rows.Add(dr);
        }

        GridView2.DataSource = dt;
        GridView2.DataBind();
        Label4.Text = grandtotal.ToString();  // Display the grand total
        con.Close();
    }
}