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

public class BOLCoupons : BaseBOLCoupons, IBaseBOL<Coupons>
{
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
    public bool IsValidAndUnused(string CouponID)
    {
        CouponsDataContext dc = new CouponsDataContext();
        ConLine.Old_App_Code.DAL.Coupons CurCoupon = dc.Coupons.SingleOrDefault(p => p.ID == CouponID && p.Used == false);
        if (CurCoupon != null)
            return true;
        else
            return false;

    }

    internal int GetCouponCount(string CouponID)
    {
        CouponsDataContext dc = new CouponsDataContext();
        ConLine.Old_App_Code.DAL.Coupons CurCoupon = dc.Coupons.SingleOrDefault(p => p.ID == CouponID && p.Used == false);
        if (CurCoupon != null)
            return (int)CurCoupon.CouponCount;
        else
            return 0;
    }

    internal bool MarkUsed(string CouponID)
    {
        try
        {
            CouponsDataContext dc = new CouponsDataContext();
            ConLine.Old_App_Code.DAL.Coupons CurCoupon = dc.Coupons.SingleOrDefault(p => p.ID == CouponID);
            if (CurCoupon != null)
            {
                CurCoupon.Used = true;
                dc.SubmitChanges();
            }
            return true;
        }
        catch
        {
            return false;
        }
    }

    internal Coupons GetDetailByID(string CouponID)
    {
        return dataContext.Coupons.SingleOrDefault(p => p.ID.Equals(CouponID));
    }

    internal int GetCouponVal(string CouponID)
    {
        Coupons CurCoupon =  dataContext.Coupons.SingleOrDefault(p => p.ID.Equals(CouponID));
        if (CurCoupon != null)
        {
            if (CurCoupon.HCCouponTypeCode == 1)
                return Convert.ToInt32(CurCoupon.Val);
        }
        return 0;
    }
}
