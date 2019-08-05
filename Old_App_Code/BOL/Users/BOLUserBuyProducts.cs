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

public class BOLUserBuyProducts : BaseBOLUserBuyProducts, IBaseBOL<UserBuyProducts>
{
    public BOLUserBuyProducts(params int[] MCodes)
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

    public int InsertRecord(int BuyCode, int ProductCode, int Amount, int Quantity, int Porsant)
    {
        UserBuyProducts NewUserBuyProduct = new UserBuyProducts();
        dataContext.UserBuyProducts.InsertOnSubmit(NewUserBuyProduct);
        NewUserBuyProduct.BuyCode = BuyCode;
        NewUserBuyProduct.ProductCode = ProductCode;
        NewUserBuyProduct.Amount = Amount;
        NewUserBuyProduct.Quantity = Quantity;
        NewUserBuyProduct.Porsant = Porsant;

        dataContext.SubmitChanges();
        return NewUserBuyProduct.Code;
    }

    public IQueryable<vUserBuyProducts> GetBuyProducts(int BuyCode)
    {
        return dataContext.vUserBuyProducts.Where(p => p.BuyCode.Equals(BuyCode));
    }
}
