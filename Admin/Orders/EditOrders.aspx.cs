using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using ConLine.Old_App_Code.DAL;
using ConLine.Old_App_Code.BOL.Users;

using System.Data;
using ConLine.Old_App_Code.Common;


public partial class Orders_EditOrders : EditForm<Orders>
{
    private string BaseID = "Orders";
    IBaseBOL<Orders> BaseBOL;



    protected void Page_Load(object sender, EventArgs e)
    {
        #region Tab Pages
        if (!NewMode)
            ShowDetails();
        else
        {
            RadMultiPage1.SelectedIndex = 0;
            tsOrders.Tabs[0].Selected = true;
        }
        #endregion
        BOLClass = new BOLOrders();
        lblSysName.Text = BOLClass.PageLable;

        if ((Code == null) && (!NewMode)) return;
        if (!Page.IsPostBack)
        {
            //if (!NewMode) ShowDetails();


            #region Fill Combo
            cboHCGenderCode.DataSource = new BOLHardCode().GetHCDataTable("HCGenders");
            cboHCSendTypeCode.DataSource = new BOLHardCode().GetHCDataTable("HCSendTypes");
            cboHCOrderStatusCode.DataSource = new BOLHardCode().GetHCDataTable("HCOrderStatuses");
            //cboHCPayMethodCode.DataSource = new BOLHardCode().GetHCDataTable("HCPayMethods");
            //cboHCOrderPayStatusCode.DataSource = new BOLHardCode().GetHCDataTable("HCOrderPayStatuses");

            #endregion
            if (!NewMode)
            {
                LoadData((int)Code);
                BOLOrders OrdersBOL = new BOLOrders();
                vOrders CurOrder = OrdersBOL.GetFullDetails((int)Code);

                if(CurOrder.HCTransStatusCode != 2)
                    txtPayLink.Text = "http://www.conline.ir/Payment.aspx?OrderID=" + CurOrder.ID;

                if (CurOrder.HCPayMethodCode != null)
                    lblHCPayMethod.Text = Tools.GetListTitle("HCPayMethods", (int)CurOrder.HCPayMethodCode);

                if (CurOrder.HCTransStatusCode == 2)
                    lblHCOrderPayStatus.Text = "پرداخت شده";
                else
                    lblHCOrderPayStatus.Text = "پرداخت نشده";


            }
        }


    }


    protected void btnSendSMS_Click(object sender, EventArgs e)
    {
        BOLOrders OrdersBOL = new BOLOrders();
        vOrders CurFullOrder = OrdersBOL.GetFullDetails((int)Code);
        long intCelPhone = 0;
        if (CurFullOrder.CellPhone.Length == 11)
        {
            if (CurFullOrder.CellPhone.StartsWith("0"))
            {
                intCelPhone = Convert.ToInt64(CurFullOrder.CellPhone.Substring(1, CurFullOrder.CellPhone.Length - 1));
                SMSHelper sHelper = new SMSHelper();
                sHelper.SendSingleSMS(intCelPhone, txtSMS.Text );

                msgBox.Text = "ارسال پیامک با موفقیت انجام شد";
            }
        }

    }
    protected void btnPrintFactor_Click(object sender, EventArgs e)
    {
        
        CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        pnlReport.Visible = true;
        ReportDocument doc = new ReportDocument();

        //vUsersTableAdapter TableAdapter = new vUsersTableAdapter();
        //DataTable dt = TableAdapter.GetData();

        //DataView dv = dt.DefaultView;

        //if (FilterStr != "")
        //    dv.RowFilter = FilterStr;
        //if (SortCols != "")
        //    dv.Sort = SortCols;
        //DataTable dtFinal = dv.ToTable();

        DateTimeMethods dtm = new DateTimeMethods();

        string WhereCaluse = "";
        Tools tools = new Tools();
        string SqlStr = @"SELECT [Code]      ,[OrderCode]      ,[ProductName]      ,[ProductStatus]      ,[Weight]      ,[ProductPrice]      ,[ItemCount]  FROM [vOrderProducts] where OrderCode =" + Code;

        DataTable dtFinal = tools.GetDataTable(SqlStr);

        BOLOrders OrderBOl = new BOLOrders();
        vOrders CurOrder = OrderBOl.GetFullDetails((int)Code);

        string BuyerName = CurOrder.FullName;
        string BuyerTels = CurOrder.Tel + " " + CurOrder.CellPhone;
        string BuyerAddress = CurOrder.Address;
        string BuyerPostalCode = CurOrder.PostalCode;
        string TotalOrderAmount = CurOrder.TotalOrderCost.ToString();
        string OrderID = CurOrder.ID;
        string OrderDate = CurOrder.CDate;

        ParameterFields paramFields = new ParameterFields();

        ParameterField paramOrderDateField = new ParameterField();
        ParameterDiscreteValue paramOrderDateDiscreteValue = new ParameterDiscreteValue();
        paramOrderDateField.Name = "paramOrderDate";
        paramOrderDateDiscreteValue.Value = OrderDate;
        paramOrderDateField.CurrentValues.Add(paramOrderDateDiscreteValue);
        paramFields.Add(paramOrderDateField);


        ParameterField paramBuyerNameField = new ParameterField();
        ParameterDiscreteValue paramBuyerNameDiscreteValue = new ParameterDiscreteValue();
        paramBuyerNameField.Name = "paramBuyerName";
        paramBuyerNameDiscreteValue.Value = BuyerName;
        paramBuyerNameField.CurrentValues.Add(paramBuyerNameDiscreteValue);
        paramFields.Add(paramBuyerNameField);

        ParameterField paramBuyerAddressField = new ParameterField();
        ParameterDiscreteValue paramBuyerAddressDiscreteValue = new ParameterDiscreteValue();
        paramBuyerAddressField.Name = "paramBuyerAddress";
        paramBuyerAddressDiscreteValue.Value = BuyerAddress;
        paramBuyerAddressField.CurrentValues.Add(paramBuyerAddressDiscreteValue);
        paramFields.Add(paramBuyerAddressField);

        ParameterField paramBuyerTelsField = new ParameterField();
        ParameterDiscreteValue paramBuyerTelsDiscreteValue = new ParameterDiscreteValue();
        paramBuyerTelsField.Name = "paramBuyerTels";
        paramBuyerTelsDiscreteValue.Value = BuyerTels;
        paramBuyerTelsField.CurrentValues.Add(paramBuyerTelsDiscreteValue);
        paramFields.Add(paramBuyerTelsField);

        ParameterField paramBuyerPostalCodeField = new ParameterField();
        ParameterDiscreteValue paramBuyerPostalCodeDiscreteValue = new ParameterDiscreteValue();
        paramBuyerPostalCodeField.Name = "paramBuyerPostalCode";
        paramBuyerPostalCodeDiscreteValue.Value = BuyerPostalCode;
        paramBuyerPostalCodeField.CurrentValues.Add(paramBuyerPostalCodeDiscreteValue);
        paramFields.Add(paramBuyerPostalCodeField);

        ParameterField paramTotalOrderAmountField = new ParameterField();
        ParameterDiscreteValue paramTotalOrderAmountDiscreteValue = new ParameterDiscreteValue();
        paramTotalOrderAmountField.Name = "paramTotalOrderAmount";
        paramTotalOrderAmountDiscreteValue.Value = TotalOrderAmount;
        paramTotalOrderAmountField.CurrentValues.Add(paramTotalOrderAmountDiscreteValue);
        paramFields.Add(paramTotalOrderAmountField);

        ParameterField paramOrderIDField = new ParameterField();
        ParameterDiscreteValue paramOrderIDDiscreteValue = new ParameterDiscreteValue();
        paramOrderIDField.Name = "paramOrderID";
        paramOrderIDDiscreteValue.Value = OrderID;
        paramOrderIDField.CurrentValues.Add(paramOrderIDDiscreteValue);
        paramFields.Add(paramOrderIDField);


        ParameterField paramOtherCostField = new ParameterField();
        ParameterDiscreteValue paramOtherCostDiscreteValue = new ParameterDiscreteValue();
        paramOtherCostField.Name = "paramOtherCosts";
        paramOtherCostDiscreteValue.Value = CurOrder.OtherCosts;
        paramOtherCostField.CurrentValues.Add(paramOtherCostDiscreteValue);
        paramFields.Add(paramOtherCostField);

        CrystalReportViewer1.ParameterFieldInfo = paramFields;

        CrystalReportSource1.EnableCaching = false;
        CrystalReportSource1.ReportDocument.SetDataSource(dtFinal);
    }


    protected void DoSave(object sender, EventArgs e)
    {
        try
        {
            BOLOrders OrdersBOL = new BOLOrders();
            Orders CurOrder = ((IBaseBOL<Orders>)OrdersBOL).GetDetails((int)Code);
            bool PostOrderCodeWasEmptyBefore = true;

            if (string.IsNullOrEmpty(CurOrder.PostOrderCode))
                PostOrderCodeWasEmptyBefore = true;
            else
                PostOrderCodeWasEmptyBefore = false;

            int ReturnCode = SaveControls("~/Main/Default.aspx?BaseID=" + BaseID);
            if (NewMode && ReturnCode != -1)
            {
                NewMode = false;
                Code = ReturnCode;
                ShowDetails();
            }
            if (ReturnCode != -1)
            {
                if (PostOrderCodeWasEmptyBefore && txtPostOrderCode.Text != "")
                {
                    vOrders CurFullOrder = OrdersBOL.GetFullDetails((int)Code);
                    long intCelPhone = 0;
                    if (CurFullOrder.CellPhone.Length == 11)
                    {
                        if (CurFullOrder.CellPhone.StartsWith("0"))
                        {
                            intCelPhone = Convert.ToInt64(CurFullOrder.CellPhone.Substring(1, CurFullOrder.CellPhone.Length - 1));
                            SMSHelper sHelper = new SMSHelper();
                            sHelper.SendSingleSMS(intCelPhone, "سفارش شما در سایت کانلاین تحویل پست شد.\n کد پیگیری پست: " + txtPostOrderCode.Text);
                        }
                    }

                }


                int HCOrderStatusCode = Convert.ToInt32(cboHCOrderStatusCode.SelectedValue);
                if (HCOrderStatusCode == 4)// تکمیل شده
                {


                    BOLUserOrders UserOrdersBOL = new BOLUserOrders();
                    BOLUsers UsersBOL = new BOLUsers();
                    if (!UserOrdersBOL.OrderExists(ReturnCode))
                    {
                        int CreditVal = 0;
                        int TotalProductPrice = (int)CurOrder.TotalProductPrice;
                        CreditVal = TotalProductPrice * 2 / 50;
                        UserOrdersBOL.InsertOrder((int)CurOrder.UserCode, ReturnCode);
                        UsersBOL.UpdateBalance((int)CurOrder.UserCode, CreditVal);
                    }

                }

            }
        }
        catch (Exception err)
        {
            msgBox.Text = "بروز خطا " + err.Message;
            msgBox.MessageTextMode = AKP.Web.Controls.Common.MessageMode.Error;
        }
    }
    private void ShowDetails()
    {
        string Tab1Click = "BrowseObj1.ShowDetail('OrderProducts', '" + Code + "', true,'BrowseObj1');";

        Tab1.Attributes.Add("onclick", Tab1Click);
        Tools.SetClientScript(this, "ActiveTab1", Tab1Click);
    }
}
