using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ConLine.Old_App_Code.DAL;

namespace ConLine.Old_App_Code.BOL.Users
{
    public class BOLUserOrders
    {
        internal bool OrderExists(int OrderCode)
        {
            AccessLevelDataContext dc = new AccessLevelDataContext();
            return dc.UserOrders.Where(p => p.OrderCode.Equals(OrderCode)).Count() > 0;
        }

        internal void InsertOrder(int UserCode, int OrderCode)
        {
            AccessLevelDataContext dc = new AccessLevelDataContext();
            UserOrders NewOrder = new UserOrders();
            dc.UserOrders.InsertOnSubmit(NewOrder);
            NewOrder.UserCode = UserCode;
            NewOrder.OrderCode = OrderCode;
            NewOrder.ConfirmDate = DateTime.Now;
            dc.SubmitChanges();
        }
    }
}