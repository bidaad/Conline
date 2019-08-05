using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConLine
{
    public partial class Help : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCode = Request["Code"];
            int Code;
            Int32.TryParse(strCode, out Code);
            if (Code == 1)
                MultiView1.ActiveViewIndex = 0;
            if (Code == 2)
                MultiView1.ActiveViewIndex = 1;
            if (Code == 3)
                MultiView1.ActiveViewIndex = 2;
            

        }
    }
}