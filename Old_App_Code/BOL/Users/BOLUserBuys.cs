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

public class BOLUserBuys : BaseBOLUserBuys, IBaseBOL<UserBuys>
{
    public BOLUserBuys(params int[] MCodes)
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

    public int InsertRecord(int TransactionCode, string FirstName, string LastName, string Email, string Phone, int? RefUserCode)
    {
        UserBuys NewUserBuy = new UserBuys();
        dataContext.UserBuys.InsertOnSubmit(NewUserBuy);
        NewUserBuy.TransactionCode = TransactionCode;
        NewUserBuy.FirstName = FirstName;
        NewUserBuy.LastName = LastName;
        NewUserBuy.Email = Email;
        NewUserBuy.Phone = Phone;
        NewUserBuy.RefUserCode = RefUserCode;
        dataContext.SubmitChanges();
        return NewUserBuy.Code;
    }

    public IQueryable<vUserBuys> GetUserBuys(int? UserCode, int _pageSize, int PageNo)
    {
        int SkipCount = (PageNo - 1) * _pageSize;
        return dataContext.vUserBuys.Where(p => p.UserCode.Equals(UserCode)).OrderByDescending(p=> p.Code).Skip(SkipCount).Take(_pageSize);
    }

    public int GetUserBuysCount(int? UserCode)
    {
        return dataContext.vUserBuys.Where(p => p.UserCode.Equals(UserCode)).Count();
    }

    public int UpdateAuthority(int FactorNo, string Authority)
    {
        UserBuys CurUserBuy = dataContext.UserBuys.SingleOrDefault(p => p.Code.Equals(FactorNo));
        if (CurUserBuy != null)
        {
            UserTransactions CurCtrans = dataContext.UserTransactions.SingleOrDefault(p => p.Code.Equals(CurUserBuy.TransactionCode));
            if (CurCtrans != null)
            {
                CurCtrans.Authority = Authority;
                dataContext.SubmitChanges();
                return 0;
            }
            else
                return -1;
        }
        else
            return -1;
    }
}
