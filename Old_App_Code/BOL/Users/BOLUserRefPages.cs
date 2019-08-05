using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Collections.Generic;
using ConLine.Old_App_Code.DAL;

public class BOLUserRefPages : BaseBOLUserRefPages, IBaseBOL<UserRefPages>
{
    public BOLUserRefPages(params int[] MCodes)
        : base(MCodes)
    {

    }
    public IList CheckBusinessRules()
    {
        var messages = new List<string>();

        #region Business Rules
        //Example
        //if (string.IsNullOrEmpty(this.FirstName))
        //    messages.Add("Please fill FirstName.");

        #endregion
        return messages;
    }

    public bool IsValidClick(int UserCode, string RefIP)
    {
        AccessLevelDataContext dc = new AccessLevelDataContext();
        var LastReqResult = dc.UserRefPages.Where(p => p.UserCode.Equals(UserCode) && p.RefIP.Equals(RefIP)).OrderByDescending(p => p.Code).Take(1);//.GetEnumerator().Current ;
        if (LastReqResult.Count() == 0)
            return true;
        else
        {
            foreach (var item in LastReqResult)
            {
                if (item.RefDate.AddDays(30).CompareTo(Tools.GetIranDate()) < 0)
                    return true;
                else
                    return false;

            }
            return false;
        }

    }
    public int Insert(int UserCode, string Referrer, string RefIP)
    {
        UserRefPages NewRefPage = new UserRefPages();
        dataContext.UserRefPages.InsertOnSubmit(NewRefPage);
        NewRefPage.UserCode = UserCode;
        NewRefPage.RefDate = Tools.GetIranDate();
        NewRefPage.Referrer = Referrer;
        NewRefPage.RefIP = RefIP;
        NewRefPage.TotalProductPrice = 0;
        NewRefPage.TotalPorsant = 0;
        dataContext.SubmitChanges();
        return NewRefPage.Code;
    }

    public void Update(object Code, int UserCode, int BuyCode, int TotalProductPrice, int TotalPorsant)
    {
        try
        {
            UserRefPages NewRefPage = dataContext.UserRefPages.SingleOrDefault(p => p.Code.Equals(Code));
            if (NewRefPage != null)
            {
                NewRefPage.BuyCode = BuyCode;
                NewRefPage.TotalProductPrice = TotalProductPrice;
                NewRefPage.TotalPorsant = TotalPorsant;
                dataContext.SubmitChanges();
            }
        }
        catch
        {
        }
    }

    public object GenReport(int p, DateTime? FromDate, DateTime? ToDate)
    {
        throw new NotImplementedException();
    }

    public object GenReport(int UserCode, string FromDate, string ToDate)
    {
        return dataContext.vUserRefReports.Where(p=> p.UserCode.Equals(UserCode) && (p.RDate.CompareTo(FromDate) >= 0 && p.RDate.CompareTo(ToDate) <= 0));
    }
}
