﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;

namespace ConLine.UsersFolder
{
    public partial class ForgotPassword : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GetRandID()
        {
            Random RandomNumber = new Random();
            double dblRandRowIndex = RandomNumber.NextDouble();
            string strRandNum = dblRandRowIndex.ToString();
            string GenID = strRandNum.Substring(2, strRandNum.Length - 2);
            return GenID;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text;
            AccessLevelDataContext dc = new AccessLevelDataContext();


            if (Email.Trim() == "")
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgMessage.Text = "لطفا ایمیل را وارد کنید";
                return;
            }

            Users CurUser = dc.Users.SingleOrDefault(p => p.Email.Equals(Email));
            if (CurUser != null)
            {
                string NewGenKey = GetRandID();
                string MailBody = "<div style=\"fot-family:Tahoma;direction:rtl\"> لطفا برای بازیابی کلمه عبور خود در سایت کانلاین روی لینک زیر کلیک کنید:" + "<br /><br />" +
                                  "<a href='http://www.ConLine.ir/Users/ForgotPassword2.aspx?GenKey=" + NewGenKey + "'>http://www.ConLine.ir/Users/ForgotPassword2.aspx?GenKey=" + NewGenKey + "</a></div>";

                Tools tools = new Tools();
                bool SendResult = tools.SendEmail(MailBody, "بازیابی کلمه عبور", "noreply@ConLine.ir", "bidaad@gmail.com", "", "");

                if (SendResult)
                {
                    ForgotPasswords NewFP = new ForgotPasswords();
                    NewFP.UserCode = CurUser.Code;
                    NewFP.GenKey = NewGenKey;
                    NewFP.GenTime = DateTime.Now;
                    NewFP.Used = false;
                    dc.ForgotPasswords.InsertOnSubmit(NewFP);
                    dc.SubmitChanges();

                    msgMessage.Text = "مشخصات لازم برای بازیابی کلمه عبور به ایمیل " + Email + " ارسال شد. ";
                    pnlSend.Visible = false;
                }
                else
                {
                    msgMessage.Text = "متاسفانه در ارسال ایمیل بازیابی خطایی رخ داده است";
                }

            }
            else
            {
                msgMessage.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
                msgMessage.Text = "کاربری با این ایمیل یافت نشد";
            }


        }
    }
}