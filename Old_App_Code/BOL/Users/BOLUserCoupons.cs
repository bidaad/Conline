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

public class BOLUserCoupons : BaseBOLUserCoupons, IBaseBOL<UserCoupons>
{
    public BOLUserCoupons(params int[] MCodes)
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

    internal void Insert(int UserCode, int CouponCode)
    {
        UserCoupons NewUserCoupon = new UserCoupons();
        NewUserCoupon.UserCode = UserCode;
        NewUserCoupon.CouponCode = CouponCode;
        NewUserCoupon.ExpDate = DateTime.Now.AddMonths(1);

        dataContext.UserCoupons.InsertOnSubmit(NewUserCoupon);
        dataContext.SubmitChanges();
    }

    internal object GetDataByUserCode(int UserCode)
    {
        return dataContext.vUserCoupons.Where(p => p.UserCode.Equals(UserCode));
    }
}
