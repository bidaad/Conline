using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.Data;
using AKP.Web.Controls;

namespace ConLine.ProductsFolder
{
    public partial class ShowProduct : System.Web.UI.Page
    {
        public string strHirarchy = "";
        public string ProTitle = "";
        public string strCode = "";
        public string strEnTitle = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox1.Text = "";

            if (Session["UserCode"] == null)
            {
                btnSendComment.Enabled = false;
                txtComment.Enabled = false;
                txtComment.CssClass = "input-text DisabledArea form-control input-lg";
                txtComment.Text = "جهت ثبت نظر می بایست وارد سایت شوید.";
            }
            else
            {
                lblRequestLogin.Visible = false;
            }

            if (!Page.IsPostBack)
            {

                BOLProductCats BOLClass = new BOLProductCats();

                if (Request["RefUserCode"] != null)
                    Session["RefUserCode"] = Request["RefUserCode"];

                strCode = Request["Code"];
                int Code;
                Int32.TryParse(strCode, out Code);
                if (Code != 0)
                {
                    

                    BOLProducts ProductsBOL = new BOLProducts();
                    Products CurProduct = ((IBaseBOL<Products>)ProductsBOL).GetDetails(Code);
                    if (CurProduct != null)
                    {
                    
                        int CatCode = 0;
                        
                        if(CurProduct.ProductCatCode != 0)
                            CatCode = (int)CurProduct.ProductCatCode;
                        ViewState["Code"] = Code.ToString();
                        if (Request.UserAgent == "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" ||
                            Request.UserAgent == "Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)" ||
                            Request.UserAgent == "msnbot/2.0b (+http://search.msn.com/msnbot.htm)._" ||
                            Request.UserAgent == "Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)" ||
                            Request.UserAgent == "Mozilla/5.0 (en-us) AppleWebKit/525.13 (KHTML, like Gecko; Google Web Preview) Version/3.1 Safari/525.13" ||
                            Request.UserAgent == "Mozilla/5.0 (compatible; MJ12bot/v1.3.3; http://www.majestic12.co.uk/bot.php?+)"
                            )
                        {
                            int ff = 1;
                        }
                        else
                        {
                            ProductsBOL.IncrementView(CurProduct.Code);
                            ProductsBOL.IncProVisits(CurProduct.Code);
                        }


                        hplBuy.NavigateUrl = "~/Cart.aspx?ProductCode=" + Code;
                        lblEnTitle.Text = CurProduct.EnTitle;
                        lblFaTitle.Text = CurProduct.FaTitle;

                        strEnTitle = CurProduct.EnTitle;
                        lblDescription.Text = Tools.FormatString(CurProduct.Description);
                        lblPrice.Text = Tools.ChangeEnc(Tools.FormatCurrency( (Convert.ToInt32( CurProduct.Price) / 10).ToString())) + " تومان";

                        int? MarketPrice = CurProduct.MarketPrice;
                        if (MarketPrice != null)
                        {
                            if (MarketPrice > CurProduct.Price)
                            {
                                lblMarketPrice.Text = Tools.ChangeEnc(Tools.FormatCurrency( (Convert.ToInt32( CurProduct.MarketPrice) / 10).ToString())) + " تومان";
                                pnlMarketPrice.Visible = true;
                            }
                        }
                        hplLargePic.NavigateUrl = CurProduct.LargePicFile.Replace("//", "/");
                        imgPicFile.ImageUrl = "~/" + CurProduct.LargePicFile;
                        imgPicFile.ToolTip = CurProduct.FaTitle;
                        imgPicFile.Attributes.Add("data-zoom-image", Page.ResolveUrl( "~/" + CurProduct.LargePicFile));

                        if (CurProduct.HCProductAvailabilityCode == 1)
                        {
                            imgAvailStatus.ImageUrl = "~/images/Available.gif";
                            imgAvailStatus.ToolTip = "موجود";
                        }
                        else
                        {
                            imgAvailStatus.ImageUrl = "~/images/UnAvailable.gif";
                            imgAvailStatus.ToolTip = "ناموجود";
                            hplBuy.Visible = false;
                        }

                        BOLProductColors ProductColorsBOL = new BOLProductColors(1);
                        rptProColors.DataSource = ProductColorsBOL.GetColors(Code);
                        rptProColors.DataBind();

                        if (rptProColors.Items.Count == 0)
                            pnlProColors.Visible = false;

                        BOLProductGaranties ProductGarantiesBOL = new BOLProductGaranties(1);
                        rptProductGaranties.DataSource = ProductGarantiesBOL.GetGaranties(Code);
                        rptProductGaranties.DataBind();

                        if (rptProductGaranties.Items.Count == 0)
                            pnlGaranties.Visible = false;

                        ProTitle = CurProduct.FaTitle;
                        if (string.IsNullOrEmpty(CurProduct.FaTitle))
                            ProTitle = CurProduct.EnTitle;

                        ReqUtils Utils = new ReqUtils();
                        string FullDesc = CurProduct.Description;
                        string BriefDesc = Tools.ShowBriefText(Utils.RemoveTags(FullDesc), 300);
                        Tools.SetMeta("description", BriefDesc);
                        Tools.SetMeta("keywords", ProTitle);

                        Tools.SetMeta("ogTitle", ProTitle);
                        Tools.SetMeta("ogImage", "http://www.ConLine.ir" + CurProduct.LargePicFile.Replace("//", "/"));
                        Tools.SetMeta("ogDescription", BriefDesc);
                        Tools.SetMeta("ogURL", "http://www.ConLine.ir/Products/" + CurProduct.Code + ".htm");



                        Page.Title = ProTitle;
                        KeywordHelperDataContext keywordDC = new KeywordHelperDataContext();
                        rptKeywords.DataSource = keywordDC.KeywordHelpers;//.Where(p => p.CatCode.Equals(CurProduct.ProductCatCode));
                        rptKeywords.DataBind();

                        if (rptKeywords.Items.Count == 0)
                        {
                            rptKeywords.DataSource = keywordDC.KeywordHelpers.Where(p => p.CatCode.Equals(0));
                            rptKeywords.DataBind();
                        }

                        if (CurProduct.Special != null)
                        {
                            if((bool)CurProduct.Special)
                                imgSpecialOfferLBL.Visible = true;
                        }

                        //if (CurProduct.ProductCatCode != null)
                        //{
                        //    SelectedProducts1.CatCode = (int)CurProduct.ProductCatCode;
                        //    RelatedProducts1.ProductCode = CurProduct.Code;
                        //    RelatedProducts1.ShowSelectedProducts();

                        //}
                        //else
                        //    SelectedProducts1.Visible = false;

                        RelatedProducts1.ProductCode = CurProduct.Code;
                        RelatedProducts1.ShowRelatedProducts();
                        if (RelatedProducts1.ItemCount == 0)
                            pnlRelatedProductsLabel.Visible = false;

                        BOLProductComments ProductCommentsBOL = new BOLProductComments();
                        rptComments.DataSource = ProductCommentsBOL.GetProductComments(CurProduct.Code);
                        rptComments.DataBind();


                        BOLProductPictures ProductPicturesBOL = new BOLProductPictures(1);
                        rptProductPictures.DataSource = ProductPicturesBOL.GetAllPictures(CurProduct.Code);
                        rptProductPictures.DataBind();

                        if (rptProductPictures.Items.Count == 0)
                            pnlProPictures.Visible = false;

                        BOLHardCode HardCodeBOL = new BOLHardCode();

                        GetHirarchy(CurProduct.ProductCatCode);
                        ltrHirarchy.Text = strHirarchy;

                        #region Fill Fields
                        #endregion


                        #region Visibility

                        #endregion


                        #region Box Visibility




                        #endregion

                        if (CurProduct.CouponCount != null)
                        {
                            pnlCoupon.Visible = true;
                            lblCouponMessage.Text = "با خرید این محصول " + CurProduct.CouponCount + " کوپن دریافت میکنید. ";
                        }


                        //string[] ProTitleArray = ProTitle.Split(' ');


                    }

                }



            }

        }

        private void GetHirarchy(int? CatCode)
        {
            if (CatCode != null)
            {
                BOLProductCats ProductCatsBOL = new BOLProductCats();
                ProductCats CurCat = ProductCatsBOL.GetCatInfo((int)CatCode);
                strHirarchy = @"<li class=""Sep"">&nbsp; </li><li><span><a href=" + Page.ResolveUrl("~/Products/?C=" + CurCat.Code) + ">" + CurCat.Name + "</a></span></li>" + strHirarchy;
                GetHirarchy(CurCat.MasterCode);
            }
        }
        public string ShowItem(Object obj)
        {
            string Result = "";
            try
            {
                if (obj != null)
                {
                    Result = Convert.ToString(obj);
                    if (Result.Trim() == "")
                        Result = "نامشخص";
                }
                return Result;
            }
            catch
            {
                return "";
            }
        }
        public string ShowDate(Object obj)
        {
            string Result = "";
            try
            {
                if (obj != null)
                {
                    DateTime dtCommentDate = Convert.ToDateTime(obj);
                    DateTimeMethods dtm = new DateTimeMethods();
                    Result = dtm.GetPersianDate(dtCommentDate);
                    Result = Tools.ChangeEnc(Result);
                }
                return Result;
            }
            catch
            {
                return "";
            }
        }
        protected void btnSendComment_Click(object sender, EventArgs e)
        {
            msgBox.Text = "";
            string Name = Session["UserFullName"].ToString();
            string Email = Session["Email"].ToString();
            string Comment = txtComment.Text.Trim();
            if (Comment == "")
            {
                msgBox.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgBox.Text = "لطفا متن را وارد کنید";
                txtComment.Enabled = true;
                CheckBox1.Checked = true;
                return;
            }

            if (ViewState["Code"] != null)
            {
                int ProductCode = Convert.ToInt32(ViewState["Code"]);
                BOLProductComments ProductCommentsBOL = new BOLProductComments();
                bool Result = ProductCommentsBOL.SaveComment(ProductCode, Name, Email, Comment);
                if (Result)
                {
                    msgBox.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                    msgBox.Text = "نظر شما دریافت شد. پس از تایید در لیست نظرات قرار میگیرد";
                    btnSendComment.Visible = false;
                    pnlSendCommentForm.Visible = false;
                }
                else
                {
                    msgBox.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    msgBox.Text = "متاسفانه در ثبت نظر شما خطایی رخ داده است.";
                }


            }
        }

        public string FormatText(Object obj)
        {
            if (obj == null)
                return "";
            ReqUtils rUtil = new ReqUtils();
            return Tools.ShowBriefText(rUtil.RemoveTags(obj.ToString()), 15);

        }

        public string FormatText2(Object obj, int CharCount)
        {
            if (obj == null)
                return "";
            ReqUtils rUtil = new ReqUtils();
            return Tools.ShowBriefText(rUtil.RemoveTags(obj.ToString()), CharCount);

        }

        public string ShowPic(object Title, object PicName)
        {
            string Result = "";
            if (PicName != null && PicName != "")
                Result = "<img class=\"cPic3\" alt=\"" + Title + "" + Title + "\" src=\"" + ((Page)HttpContext.Current.Handler).ResolveUrl("~/" + PicName) + "\" />";
            return Result;
        }

        public string ShowNum(Object obj)
        {
            string Result = "";
            if (obj != null)
            {
                int intCount = Convert.ToInt32(obj);
                if (intCount != 0)
                    Result = "(" + Tools.ChangeEnc(intCount.ToString()) + ")";
            }
            return Result;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!RadCaptcha1.IsValid)
            {
                msgBox1.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgBox1.Text = "کد امنیتی صحیح نیست";
                return;
            }
            if (txtFriendEmail.Text.Trim() == "")
            {
                MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                MsgBoxSendTools.Text = "ایمیل دوست شما معتبر نمیباشد";
                return;
            }
            EmailTools emailTools = new EmailTools();
            string ToEmail = txtFriendEmail.Text;
            string FromEmail = txtFromEmail.Text;
            string ToName = txtFriendName.Text;
            string MyName = txtMyName.Text;


            if (!emailTools.IsValidEmail(ToEmail))
            {
                MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                MsgBoxSendTools.Text = "ایمیل دوست شما معتبر نمیباشد";
                return;
            }
            if (!emailTools.IsValidEmail(FromEmail))
            {
                MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                MsgBoxSendTools.Text = "ایمیل شما معتبر نمیباشد";
                return;
            }

            Tools tools = new Tools();
            string EmailTemplate = emailTools.LoadTemplate("SuggestProduct");//Recommend Product
            EmailTemplate = EmailTemplate.Replace("[ToName]", ToName);
            EmailTemplate = EmailTemplate.Replace("[FromName]", MyName);

            if (ViewState["Code"] != null)
                strCode = ViewState["Code"].ToString();
            int Code;
            Int32.TryParse(strCode, out Code);
            if (Code != 0)
            {
                string SenderID = "";
                if (Session["UserID"] != null)
                    SenderID = Session["UserID"].ToString();

                string RefUserCode = "";
                if (Session["UserCode"] != null)
                    RefUserCode = Session["UserCode"].ToString();
                BOLProducts ProductsBOL = new BOLProducts();
                Products CurProduct = ((IBaseBOL<Products>)ProductsBOL).GetDetails(Code);
                if (CurProduct != null)
                {
                    EmailTemplate = EmailTemplate.Replace("[ProductLink]", "<a style=\"font-weight::bold;\" href='http://www.ConLine.ir/" + CurProduct.EnTitle + "-" + CurProduct.Code + ".html?RefUserCode=" + RefUserCode + "'>" + CurProduct.FaTitle + "</a>");
                }

                CouponsDataContext dc = new CouponsDataContext();
                var Result = dc.Coupons.Where(p => p.Used.Equals(false) && p.HCCouponStatusCode.Equals(1) && p.Val.Equals(20000)).Take(1);
                string CouponID = "";
                if (Result.Count() == 1)
                {
                    CouponID = Result.First().ID;
                    int CouponCode = Result.First().Code;

                    Coupons CurCoupon = dc.Coupons.SingleOrDefault(p => p.Code.Equals(CouponCode));
                    CurCoupon.HCCouponStatusCode = 2;
                    dc.SubmitChanges();
                }

                if (CouponID != "")
                {
                    EmailTemplate = EmailTemplate.Replace("[CouponArea]", @"<table width=""500"" cellspacing=""0"" cellpadding=""0"" border=""0"" bgcolor=""#eeeeed"" align=""center"">
                                    <tbody>
                                    <tr>
                                    <td bgcolor=""#FFFFFF"" style=""font-size:13px;color:#5e5e5e;font-weight:normal;text-align:right;direction:rtl;font-family:Tahoma,Georgia,Times,serif;line-height:24px;vertical-align:top;padding:10px 20px 20px 8px;border:2px solid #fb6642"">
                                    <p style=""text-align:center"">برای استفاده از تخفیف 2000 تومان لطفا در هنگام خرید کد تخفیف
                                    <br>
                                    <span style=""color:#ffffff;display:inline-block;font-size:13px;background-color:#fb6642;padding:5px;margin:15px auto;text-align:center"">
                                    " + CouponID + @"
                                    </span><br>
                                    را در قسمت مربوطه وارد نمایید. <br>
                                    </p>
                                    </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                    ");
                }
                else
                    EmailTemplate = EmailTemplate.Replace("[CouponArea]", "");

                bool SendSellResult = tools.SendEmail(EmailTemplate, CurProduct.FaTitle + " " + MyName, "noreply@ConLine.ir", ToEmail, "bidaad@gmail.com", "");
                if (SendSellResult)
                {
                    MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                    MsgBoxSendTools.Text = "ایمیل با موفقیت ارسال شد.";
                }
                else
                {
                    MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                    MsgBoxSendTools.Text = "متاسفانه در ارسال ایمیل خطایی رخ داده است.";
                }
            }


        }

        protected void btnAddToFav_Click(object sender, EventArgs e)
        {
            Security.Check();
            int UserCode = Convert.ToInt32(Session["UserCode"]);
            int ProductCode = Convert.ToInt32(ViewState["Code"]);

            BOLUserFavorites UserFavoritesBOL = new BOLUserFavorites(1);
            if (!UserFavoritesBOL.Exists(UserCode, ProductCode))
            {
                UserFavoritesBOL.Insert(UserCode, ProductCode);

                MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.OK;
                MsgBoxSendTools.Text = "محصول با موفقیت به لیست مورد علاقه اضافه شد";
            }
            else
            {
                MsgBoxSendTools.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                MsgBoxSendTools.Text = "محصول قبلا به لیست مورد علاقه اضافه شده است";
            }


        }
    }
}