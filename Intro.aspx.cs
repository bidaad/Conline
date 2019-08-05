﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConLine
{
    public partial class Intro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UCProductListSepcial.ShowSpecialProducts();
            UCProductListNew.ShowNewProducts();
            UCProductListMostSold.ShowMostSoldProducts();
            UCProductListDiscount.ShowDiscountProducts();

        }
    }
}