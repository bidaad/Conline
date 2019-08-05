using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ConLine.UserControls
{
    public partial class Basket : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateBasket();
        }

        public void UpdateBasket()
        {
            if (Session["dtOrders"] != null)
            {
                DataTable dt = (DataTable)Session["dtOrders"];
                if (dt.Rows.Count > 0)
                    lblBasketHeader.Text = "سبد خرید";
                else
                    lblBasketHeader.Text = "سبد خرید خالی است.";
                rptBasket.DataSource = dt;
                rptBasket.DataBind();
            }
        }
        public void UpdateBasket(DataTable dt)
        {
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                    lblBasketHeader.Text = "سبد خرید";
                else
                    lblBasketHeader.Text = "سبد خرید خالی است.";
                rptBasket.DataSource = dt;
                rptBasket.DataBind();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
    }
}