using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parsetv91._1
{
    public partial class SiteMapProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BOLProducts ProductsBOL = new BOLProducts();
            rptProducts.DataSource = ProductsBOL.GetAllProducts();
            rptProducts.DataBind();
        }
    }
}