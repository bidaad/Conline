using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.Data;
using System.Configuration;
using ConLine.biz.setap.ws;

namespace ConLine
{
    public partial class Review : System.Web.UI.Page
    {

        int TotalAmount = 0;
        int OtherCosts = 0;

        public int SendPrice;
        public int TotalPrice;
        public int ProductPrice;
        public ConLine.biz.setap.ws.SendPriceResult PayeganSendPrice;
        int TotalWeight;

        protected void Page_Load(object sender, EventArgs e)
        {

            Security.Check();
            int UserCode = Convert.ToInt32(Session["UserCode"]);

            if (Session["dtOrders"] == null)
            {
                Response.Redirect("~/");
                return;
            }


            if (!Page.IsPostBack)
            {
                int intDeliverType = Convert.ToInt32(Session["DeliverType"]);
                int intAddressCode = Convert.ToInt32(Session["AddressCode"]);

                BOLHardCode HardCodeBOL = new BOLHardCode();
                HardCodeBOL.TableOrViewName = "HCSendTypes";
                lblSendType.Text = HardCodeBOL.GetNameByCode(intDeliverType);
                BOLUserAddresses UserAddressesBOL = new BOLUserAddresses(UserCode);
                vUserAddresses CurAddress = UserAddressesBOL.GetFullDetails(intAddressCode);
                lblFullName.Text = CurAddress.FullName;
                lblAddress.Text = CurAddress.Province + " " + CurAddress.City + " " + CurAddress.Address ;
                lblContactNumber.Text = CurAddress.CellPhone + " " + CurAddress.Tel;
                lblDiscount.Text = Tools.ChangeEnc("0");

                if (TotalAmount < 500000)
                {
                    OtherCosts = 50000;
                    lblOtherCosts.Text = Tools.ChangeEnc("5000");
                    lblSendCost.Text = Tools.ChangeEnc("5000");
                }
                else
                {
                    OtherCosts = 0;
                    lblOtherCosts.Text = Tools.ChangeEnc("0");
                    lblSendCost.Text = Tools.ChangeEnc("0");
                }
                

                if (Session["dtOrders"] != null)
                {
                    DataTable dt = (DataTable)Session["dtOrders"];
                    if (dt.Rows.Count > 0)
                    {
                        CalcTotalAmount(dt);

                        lblBasketHeader.Text = "سبد خرید";
                        rptBasket.DataSource = dt;
                        rptBasket.DataBind();

                        if (Session["UserCode"] != null)
                        {
                            BOLUsers UsersBOL = new BOLUsers();
                            Users CurUser = ((IBaseBOL<Users>)UsersBOL).GetDetails(UserCode);
                            int AccountBalance = 0;
                            if (CurUser.AccountBalance != null)
                            {
                                AccountBalance = UsersBOL.GetBalanace(UserCode);
                            }
                        }
                    }
                    else
                    {
                        lblBasketHeader.Text = "سبد خرید خالی است.";
                        
                    }
                }

            }

        }


        private SendPriceResult CalcSendPrice(string TotalWeight, string strCityCode)
        {
            ConLine.biz.setap.ws.Service PayeganService = new biz.setap.ws.Service();
            string PayeganSalesRoomCode = ConfigurationManager.AppSettings["PayeganSalesRoomCode"];
            string PayeganUsername = ConfigurationManager.AppSettings["PayeganUsername"];
            string PayeganPassword = ConfigurationManager.AppSettings["PayeganPassword"];
            return PayeganService.GetSendPrice(PayeganSalesRoomCode, PayeganUsername, PayeganPassword, TotalWeight, TotalAmount.ToString(), strCityCode);
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Payment.aspx");

            }
            catch (Exception errCalcPrice)
            {
                Tools tools = new Tools();
                string errMailBody = errCalcPrice.Message;
                //bool SenderrResult = tools.SendEmail(errMailBody, " خطا در  کانلاین ", "admin@ConLine.com", "bidaad@gmail.com", "", "");

                return;
            }
        }
        
        private void CalcTotalAmount(DataTable dt)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int Amount = Convert.ToInt32(dt.Rows[i]["ProductPrice"]);
                int Quantity = Convert.ToInt32(dt.Rows[i]["ItemCount"]);
                int CurWeight = Convert.ToInt32(dt.Rows[i]["ProductTotalWeight"]);

                TotalAmount += (Amount * Quantity);
                TotalWeight += CurWeight;
            }
            //TotalAmount += OtherCosts;
            lblTotalAmount.Text = Tools.FormatCurrency(Tools.ChangeEnc((TotalAmount / 10 ).ToString()));
            lblTotalOrderPrice.Text = Tools.FormatCurrency(Tools.ChangeEnc((TotalAmount / 10 + OtherCosts / 10).ToString()));
        }
        
        
    }
}