using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.Data;
using AKP.Web.Controls;

namespace ConLine.UserControls
{
    public partial class SmallProductList : System.Web.UI.UserControl
    {
        public string RefID = "";
        public string strPageNo;
        int PageNo = 1;
        int _pageSize = 20;
        public int PageSize
        {
            set
            {
                _pageSize = value;
            }
        }
        string ConcatUrl;
        int Counter = 0;
        int ClassCounter = 0;
        int Turn = 0;

        protected int? _catCode = null;
        public int? CatCode
        {
            get
            {
                return _catCode;
            }
            set
            {
                _catCode = value;
            }
        }

        protected string _keyword = null;
        public string Keyword
        {
            get
            {
                return _keyword;
            }
            set
            {
                _keyword = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["dtOrders"] == null)
            //    btnCheckout.Visible = false;
            //else
            //{
            //    if( ((DataTable)Session["dtOrders"]).Rows.Count == 0)
            //        btnCheckout.Visible = false;
            //}
            //try
            //{

            //}
            //catch(Exception exp)
            //{
            //    BOLErrorLogs ErrorLogsBOL = new BOLErrorLogs();
            //    ErrorLogsBOL.Insert(exp.Message, DateTime.Now, Request.Url.AbsolutePath, Request.QueryString.ToString());
            //}
        }

        public void ShowAllProducts()
        {
            string strRefUserID = Request["Ref"];
            if (!string.IsNullOrEmpty(strRefUserID))
                RefID = strRefUserID;
            else if (Session["UserID"] != null)
                RefID = Session["UserID"].ToString();


            IQueryable<vProducts> ItemList;
            int ResultCount = 0;
            strPageNo = Request["PageNo"];
            if (strPageNo != "" && strPageNo != null)
                PageNo = Convert.ToInt32(strPageNo);
            BOLProducts ProductsBOL = new BOLProducts();

            if (_keyword == null)
            {
                ItemList = ProductsBOL.GetProducts(_catCode, _pageSize, PageNo, true);
                ResultCount = ProductsBOL.GetProductsCount(_catCode, true);
                if (_catCode != null)
                {
                    BOLProductCats ProductCatsBOL = new BOLProductCats();
                    ProductCats CurCat = ProductCatsBOL.GetSingleCat((int)_catCode);
                    if (CurCat != null)
                    {
                        lblListHeader.Text = "محصولات گروه " + CurCat.Name;
                        Page.Title = "محصولات گروه " + CurCat.Name;
                    }
                }
            }
            else
            {
                ItemList = ProductsBOL.SearchProducts(_keyword, _pageSize, PageNo);
                ResultCount = ProductsBOL.SearchProductsCount(_keyword);
                lblListHeader.Text = "نتایج جستجو برای \"" + Keyword + "\"";
            }
            rptProducts.DataSource = ItemList;
            rptProducts.DataBind();

            int PageCount = ResultCount / _pageSize;
            if (ResultCount % _pageSize > 0)
                PageCount++;

            ConcatUrl += "&CatCode=" + Request["CatCode"] + "&Keyword=" + Keyword;
            pgrToolbar.PageNo = PageNo;
            pgrToolbar.PageCount = PageCount;
            pgrToolbar.ConcatUrl = ConcatUrl;
            pgrToolbar.PageBind();
        }
        public void ShowProductsBySelTypeCode(int HCSelectTypeCode)
        {
            IQueryable<vProducts> ItemList;
            strPageNo = Request["PageNo"];
            if (strPageNo != "" && strPageNo != null)
                PageNo = Convert.ToInt32(strPageNo);
            BOLProducts ProductsBOL = new BOLProducts();

            switch (HCSelectTypeCode)
            {
                case 1:
                    lblListHeader.Text = "جدیدترین محصولات";
                    break;
                case 2:
                    lblListHeader.Text = "پر فروش ترین محصولات";
                    break;
                case 3:
                    lblListHeader.Text = "پر بازدید ترین محصولات";
                    break;

                default:
                    break;
            }
            rptProducts.DataSource = ProductsBOL.GetRandSelectedProducts(HCSelectTypeCode, _pageSize, PageNo);
            rptProducts.DataBind();

        }

        public string FormatText(Object obj)
        {
            if (obj == null)
                return "";
            ReqUtils rUtil = new ReqUtils();
            return Tools.ShowBriefText(rUtil.RemoveTags(obj.ToString()), 95);

        }

        public string ShowPropStart()
        {
            string Result = "";
            string CurrentClass = GetCurrentClass();
            if ((Counter % 4) == 0 && Turn == 0)
            {
                Result = "<tr class=\"" + CurrentClass + "\"><td>";
            }
            else
            {
                Result = "<td>";
            }
            return Result;
        }
        public string ShowPropEnd()
        {
            string Result = "";
            if ((Counter % 4) == 0 && Turn == 1)
            {
                Result = "</td></tr>";
                ClassCounter++;
                if (ClassCounter == 4)
                    ClassCounter = 0;
                Turn = 0;
            }
            else
            {
                Result = "</td>";
                Turn = 1;
            }
            Counter++;
            return Result;
        }
        public string GetCurrentClass()
        {
            string Result = "";
            switch (ClassCounter % 4)
            {
                case 0:
                    Result = "PurpleWin";
                    break;
                case 1:
                    Result = "BlueWin";
                    break;
                case 2:
                    Result = "Red1Win";
                    break;
                case 3:
                    Result = "Red2Win";
                    break;
                default:
                    Result = "PurpleWin";
                    break;
            }

            return Result;
        }

        public string ShowPic(object Title, object PicName)
        {
            string Result = "";
            ReqUtils rUtil = new ReqUtils();
            Title = rUtil.RemoveTags(Title.ToString());
            if (PicName != null && PicName != "")
                Result = "<img class=\"cPicSmallPro\" alt=\"" + Title + "\" src=\"" + ((Page)HttpContext.Current.Handler).ResolveUrl("~/" + PicName) + "\" />";
            return Result;
        }

        protected void HandleRepeaterCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "RemoveFromBasket")
            {
                ImageButton btnAddToBasket = (ImageButton)e.Item.FindControl("btnAddToBasket");
                DropDownList ddlItemCount = (DropDownList)e.Item.FindControl("ddlItemCount");
                Label lblMessage = (Label)e.Item.FindControl("lblMessage");
                MsgBox msgMessage = (MsgBox)e.Item.FindControl("msgMessage");
                Panel pnlRemove = (Panel)e.Item.FindControl("pnlRemove");
                ddlItemCount.SelectedIndex = 0;

                pnlRemove.Visible = false;
                int ProductCode = Convert.ToInt32(btnAddToBasket.Attributes["ProductCode"]);
                BOLProducts ProductsBOL = new BOLProducts();
                Products CurProduct = ((IBaseBOL<Products>)ProductsBOL).GetDetails(ProductCode);
                if (CurProduct != null)
                {
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Info;
                    RemoveOrders(ProductCode);

                    string JSCommand = "";
                    if (!msgMessage.Visible)
                        msgMessage.Visible = true;
                    else
                        JSCommand += " $(\"#" + msgMessage.ClientID + "\").fadeTo(\"fast\",0.1);";

                    msgMessage.Text = "این محصول از سبد خرید حذف شد.";
                    JSCommand += " $(\"#" + msgMessage.ClientID + "\").fadeTo(\"slow\",0.9);";
                    ScriptManager.RegisterStartupScript(this, typeof(string), "SelectMediaRow", JSCommand, true);
                }
            }

        }
        protected void HandleDataListCommand(object source, DataListCommandEventArgs e)
        {
            //System.Threading.Thread.Sleep(4000);

            if (e.CommandName == "AddToBasket")
            {
                ImageButton btnAddToBasket = (ImageButton)e.Item.FindControl("btnAddToBasket");
                MsgBox msgMessage = (MsgBox)e.Item.FindControl("msgMessage");

                msgBox.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                int ProductCode = Convert.ToInt32(btnAddToBasket.Attributes["ProductCode"]);
                BOLProducts ProductsBOL = new BOLProducts();
                Products CurProduct = ((IBaseBOL<Products>)ProductsBOL).GetDetails(ProductCode);
                if (CurProduct != null)
                {
                    int ItemCount = 1;
                    int FinalCount = AddToOrders(ProductCode, ItemCount, CurProduct.FaTitle, (int)CurProduct.Price, CurProduct.Weight);
                    string JSCommand = "";
                    if (!msgBox.Visible)
                        msgBox.Visible = true;
                    else
                        JSCommand += " $(\"#" + msgBox.ClientID + "\").fadeTo(\"fast\",0.1);";

                    Response.Redirect("~/Cart.aspx");
                    //msgMessage.Text = "سبد خرید با موفقیت به روز شد.";
                    //JSCommand += " $(\"#" + msgMessage.ClientID + "\").fadeTo(\"slow\",0.9);";
                    //ScriptManager.RegisterStartupScript(this, typeof(string), "SelectMediaRow", JSCommand, true);
                    btnAddToBasket.Visible = false;
                }
            }


        }

        private void RemoveOrders(int ProductCode)
        {
            DataTable dt;
            if (Session["dtOrders"] == null)
                return;
            dt = (DataTable)Session["dtOrders"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int CurProCode = Convert.ToInt32(dt.Rows[i]["ProductCode"]);
                if (CurProCode == ProductCode)
                {
                    dt.Rows[i].Delete();
                    break;
                }
            }

            ((ConLine.UserControls.Basket)this.Parent.FindControl("Basket1")).UpdateBasket();

        }
        private int AddToOrders(int ProductCode, int ItemCount, string ProductName, int ProductPrice, int ProductWeight)
        {

            int FinalItemCount = 0;
            bool ProductAlreadyExist = false;
            DataTable dt;
            if (Session["dtOrders"] == null)
            {
                dt = new DataTable();

                DataColumn dcProductCode = new DataColumn("ProductCode", typeof(System.Int32));
                dt.Columns.Add(dcProductCode);

                DataColumn dcCount = new DataColumn("ItemCount", typeof(System.Int32));
                dt.Columns.Add(dcCount);

                DataColumn dcProductName = new DataColumn("ProductName", typeof(System.String));
                dt.Columns.Add(dcProductName);

                DataColumn dcProductPrice = new DataColumn("ProductPrice", typeof(System.Decimal));
                dt.Columns.Add(dcProductPrice);

                DataColumn dcProductTotalPrice = new DataColumn("ProductTotalPrice", typeof(System.Decimal));
                dt.Columns.Add(dcProductTotalPrice);

                DataColumn dcProductTotalWeight = new DataColumn("ProductTotalWeight", typeof(System.Decimal));
                dt.Columns.Add(dcProductTotalWeight);
            }
            else
            {
                dt = (DataTable)Session["dtOrders"];
            }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int CurProCode = Convert.ToInt32(dt.Rows[i]["ProductCode"]);
                if (CurProCode == ProductCode)
                {
                    //FinalItemCount = Convert.ToInt32(dt.Rows[i]["ItemCount"]) + ItemCount;
                    FinalItemCount = ItemCount;
                    dt.Rows[i]["ItemCount"] = FinalItemCount;
                    dt.Rows[i]["ProductTotalPrice"] = FinalItemCount * ProductPrice;
                    ProductAlreadyExist = true;
                    break;
                }
            }

            if (!ProductAlreadyExist)
            {
                DataRow drow = dt.NewRow();
                drow["ProductCode"] = ProductCode;
                FinalItemCount = ItemCount;
                drow["ItemCount"] = FinalItemCount;
                drow["ProductName"] = ProductName;
                drow["ProductPrice"] = ProductPrice;
                drow["ProductTotalWeight"] = FinalItemCount * ProductWeight;
                drow["ProductTotalPrice"] = FinalItemCount * ProductPrice;
                dt.Rows.Add(drow);
            }
            Session["dtOrders"] = dt;

            ((ConLine.UserControls.Basket)this.Parent.FindControl("Basket1")).UpdateBasket(dt);

            return FinalItemCount;
        }
        protected int? ProductInBasketItemCount(int ProductCode)
        {
            DataTable dt = (DataTable)Session["dtOrders"];
            if (dt == null)
                dt = new DataTable();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int CurProCode = Convert.ToInt32(dt.Rows[i]["ProductCode"]);
                if (CurProCode == ProductCode)
                    return Convert.ToInt32(dt.Rows[i]["ItemCount"]);
            }
            return null;
        }
    }
}