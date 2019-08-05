using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using ConLine.Old_App_Code.DAL;

namespace ConLine.Admin.Reports
{
    public partial class rptOrders : System.Web.UI.Page
    {
        public string strPageNo;
        int PageNo = 1;
        int PageSize = 10;
        string ConcatUrl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cboHCOrderStatusCode.DataSource = new BOLHardCode().GetHCDataTable("HCOrderStatuses");

                strPageNo = Request["PageNo"];
                if (strPageNo != "" && strPageNo != null)
                    PageNo = Convert.ToInt32(strPageNo);


                string Buyer = Request["Buyer"];
                string strHCOrderStatusCode = Request["HCOrderStatusCode"];
                string strShopCode = Request["ShopCode"];
                string PostOrderCode = Request["PostOrderCode"];
                string PayeganOrderCode = Request["PayeganOrderCode"];
                string strFromDate = Request["FromDate"];
                string strToDate = Request["ToDate"];
                string DoSearch = Request["s"];

                if (DoSearch == "1")
                {
                    txtBuyer.Text = Buyer;
                    txtPostOrderCode.Text = PostOrderCode;
                    txtPayeganOrderCode.Text = PayeganOrderCode;

                    int? HCOrderStatusCode = null;
                    int ShopCode = 1;
                    if (!string.IsNullOrEmpty( strHCOrderStatusCode ))
                        HCOrderStatusCode = Convert.ToInt32(strHCOrderStatusCode);
                    if (strShopCode != "")
                        ShopCode = Convert.ToInt32(strShopCode);
                    DateTime FromDate = DateTime.Now;
                    DateTime ToDate = DateTime.Now;
                    PersianCalendar pc = new PersianCalendar();
                    if (strFromDate != "")
                    {
                        FromDate = Convert.ToDateTime(Server.UrlDecode(strFromDate));
                        ddlFromDay.SelectedValue = pc.GetDayOfMonth(FromDate).ToString();
                        ddlFromMonth.SelectedValue = pc.GetMonth(FromDate).ToString();
                        ddlFromYear.SelectedValue = pc.GetYear(FromDate).ToString();
                    }
                    if (strToDate != "")
                    {
                        ToDate = Convert.ToDateTime(Server.UrlDecode(strToDate));
                        ddlToDay.SelectedValue = pc.GetDayOfMonth(ToDate).ToString();
                        ddlToMonth.SelectedValue = pc.GetMonth(ToDate).ToString();
                        ddlToYear.SelectedValue = pc.GetYear(ToDate).ToString();
                    }

                    BOLOrders OrdersBOL = new BOLOrders();
                    IQueryable<vOrders> ItemList = OrdersBOL.SearchOrders(Buyer, HCOrderStatusCode, ShopCode, PostOrderCode, PayeganOrderCode, FromDate, ToDate, PageSize, PageNo);
                    int ResultCount = OrdersBOL.GetSearchOrdersCount(Buyer, HCOrderStatusCode, ShopCode, PostOrderCode, PayeganOrderCode, FromDate, ToDate);

                    repeaterOrders.DataSource = ItemList;
                    repeaterOrders.DataBind();

                    int PageCount = ResultCount / PageSize;
                    if (ResultCount % PageSize > 0)
                        PageCount++;

                    ConcatUrl += "&Buyer=" + Buyer + "&s=1&ShopCode=" + ShopCode + "&PostOrderCode=" + PostOrderCode + "&PayeganOrderCode=" + PayeganOrderCode + "&FromDate=" + Server.UrlEncode(FromDate.ToString()) + "&ToDate=" + Server.UrlEncode(ToDate.ToString());
                    pgrToolbar.PageNo = PageNo;
                    pgrToolbar.PageCount = PageCount;
                    pgrToolbar.ConcatUrl = ConcatUrl;
                    pgrToolbar.PageBind();
                }

            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strFromYear = ddlFromYear.SelectedValue;
            string strFromMonth = ddlFromMonth.SelectedValue;
            string strFromDay = ddlFromDay.SelectedValue;

            string strToYear = ddlToYear.SelectedValue;
            string strToMonth = ddlToMonth.SelectedValue;
            string strToDay = ddlToDay.SelectedValue;

            string Buyer = txtBuyer.Text;
            string strHCOrderStatusCode = cboHCOrderStatusCode.SelectedValue;
            string strShopCode = cboShopCode.SelectedValue;
            string PostOrderCode = txtPostOrderCode.Text;
            string PayeganOrderCode = txtPayeganOrderCode.Text;

            int? HCOrderStatusCode = null;
            int ShopCode = 1;
            int FromYear;
            int FromMonth;
            int FromDay;

            int ToYear;
            int ToMonth;
            int ToDay;

            if(strHCOrderStatusCode != "")
                HCOrderStatusCode = Convert.ToInt32(strHCOrderStatusCode);
            if(strShopCode != "")
                ShopCode = Convert.ToInt32(strShopCode);

            Int32.TryParse(strFromYear, out FromYear);
            Int32.TryParse(strFromMonth, out FromMonth);
            Int32.TryParse(strFromDay, out FromDay);

            Int32.TryParse(strToYear, out ToYear);
            Int32.TryParse(strToMonth, out ToMonth);
            Int32.TryParse(strToDay, out ToDay);

            PersianCalendar pc = new PersianCalendar();
            DateTime FromDate = pc.ToDateTime(FromYear, FromMonth, FromDay, 0, 0, 0, 0);
            DateTime ToDate = pc.ToDateTime(ToYear, ToMonth, ToDay, 0, 0, 0, 0);

            Response.Redirect("~/Admin/Reports/rptOrders.aspx?s=1&" + "Buyer=" + Buyer + "&ShopCode=" + ShopCode + "&PostOrderCode=" + PostOrderCode + "&PayeganOrderCode=" + PayeganOrderCode + "&HCOrderStatusCode=" + HCOrderStatusCode + "&FromDate=" + Server.UrlEncode(FromDate.ToString()) + "&ToDate=" + Server.UrlEncode(ToDate.ToString()));

        }
    }
}