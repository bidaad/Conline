using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ConLine.Old_App_Code.DAL;
using System.Configuration;
using ConLine.Old_App_Code.Common;

namespace ConLine
{
    public partial class Payment : System.Web.UI.Page
    {
        int TotalAmount = 0;
        int OtherCosts = 0;
        int CouponDiscount = 0;
        public int SendPrice;
        public int TotalPrice;
        public int ProductPrice;
        int TotalWeight;

        protected string FormBody = "";
        public string tranKey = ConfigurationManager.AppSettings["BMITransactionKey"];
        public string CardAcqID = ConfigurationManager.AppSettings["BMIMerchantID"];
        public string TerminalId = ConfigurationManager.AppSettings["BMITerminalID"];
        public string ReturnURL = ConfigurationManager.AppSettings["BMIShopReturnURL"];
        public string ServiceURL = ConfigurationManager.AppSettings["BMIServiceURL"];


        protected void Page_Load(object sender, EventArgs e)
        {
            msgMessage.Text = "";
            Security.Check();
            int UserCode = Convert.ToInt32(Session["UserCode"]);
            string OrderID = Request["OrderID"];

            if (string.IsNullOrEmpty(OrderID))
            {
                if (Session["dtOrders"] == null)
                {
                    Response.Redirect("~/");
                    return;
                }
                else
                {
                    DataTable dt = (DataTable)Session["dtOrders"];
                    if (dt.Rows.Count > 0)
                    {
                        CalcTotalAmount(dt);

                        BOLUsers UsersBOL = new BOLUsers();
                        Users CurUser = ((IBaseBOL<Users>)UsersBOL).GetDetails(UserCode);
                        int AccountBalance = 0;
                        if (CurUser.AccountBalance != null)
                        {
                            AccountBalance = UsersBOL.GetBalanace(UserCode);
                        }
                    }
                }
            }

            if (!Page.IsPostBack)
            {
                if (string.IsNullOrEmpty(OrderID))
                {
                    int intAddressCode = Convert.ToInt32(Session["AddressCode"]);

                    BOLUserAddresses UserAddressesBOL = new BOLUserAddresses(UserCode);
                    vUserAddresses CurAddress = UserAddressesBOL.GetFullDetails(intAddressCode);
                    if (CurAddress.CityCode != 124)
                    {
                        //rbPayOnline.Checked = true;
                        //rbPayInPlace.Enabled = false;
                    }
                }
                else
                {
                    ViewState["OrderID"] = OrderID;
                    BOLOrders OrdersBOL = new BOLOrders();
                    vOrders CurOrder = OrdersBOL.GetOrderByID(OrderID);
                    lblTotalOrderPrice.Text = Tools.FormatCurrency(Tools.ChangeEnc((CurOrder.TotalOrderCost / 10 ).ToString()));
                }

                BOLUserCoupons UserCouponsBOL = new BOLUserCoupons(1);
                rptUserCoupons.DataSource = UserCouponsBOL.GetDataByUserCode(UserCode);
                rptUserCoupons.DataBind();
            }

        }

        private int CalcTotalAmount(DataTable dt)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int Amount = Convert.ToInt32(dt.Rows[i]["ProductPrice"]);
                int Quantity = Convert.ToInt32(dt.Rows[i]["ItemCount"]);
                int CurWeight = Convert.ToInt32(dt.Rows[i]["ProductTotalWeight"]);

                TotalAmount += (Amount * Quantity);
                TotalWeight += CurWeight;
            }


            int intAddressCode = Convert.ToInt32(Session["AddressCode"]);

            int UserCode = Convert.ToInt32(Session["UserCode"]);
            BOLUserAddresses UserAddressesBOL = new BOLUserAddresses(UserCode);
            vUserAddresses CurAddress = UserAddressesBOL.GetFullDetails(intAddressCode);

            if (TotalAmount < 500000)
            {
                OtherCosts = 50000;
            }
            else
            {
                OtherCosts = 0;
            }

            lblTotalOrderPrice.Text = Tools.FormatCurrency(Tools.ChangeEnc((TotalAmount / 10 + OtherCosts / 10).ToString()));
            return TotalAmount + OtherCosts;
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            int OrderCode = 0;
            int TotalOrderCost = 0;
            string OrderID = "";
            int UserCode = Convert.ToInt32(Session["UserCode"]);
            int HCPayMethodCode = 1;
            if (rbPayOnline.Checked)
                HCPayMethodCode = 1;
            else
                HCPayMethodCode = 2;


            Tools tools = new Tools();

            SendPrice = 0;

            if (Session["Coupon"] != null)
            {
                BOLCoupons CouponsBOL = new BOLCoupons();
                string CouponID = Session["Coupon"].ToString();
                //int BasicCouponValue = Convert.ToInt32(ConfigurationManager.AppSettings["BasicCouponValue"]);
                //int CouponCount = CouponsBOL.GetCouponCount(Coupon);
                //CouponDiscount = CouponCount * BasicCouponValue;
                CouponDiscount = CouponsBOL.GetCouponVal(CouponID);
                if (TotalAmount < CouponDiscount)
                {
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgMessage.Text = "مقدار کوپن (" + CouponDiscount + ") بیشتر از مجموع خرید است. ";
                    return;
                }

            }

            BOLOrders OrdersBOL = new BOLOrders();


            if (ViewState["OrderID"] == null)
            {
                if (Session["dtOrders"] != null)
                {
                    DataTable dt = (DataTable)Session["dtOrders"];
                    if (dt.Rows.Count > 0)
                    {
                        TotalAmount = 0;
                        int NetTotal = CalcTotalAmount(dt);

                    }
                }
                int intDeliverType = Convert.ToInt32(Session["DeliverType"]);
                int intAddressCode = Convert.ToInt32(Session["AddressCode"]);

                //BOLHardCode HardCodeBOL = new BOLHardCode();
                //HardCodeBOL.TableOrViewName = "HCSendTypes";
                BOLUserAddresses UserAddressesBOL = new BOLUserAddresses(UserCode);
                vUserAddresses CurAddress = UserAddressesBOL.GetFullDetails(intAddressCode);

                string FullAddress = CurAddress.Province + " " + CurAddress.City + " " + CurAddress.Address;

                TotalOrderCost = TotalAmount + SendPrice + OtherCosts - CouponDiscount;

                string FullName = CurAddress.FullName;
                string Tel = CurAddress.Tel;
                string PostalCode = CurAddress.PostalCode;
                string Description = "";
                string PostOrderCode = "";
                string CellPhone = CurAddress.CellPhone;
                string Email = Session["Email"].ToString();

                string Address = CurAddress.Province + " " + CurAddress.City + " " + CurAddress.Address;
                int HCSendTypeCode = 1;
                int HCGenderCode = 1;

                int CityCode = CurAddress.CityCode;
                int ProvinceCode = CurAddress.ProvinceCode;



                #region Save To Orders
                OrderID = tools.GetRandString(10).ToUpper();

                int? RefUserCode = null;
                if (Session["RefUserCode"] != null)
                    RefUserCode = Convert.ToInt32(Session["RefUserCode"]);
                if (Session["UserCode"] != null)
                    UserCode = Convert.ToInt32(Session["UserCode"]);
                OrderCode = OrdersBOL.InsertRecord(FullName, Email, CityCode, ProvinceCode, Tel, CellPhone, PostalCode, Address, HCGenderCode, Description,
                    HCSendTypeCode, 1, 0, SendPrice, TotalAmount, OtherCosts, TotalOrderCost, OrderID, false, RefUserCode, UserCode, HCPayMethodCode);

                #endregion

                #region Save to Order Products
                if (Session["dtOrders"] != null)
                {
                    BOLOrderProducts OrderProductsBOL = new BOLOrderProducts(OrderCode);
                    DataTable dt = (DataTable)Session["dtOrders"];
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        int ProductCode = Convert.ToInt32(dt.Rows[i]["ProductCode"]);
                        int ProductPrice = Convert.ToInt32(dt.Rows[i]["ProductPrice"]);
                        int ItemCount = Convert.ToInt32(dt.Rows[i]["ItemCount"]);

                        OrderProductsBOL.InsertRecord(OrderCode, ProductCode, ProductPrice, 1, ItemCount);

                    }
                }
                #endregion
            }
            else
            {
                vOrders CurOrder = OrdersBOL.GetOrderByID(ViewState["OrderID"].ToString());
                if (CurOrder == null)
                {
                    msgMessage.Text = "کد سفارش معتبر نیست";
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    return;
                }
                else
                {
                    OrderCode = CurOrder.Code;
                    TotalOrderCost = Convert.ToInt32( CurOrder.TotalOrderCost);
                }
                OrderID = CurOrder.ID;
            }


            //if (OrderCode != -1 && !string.IsNullOrEmpty( CellPhone) )
            //{
            //    try
            //    {
            //        long intCelPhone = 0;
            //        if(CellPhone.Length == 11)
            //        {
            //            if(CellPhone.StartsWith("0"))
            //            {
            //                intCelPhone  = Convert.ToInt64( CellPhone.Substring(1, CellPhone.Length - 1));
            //                SMSHelper sHelper = new SMSHelper();
            //                sHelper.SendSingleSMS(intCelPhone, "خرید شما در سایت کانلاین با موفقیت انجام شد. کد پیگیری:" + );
            //            }
            //        }
            //    }
            //    catch
            //    {
            //    }
            //}

            if (Session["Coupon"] != null)
            {
                BOLCoupons CouponsBOL = new BOLCoupons();
                string Coupon = Session["Coupon"].ToString();
                CouponsBOL.MarkUsed(Coupon);
                Session["Coupon"] = null;
            }

            pnlPayTools.Visible = false;

            Session["dtOrders"] = null;

            if (rbPayOnline.Checked)
            {
                string UserIP = "";

                try
                {
                    BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(UserCode);
                    int UserTransactionCode = UserTransactionsBOL.Insert(UserCode, DateTime.Now, 1, 1, UserIP, TotalOrderCost, 1);
                    long BankOrderId = Convert.ToInt64(UserTransactionCode);
                    string AdditionalData = "";
                    string requestKey; // request key

                    ir.bmi.bmiutility4.MerchantUtility utl = new ir.bmi.bmiutility4.MerchantUtility();
                    utl.Url = ServiceURL;

                    FormBody = utl.PaymentUtilityAdditionalData(CardAcqID, TotalOrderCost, BankOrderId, tranKey, TerminalId, ReturnURL,
                                                                AdditionalData, out requestKey);
                    bool UpdateResult = UserTransactionsBOL.UpdateRequestKey(UserTransactionCode, requestKey);
                    if (UpdateResult)
                    {
                        bool UpdateTransResult = OrdersBOL.UpdateTransactionCode(OrderCode, UserTransactionCode);

                        if (UpdateTransResult)
                        {
                            FormBody += "</form><script> document.getElementById('paymentUTLfrm').submit();</script>";
                            ((Literal)Master.FindControl("ltrForm")).Text = FormBody;
                        }
                        else
                        {
                            msgMessage.Text = "بروز خطای سیستمی";
                            msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                            return;
                        }

                    }
                    else
                    {
                        msgMessage.Text = "خطا در برقراری ارتباط با سرور بانک ملی" + UpdateResult;
                        msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                        return;
                    }
                }
                catch (Exception err)
                {
                    msgMessage.Text = "خطا در برقراری ارتباط با سرور بانک ملی" + err.Message;
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    return;
                }

            }
            else
            {
                Response.Redirect("~/Checkout.aspx?ID=" + OrderID);
                return;
            }


        }

        protected void btnCoupon_Click(object sender, EventArgs e)
        {
            if (txtCoupon.Text != "")
            {
                string CouponID = txtCoupon.Text;
                BOLCoupons CouponsBOL = new BOLCoupons();
                if (!CouponsBOL.IsValidAndUnused(CouponID))
                {
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgMessage.Text = "کوپن معتبر نمیباشد";
                    return;
                }
                else
                {
                    if (Session["dtOrders"] != null)
                    {
                        DataTable dt = (DataTable)Session["dtOrders"];
                        if (dt.Rows.Count > 0)
                        {
                            TotalAmount = 0;
                            int NetTotal = CalcTotalAmount(dt);

                            int BasicCouponValue = Convert.ToInt32( ConfigurationManager.AppSettings["BasicCouponValue"]);
                            //int CouponCount = CouponsBOL.GetCouponCount(CouponID);
                            //int CouponDiscount = CouponCount * BasicCouponValue;

                            int CouponDiscount = CouponsBOL.GetCouponVal(CouponID);
                            if (NetTotal < CouponDiscount)
                            {
                                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                                msgMessage.Text = "مقدار کوپن (" + CouponDiscount + ") کمتر از مجموع خرید است. ";
                                return;
                            }

                            lblTotalOrderPrice.Text = Tools.FormatCurrency(Tools.ChangeEnc(((NetTotal - CouponDiscount) / 10).ToString()));
                            btnCoupon.Text = "اعمال شد";
                            btnCoupon.Enabled = false;
                            btnCoupon.CssClass = "btn btn-warning";
                            Session["Coupon"] = CouponID;
                        }

                    }
                }
            }
            else
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgMessage.Text = "لطفا کوپن را وارد کنید";
            }
        }

        protected void HandleRepeaterCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "ApplyCoupon")
            {
                Button btnPic = (Button)e.Item.FindControl("btnPic");
                Label lblCoupon = (Label)e.Item.FindControl("lblCoupon");

                string CouponID = lblCoupon.Text;
                BOLCoupons CouponsBOL = new BOLCoupons();
                if (!CouponsBOL.IsValidAndUnused(CouponID))
                {
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgMessage.Text = "کوپن معتبر نمیباشد";
                    return;
                }
                TotalAmount = 0;
                DataTable dt = (DataTable)Session["dtOrders"];
                int NetTotal = CalcTotalAmount(dt);

                int BasicCouponValue = Convert.ToInt32(ConfigurationManager.AppSettings["BasicCouponValue"]);
                //int CouponCount = CouponsBOL.GetCouponCount(CouponID);
                //int CouponDiscount = CouponCount * BasicCouponValue;

                int CouponDiscount = CouponsBOL.GetCouponVal(CouponID);
                if (NetTotal < CouponDiscount)
                {
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgMessage.Text = "مقدار کوپن (" + CouponDiscount + ") کمتر از مجموع خرید است. ";
                    return;
                }

                lblTotalOrderPrice.Text = Tools.FormatCurrency(Tools.ChangeEnc(((NetTotal - CouponDiscount) / 10).ToString()));
                msgMessage.Text = "مبلغ کوپن از مجموع مبلغ قابل پرداخت کسر شد.";

                btnCoupon.Enabled = false;
                btnCoupon.CssClass = "btn btn-warning";
                Session["Coupon"] = CouponID;

                pnlUserCoupons.Enabled = false;

            }
        }
    }
}