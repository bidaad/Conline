using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.Common;
using System.Configuration;

namespace ConLine
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string SMSUsername = ConfigurationManager.AppSettings["SMSUsername"];
        string SMSPassword = ConfigurationManager.AppSettings["SMSPassword"];

        protected void Page_Load(object sender, EventArgs e)
        {
            ir.sms.n.SendReceive ws = new ir.sms.n.SendReceive();
            string message = string.Empty;

            ir.sms.n.SMSLineNumber[] smsLines;
            smsLines = ws.GetSMSLines(SMSUsername, SMSPassword, ref message);
            int IDFiled1 = smsLines[0].ID;

            string strID = IDFiled1.ToString();



            SMSHelper sHelper = new SMSHelper();
            sHelper.SendSingleSMS(9123209794, "متن آزمایشی یک");

        }
    }
}