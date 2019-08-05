using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConLine.UserControls
{
    public partial class MostSoldPros : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BOLProducts ProductsBOL = new BOLProducts();
            rptProducts.DataSource = ProductsBOL.GetMostSoldProducts(20);
            rptProducts.DataBind();
        }
    }
}