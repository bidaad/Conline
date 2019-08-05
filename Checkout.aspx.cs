using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.Configuration;
using ConLine.ir.bmi.bmiutility4;
using ConLine.Old_App_Code.Common;

namespace ConLine
{
    public partial class Checkout : System.Web.UI.Page
    {
        public string BMITransactionKey = ConfigurationManager.AppSettings["BMITransactionKey"];
        public string CardAcqID = ConfigurationManager.AppSettings["BMIMerchantID"];
        public string TerminalId = ConfigurationManager.AppSettings["BMITerminalID"];
        public string ReturnURL = ConfigurationManager.AppSettings["BMIReturnURL"];
        public string ServiceURL = ConfigurationManager.AppSettings["BMIServiceURL"];

        string strOrderId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string OrderID = Request["ID"];

            if (!string.IsNullOrEmpty(OrderID))
            {
                ShowOrderInfo(OrderID);

            }
            else
            {
                string strFP = HttpContext.Current.Request.Form["FP"];
                strOrderId = HttpContext.Current.Request.Form["OrderId"];
                string strTimeStamp = HttpContext.Current.Request.Form["TimeStamp"];



                long OrderId = Convert.ToInt64(strOrderId);

                CheckRequestStatus(OrderId);
            }
        }

        private void ShowOrderInfo(string OrderID)
        {
            BOLOrders OrdersBOL = new BOLOrders();
            vOrders CurOrder = OrdersBOL.GetOrderByID(OrderID);

            if (CurOrder != null)
            {
                lblOrderStatus.Text = CurOrder.OrderStatus;

                if (CurOrder.HCTransStatusCode == 2)
                    lblPaymentStatus.Text = "پرداخت شده";
                else
                    lblPaymentStatus.Text = "پرداخت نشده";

                lblTotalAmount.Text = Tools.ChangeEnc(Tools.FormatCurrency(Convert.ToInt32(CurOrder.TotalOrderCost / 10).ToString())) + " تومان ";
                lblOrderID.Text = OrderID;

                lblFullName.Text = CurOrder.FullName;
                lblAddress.Text = Tools.FormatString(CurOrder.Address.Replace("\n", " "));
                lblSendType.Text = CurOrder.SendType;

            }
            else
                mainMessage.Visible = false;
        }

        private void CheckRequestStatus(long OrderId)
        {
            try
            {
                int UserCode = 0;
                //if (Session["UserCode"] == null)
                //    Response.Redirect("~/Users/UserLogin.aspx");
                //UserCode = Convert.ToInt32(Session["UserCode"]);

                BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(UserCode);
                UserTransactions CurTrans = UserTransactionsBOL.GetTransactionByOrderID(OrderId);


                if (CurTrans != null)
                {
                    if (CurTrans.HCTransStatusCode == 2)
                    {
                        msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                        msgMessage.Text = "این سفارش قبلا تایید شده است.";
                        return;
                    }

                    UserCode = (int)CurTrans.UserCode;
                    string _RefNo, Appstatus, RealTransactionDateTime;

                    MerchantUtility utl = new MerchantUtility();

                    ///You Can Change Your Line Here
                    utl.Url = ServiceURL;
                    int AppStatusCode = utl.CheckRequestStatusWithRealTransactionDateTime(OrderId, CardAcqID,
                                                                TerminalId, BMITransactionKey,
                                                                CurTrans.BMIRequestKey, Convert.ToInt64(CurTrans.Amount),
                                                                out _RefNo, out Appstatus, out RealTransactionDateTime);

                    if (AppStatusCode == 0)
                    {
                        int OrderCode;
                        Int32.TryParse(strOrderId, out OrderCode);
                        bool UpdateResult = UserTransactionsBOL.UpdateStatus(OrderCode, 2);
                        if (UpdateResult)
                        {
                            //BOLUserCharges UserChargesBOL = new BOLUserCharges(UserCode);
                            //UserChargesBOL.Insert(UserCode, CurTrans.Code, null, CurTrans.Amount, 5, DateTime.Now);//پرداخت مبلغ اشتراک روزنامه رسمی
                            //UserTransactionsBOL.UpdateStatus(CurTrans.Code, 2);
                            try
                            {
                                string RefNo = "";
                                string AppStatus = "";
                                int AppStatusCode2 = utl.CheckRequestStatus(CurTrans.Code, CardAcqID, TerminalId, BMITransactionKey, CurTrans.BMIRequestKey, (int)CurTrans.Amount, out RefNo, out AppStatus);
                                if (AppStatus == "COMMIT")
                                {

                                    string RealRefNo = RefNo.ToString().Substring(8, 6);
                                    UserTransactionsBOL.UpdateFishno(CurTrans.Code, RealRefNo);

                                }
                            }
                            catch
                            {
                            }

                            BOLUsers UsersBOL = new BOLUsers();
                            int CurrentBalance = UsersBOL.GetBalance(UserCode);
                            msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                            msgMessage.Text = "تراکنش با موفقیت انجام شد.";

                            

                            BOLOrders OrdersBOL = new BOLOrders();
                            string InternalOrderID = OrdersBOL.GetInternalOrderIDByTransCode(CurTrans.Code);

                            vOrders CurOrder = OrdersBOL.GetOrderByID(InternalOrderID);

                            #region Send Email
                            try
                            {
                                BOLOrderProducts OrderProductsBOL = new BOLOrderProducts(OrderCode);
                                IQueryable<vOrderProducts> OrderProductsList = OrderProductsBOL.GetOrderProducts(CurOrder.Code);
                                string OrderTable = "";

                                foreach (var item in OrderProductsList)
                                {
                                    int ProductPrice = Convert.ToInt32(item.ProductPrice);
                                    int ItemCount = Convert.ToInt32(item.ItemCount);
                                    string ProductName = item.ProductName;

                                    int ProductTotalPrice = ProductPrice * ItemCount;
                                    OrderTable += "<tr >" +
                                        "<td  style=\"text-align:center;font-family:Tahoma;font-size:12px;\">" + Tools.ChageEnc(ProductTotalPrice.ToString()) + "</td>" +
                                        "<td  style=\"text-align:center;font-family:Tahoma;font-size:12px;\">" + Tools.ChangeEnc(ProductPrice.ToString()) + "</td>" +
                                        "<td  style=\"text-align:center;font-family:Tahoma;font-size:12px;\">" + Tools.ChageEnc(ItemCount.ToString()) + "</td>" +
                                        "<td style=\"text-align:center;font-family:Tahoma;font-size:12px;\">" + ProductName + "</td>" +
                                        "<td></td>" +
                                        "</tr>";
                                }

                                EmailTools eTools = new EmailTools();
                                string MailBody = eTools.LoadTemplate("SellFactor");
                                string TinyEmail = "";
                                DateTime dtIranDate = Tools.GetIranDate();
                                DateTimeMethods dtm = new DateTimeMethods();
                                string strSendPrice = "0";

                                MailBody = MailBody.Replace("[ORDERDATE]", Tools.ChageEnc(dtm.GetPersianDate(dtIranDate)));
                                MailBody = MailBody.Replace("[BUYERNAME]", CurOrder.FullName);
                                MailBody = MailBody.Replace("[BUYERADDRESS]", CurOrder.Address);
                                MailBody = MailBody.Replace("[BUYERTEL]", CurOrder.Tel);
                                MailBody = MailBody.Replace("[BUYERPOSTALCODE]", CurOrder.PostalCode);
                                MailBody = MailBody.Replace("[TOTALPRODUCTVAL]", Tools.ChangeEnc(Tools.FormatCurrency(CurOrder.TotalOrderCost.ToString())));
                                MailBody = MailBody.Replace("[SENDCOST]", Tools.ChangeEnc(Tools.FormatCurrency(CurOrder.SendPrice.ToString())));
                                MailBody = MailBody.Replace("[OTHERCOSTS]", Tools.ChangeEnc(CurOrder.OtherCosts.ToString()));
                                MailBody = MailBody.Replace("[POSTALCOST]", strSendPrice);
                                MailBody = MailBody.Replace("[SELLERTEL]", Tools.ChageEnc("77947657"));
                                MailBody = MailBody.Replace("[TOTALVAL]", Tools.ChageEnc(Tools.FormatCurrency(CurOrder.TotalOrderCost.ToString())));
                                MailBody = MailBody.Replace("[Comment]", CurOrder.Description);
                                MailBody = MailBody.Replace("[PostOrderCode]", CurOrder.PostOrderCode);
                                MailBody = MailBody.Replace("[OrderID]", CurOrder.ID);
                                MailBody = MailBody.Replace("[SELLTABLEDETAIL]", OrderTable);

                                Tools tools = new Tools();
                                bool SendResult = tools.SendEmail(MailBody, " ثبت سفارش در  کانلاین " + CurOrder.ID, "noreply@conline.ir", CurOrder.Email, "bidaad@gmail.com", "");


                            }
                            catch
                            {
                            }

                            #endregion
                            try
                            {
                                long intCelPhone = 0;
                                if (CurOrder.CellPhone.Length == 11)
                                {
                                    if (CurOrder.CellPhone.StartsWith("0"))
                                    {
                                        intCelPhone = Convert.ToInt64(CurOrder.CellPhone.Substring(1, CurOrder.CellPhone.Length - 1));
                                        SMSHelper sHelper = new SMSHelper();
                                        sHelper.SendSingleSMS(intCelPhone, "سفارش شما در سایت کانلاین با موفقیت ثبت شد. کد پیگیری: " + InternalOrderID);
                                        sHelper.SendSingleSMS(9123141876, "سفارش شما در سایت کانلاین با موفقیت ثبت شد. کد پیگیری: " + InternalOrderID);
                                        sHelper.SendSingleSMS(9123209794, "سفارش شما در سایت کانلاین با موفقیت ثبت شد. کد پیگیری: " + InternalOrderID);
                                    }
                                }
                            }
                            catch
                            {
                            }



                            if (InternalOrderID != "")
                                ShowOrderInfo(InternalOrderID);
                            return;
                        }
                        else
                        {
                            mainMessage.Visible = false;
                            msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                            msgMessage.Text = "بروز خطا :: ";
                            return;

                        }

                    }
                    else
                    {
                        msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                        msgMessage.Text = "تراکنش شما در سایت بانک ملی با موفقیت همراه نبود";
                        return;

                    }


                }
                else
                {
                    mainMessage.Visible = false;
                    msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgMessage.Text += "تراکنش شما در سایت بانک موفقیت آمیز نبود";
                    return;
                }
            }
            catch (Exception ex)
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgMessage.Text += "بروز خطا : " + ex.Message + "<BR>";
                return;
            }
        }
    }
}