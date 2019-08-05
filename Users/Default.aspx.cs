using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.Configuration;

namespace ConLine.UsersFolder
{
    public partial class Default : System.Web.UI.Page
    {
        public string ActivateTab = "";
        public int OrderCounter = 0;
        public int FavCounter = 0;
        protected string FormBody = "";

        public string tranKey = ConfigurationManager.AppSettings["BMITransactionKey"];
        public string CardAcqID = ConfigurationManager.AppSettings["BMIMerchantID"];
        public string TerminalId = ConfigurationManager.AppSettings["BMITerminalID"];
        public string ReturnURL = ConfigurationManager.AppSettings["BMIReturnURL"];
        public string ServiceURL = ConfigurationManager.AppSettings["BMIServiceURL"];

        protected void Page_Load(object sender, EventArgs e)
        {
            Security.Check();
            int UserCode = Convert.ToInt32(Session["UserCode"]);

            if (!Page.IsPostBack)
            {
                BOLOrders OrdersBOL = new BOLOrders();
                rptMyOrders.DataSource = OrdersBOL.GetOrdersByUserCode(UserCode);
                rptMyOrders.DataBind();

                BOLProductComments ProductCommentsBOL = new BOLProductComments();
                rptComments.DataSource = ProductCommentsBOL.GetCommentsByUserCode(UserCode);
                rptComments.DataBind();

                BOLUserFavorites UserFavoritesBOL = new BOLUserFavorites(1);
                rptFavorites.DataSource = UserFavoritesBOL.GetListByUserCode(UserCode);
                rptFavorites.DataBind();
                           
                cboGenderCode.DataSource = new BOLHardCode().GetHCDataTable("HCGenders");
                cboGenderCode.DataBind();

                BOLUsers UsersBOL = new BOLUsers();
                Users CurUser = UsersBOL.GetUserByEmail(Session["Email"].ToString());

                txtFirstName.Text = CurUser.FirstName;
                txtLastName.Text = CurUser.LastName;
                txtEmail.Text = CurUser.Email;
                txtPassword.Attributes["value"] = "******";
                txtConfirmPassword.Attributes["value"] = "******";
                cboGenderCode.SelectedValue = CurUser.HCGenderCode.ToString();

                int AccountBalance = UsersBOL.GetBalance(UserCode);
                lblAccountBalance.Text = Tools.FormatCurrency(Tools.ChageEnc(AccountBalance.ToString())) + " ريال ";

                BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(UserCode);
                rptTransList.DataSource = UserTransactionsBOL.GetUserTrans(UserCode);
                rptTransList.DataBind();

                BOLUserCoupons UserCouponsBOL = new BOLUserCoupons(1);
                rptUserCoupons.DataSource = UserCouponsBOL.GetDataByUserCode(UserCode);
                rptUserCoupons.DataBind();

                string ActiveTab = Request["ActiveTab"];
                if (!string.IsNullOrEmpty(ActiveTab))
                {
                    ActivateTab = "activaTab('tab1');";
                }



            }
        }

        public bool IsPayOrderDisabled(Object objHCTransStatusCode)
        {
            bool Result = false;
            if (objHCTransStatusCode != null)
            {
                int HCTransStatusCode = Convert.ToInt32(objHCTransStatusCode);
                if (HCTransStatusCode == 2)
                    Result = false;
                else
                    Result = true;
            }
            else
                Result = true;
            return Result;
        }

        public string PayDisbaled(Object objHCTransStatusCode)
        {
            string Result = "";
            if (objHCTransStatusCode != null)
            {
                int HCTransStatusCode = Convert.ToInt32(objHCTransStatusCode);
                if (HCTransStatusCode == 2)
                    Result = "disabled";
                else
                    Result = "";
            }
            else
                Result = "";
            return Result;
        }
        

        public string ShowAmount(Object obj)
        {
            string Result = "";
            if (obj != null)
            {
                int Val = Convert.ToInt32(obj);
                if (Val < 0)
                    Val = -1 * Val;
                Result = Tools.ChageEnc(Tools.FormatCurrency(Val));
            }
            return Result;
        }

        public string ShowPayDirection(Object obj)
        {
            string Result = "";
            if (obj != null)
            {
                int Val = Convert.ToInt32(obj);
                if (Val < 0)
                    Result = "برداشت از حساب";
                else
                    Result = "واریز به حساب";
            }
            return Result;
        }

        public string ShowClass(Object obj)
        {
            string Result = "";
            if (obj != null)
            {
                int Val = Convert.ToInt32(obj);
                if (Val < 0)
                    Result = "DeductFromAccount";
                else
                    Result = "AddToAccount";
            }
            return Result;
        }

        public string ShowLink(Object obj, Object objCode)
        {
            string Result = "";
            if (obj != null)
            {
                int HCTransStatusCode = Convert.ToInt32(obj);
                if (HCTransStatusCode == 1)
                {
                    Result = "<a href=\"" + Page.ResolveUrl("~/Users/EditFish.aspx?Code=" + objCode.ToString()) + "\">ویرایش</a>";
                }
            }
            return Result;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int UserCode = Convert.ToInt32(Session["UserCode"]);

            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string Email = txtEmail.Text;
            string Password = txtPassword.Text;
            string ConfirmPassword = txtConfirmPassword.Text;



            string strGenderCode = cboGenderCode.SelectedValue;
            int GenderCode = 0;
            Int32.TryParse(strGenderCode, out GenderCode);

            if (string.IsNullOrEmpty(FirstName))
            {
                msgMessage.Text = "لطفا نام را وارد کنید";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }
            if (string.IsNullOrEmpty(LastName))
            {
                msgMessage.Text = "لطفا نام خانوادگی را وارد کنید";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }

            if (string.IsNullOrEmpty(Password))
            {
                msgMessage.Text = "لطفا کلمه عبور را وارد کنید";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }

            if (Password != ConfirmPassword)
            {
                msgMessage.Text = "کلمه عبور و تایید کلمه عبور با یکدیگر برابر نیستند";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }

            BOLUsers UsersBOL = new BOLUsers();


            UsersBOL.Update(UserCode, FirstName, LastName, Email, Password, GenderCode);
            if (UserCode != -1)
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                msgMessage.Text = "تغییرات با موفقیت انجام شد.";
            }

        }



        protected void btnAddCoupon_Click(object sender, EventArgs e)
        {
            string CouponID = txtCouponID.Text;
            
            if (string.IsNullOrEmpty(CouponID))
            {
                msgMessage.Text = "کوپن معتبر نيست";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }
            BOLCoupons CouponsBOL = new BOLCoupons();
            if (!CouponsBOL.IsValidAndUnused(CouponID))
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgMessage.Text = "کوپن معتبر نمیباشد";
                return;
            }


            try
            {
                int UserCode = Convert.ToInt32(Session["UserCode"]);
                BOLUserCoupons UserCouponsBOL = new BOLUserCoupons(1);
                Coupons CurCoupon = CouponsBOL.GetDetailByID(CouponID);
                UserCouponsBOL.Insert(UserCode, CurCoupon.Code);
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                msgMessage.Text = "کوپن با موفقیت اضافه شد" ;

                rptUserCoupons.DataSource = UserCouponsBOL.GetDataByUserCode(UserCode);
                rptUserCoupons.DataBind();

            }
            catch (Exception err)
            {
                msgMessage.Text = "بروز خطا در اضافه کردن کوپن" ;
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }

        }

        protected void btnUpdateAccount_Click(object sender, EventArgs e)
        {
            object strAddVal = txtAmount.Value;
            int AddAmount;
            Int32.TryParse(strAddVal.ToString(), out AddAmount);
            if (AddAmount == 0)
            {
                msgMessage.Text = "مبلغ معتبر نيست";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }
            else if (AddAmount < 10)
            {
                msgMessage.Text = "مبلغ شارژ نبايد كمتر از 10 ريال باشد.";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }
            else if (AddAmount > 100000000)
            {
                msgMessage.Text = "مبلغ شارژ نبايد بیشتر از 100000000 ريال باشد.";
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                return;
            }

            int UserCode = Convert.ToInt32(Session["UserCode"]);
            string UserIP = "";

            try
            {
                BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(UserCode);
                int UserTransactionCode = UserTransactionsBOL.Insert(UserCode, DateTime.Now, 1, 1, UserIP, AddAmount, 5);
                long OrderId = Convert.ToInt64(UserTransactionCode);
                string AdditionalData = "";
                string requestKey; // request key

                ir.bmi.bmiutility4.MerchantUtility utl = new ir.bmi.bmiutility4.MerchantUtility();
                utl.Url = ServiceURL;

                FormBody = utl.PaymentUtilityAdditionalData(CardAcqID, AddAmount, OrderId, tranKey, TerminalId, ReturnURL,
                                                            AdditionalData, out requestKey);
                bool UpdateResult = UserTransactionsBOL.UpdateRequestKey(UserTransactionCode, requestKey);
                if (UpdateResult)
                {
                    FormBody += "</form><script> document.getElementById('paymentUTLfrm').submit();</script>";
                    ((Literal)Master.FindControl("ltrForm")).Text = FormBody;
                }
                else
                {
                    msgMessage.Text = "خطا در برقراری ارتباط با سرور بانک ملی";
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

        protected void HandleRepeaterCommand(object source, RepeaterCommandEventArgs e)
        {
            int UserCode = Convert.ToInt32(Session["UserCode"]);

            if (e.CommandName == "RemoveFromFavorites")
            {
                ImageButton btnRemove = (ImageButton)e.Item.FindControl("btnRemove");

                int Code = Convert.ToInt32(btnRemove.Attributes["Code"]);
                BOLUserFavorites UserFavoritesBOL = new BOLUserFavorites(1);
                if (Code != 0)
                {
                    UserFavoritesBOL.Delete(Code, UserCode);

                    rptFavorites.DataSource = UserFavoritesBOL.GetListByUserCode(UserCode);
                    rptFavorites.DataBind();
                }
            }

        }

        protected void rptMyOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            OrderCounter++;
        }

        protected void rptFavorites_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            FavCounter++;
        }
    }
}
