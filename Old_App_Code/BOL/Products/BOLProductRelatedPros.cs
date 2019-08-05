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

public class BOLProductRelatedPros : BaseBOLProductRelatedPros, IBaseBOL<ProductRelatedPros>
{
    public BOLProductRelatedPros(params int[] MCodes)
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

    internal object GetRelatedProducts(int ProductCode, int PageSize, int PageNo)
    {
        int SkipCount = (PageNo - 1) * PageSize;
        var Result = from p in dataContext.vProductRelatedPros
                     where p.ProductCode.Equals(ProductCode)
                     select new { ProductCode = p.RelatedProductCode, FaTitle = p.RelatedProduct, p.SmallPicFile, p.Price, p.EnTitle  };
        return Result.Skip(SkipCount).Take(PageSize);
    }
}
