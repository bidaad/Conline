using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ConLine.Old_App_Code.DAL;
using System.IO;

namespace ConLine.UsersFolder
{
    public partial class UserTrans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserCode"] == null)
            {
                Response.Redirect("~/Users/Login.aspx");
                return;
            }

            int UserCode = Convert.ToInt32(Session["UserCode"]);

            if (!Page.IsPostBack)
            {
                BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(1);
                rptUserTrans.DataSource = UserTransactionsBOL.GetUserTrans(UserCode);
                rptUserTrans.DataBind();
            }

        }

        public bool IsVisible(int Code)
        {
            BOLUserTransactions UserTransactionsBOL = new BOLUserTransactions(1);
            UserTransactions CurTrans = UserTransactionsBOL.GetDetails(Code);
            if (CurTrans.PayDate.Value.CompareTo(DateTime.Now.AddDays(1)) >= 1)
                return false;
            else
                return true;

        }

        public string GetItemName(Object obj)
        {
            string Result = "";
            string objItemType = obj.ToString();
            switch (objItemType)
            {
                case "Booklet":
                    Result = "جزوه";
                    break;
                case "Exam":
                    Result = "آزمون آزمایشی";
                    break;
                default:
                    break;
            }

            return Result;
        }

        private void StartDowload(string ItemType, string PDFFile)
        {
            byte[] pdfByte = System.IO.File.ReadAllBytes(Server.MapPath("~/" + PDFFile));

            Guid newGd = Guid.NewGuid();
            string RandFileName = ItemType + newGd.ToString().Replace("-", "");

            Response.Clear();
            MemoryStream ms = new MemoryStream(pdfByte);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + RandFileName + ".pdf");
            Response.AddHeader("Content-Length", pdfByte.Length.ToString());
            Response.Buffer = true;


            ms.WriteTo(Response.OutputStream);
            //Response.End();
        }

    }
}