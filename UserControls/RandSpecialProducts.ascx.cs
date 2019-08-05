using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConLine.UserControls
{
    public partial class RandSpecialProducts : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BOLProducts ProductsBOL = new BOLProducts();
            rptProducts.DataSource = ProductsBOL.GetRandSelectedProducts(4, 9, 1);
            rptProducts.DataBind();

        }
        public string FormatText(Object obj)
        {
            if (obj == null)
                return "";
            ReqUtils rUtil = new ReqUtils();
            return Tools.ShowBriefText(rUtil.RemoveTags(obj.ToString()), 15);

        }
        public string ShowPic(object Title, object PicName)
        {
            string Result = "";
            if (PicName != null && PicName != "")
                Result = "<img class=\"cPic3\" alt=\"" + Title + "\" src=\"" + ((Page)HttpContext.Current.Handler).ResolveUrl("~/" + PicName) + "\" />";
            return Result;
        }

    }
}