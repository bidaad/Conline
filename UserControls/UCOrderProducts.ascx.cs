using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConLine.UserControls
{
    public partial class UCOrderProducts : System.Web.UI.UserControl
    {
        protected int _orderCode;
        public int OrderCode
        {
            get
            {
                return _orderCode;
            }
            set
            {
                _orderCode = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                BOLOrderProducts OrderProductsBOL = new BOLOrderProducts(1);
                rptOrderProducts.DataSource = OrderProductsBOL.GetOrderProducts(_orderCode);
                rptOrderProducts.DataBind();
            }
            catch
            {
            }
        }
    }
}