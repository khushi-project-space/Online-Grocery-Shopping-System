using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminmaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentPage = Request.Url.AbsolutePath.ToLower();

        if (currentPage.EndsWith("dashboard.aspx"))
        {
            lid.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("category.aspx"))
        {
            lic.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("product.aspx"))
        {
            lip.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("update_status.aspx"))
        {
            liu.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("usermanage.aspx"))
        {
            lius.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("feedback.aspx"))
        {
            lif.Attributes.Add("class", "active");
        }
        else if (currentPage.EndsWith("orderreport.aspx"))
        {
            lir.Attributes.Add("class", "active");
        }
    }
}
