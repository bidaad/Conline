<%@ Page Language="C#" StylesheetTheme="Edit" MasterPageFile="~/Admin/Main.master"
    AutoEventWireup="true" Inherits="Orders_EditOrders" Title="Orders" CodeBehind="EditOrders.aspx.cs" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="cphMain">
    <div class="EditHeader">
        <asp:Label runat="server" ID="lblSysName"></asp:Label></div>
    <div>
        <div>
            <AKP:MsgBox runat="server" ID="msgBox" />
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtFullName" jas="1" MaxLength="50" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblFirstName" runat="server" Text="نام کامل:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Combo ID="cboHCGenderCode" jas="1" AllowNull="false" BaseID="HCGenders" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblHCGenderCode" runat="server" Text="جنسيت:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Lookup ID="lkpProvinceCode" jas="1" BaseID="Provinces" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblProvinceCode" runat="server" Text=" استان:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Lookup ID="lkpCityCode" jas="1" BaseID="Cities" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblCityCode" runat="server" Text=" شهر:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtTel" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblJobTel" runat="server" Text="تلفن:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                </td>
                                <td class="cLabel">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtCellPhone" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblCellPhone" runat="server" Text="موبايل:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtEmail" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblEmail" runat="server" Text="ايميل:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtDescription" jas="1" Height="40" CssClass="cMultiLine" TextMode="MultiLine"
                                        runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblDescription" runat="server" Text="توضيحات:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtID" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblID" runat="server" Text="شناسه سفارش:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtAddress" jas="1" CssClass="cMultiLine" TextMode="MultiLine"
                                        MaxLength="500" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblAddress" runat="server" Text="آدرس:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtPostalCode" jas="1" MaxLength="100" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblPostalCode" runat="server" Text="کد پستي:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Combo ID="cboHCSendTypeCode" jas="1" AllowNull="false" BaseID="HCSendTypes"
                                        runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblHCSendTypeCode" runat="server" Text="نوع ارسال:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtOtherCosts" jas="1" NumericType="IntType" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label3" runat="server" Text="سایر هزینه ها:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtSendPrice" jas="1" NumericType="IntType" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label4" runat="server" Text="هزینه ارسال:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtDiscount" jas="1" NumericType="IntType" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblDiscount" runat="server" Text="تخفيف:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtTotalProductPrice" jas="1" NumericType="IntType" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblTotalProductPrice" runat="server" Text="مجموع قیمت کالا:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtTotalOrderCost" jas="1" NumericType="IntType" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label5" runat="server" Text="کل مبلغ سفارش:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:FarsiDate ID="dteCreateDate" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblCreateDate" runat="server" Text="تاريخ سفارش:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:Combo ID="cboHCOrderStatusCode" jas="1" AllowNull="false" BaseID="HCOrderStatuses"
                                        runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="lblHCOrderStatusCode" runat="server" Text="وضعيت سفارش:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtPostOrderCode" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label1" runat="server" Text="کد رهگیری پست:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtPayeganOrderCode" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label2" runat="server" Text="کد رهگیری پایگان:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <asp:Label ID="lblHCPayMethod" runat="server"></asp:Label>
                                    <%--<AKP:Combo ID="cboHCPayMethodCode" jas="1" AllowNull="false" runat="server" />--%>
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label6" runat="server" Text="روش پرداخت:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <asp:Label ID="lblHCOrderPayStatus" runat="server"></asp:Label>
                                    <%--<AKP:Combo ID="cboHCOrderPayStatusCode" jas="1" AllowNull="false" runat="server" />--%>
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label7" runat="server" Text="وضعیت پرداخت:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td class="cFieldLeft">
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <AKP:NumericTextBox ID="txtBuyCost" jas="1" runat="server" />
                                </td>
                                <td class="cLabel">
                                    <asp:Label ID="Label9" runat="server" Text="قیمت خرید:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
        <div>
            <table class="cTblOneRow">
                <tr>
                    <td>
                        <table class="cTblField">
                            <tr>
                                
                                <td class="cCtrl">
                                    <AKP:ExTextBox SkinID="English" ID="txtPayLink" Width="400" runat="server" />
                                </td>
                                <td class="cLabel" style="width:200px;white-space:nowrap;">
                                    <asp:Label ID="Label10" runat="server" Text="لیتک خرید:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td >
                        <table class="cTblField">
                            <tr>
                                <td class="cCtrl">
                                    <asp:Button ID="btnSendSMS" OnClick="btnSendSMS_Click" runat="server" Text="ارسال" />
                                </td>
                                <td class="cCtrl">
                                    <AKP:ExTextBox ID="txtSMS" TextMode="MultiLine" Width="400" runat="server" />
                                </td>
                                <td class="cLabel" style="width:200px;white-space:nowrap;">
                                    <asp:Label ID="Label8" runat="server" Text="ارسال اس ام اس به خریدار:"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="cFieldRight">
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="cHorSep">
    </div>
    <div class="clear">
    </div>
    <table class="cEditTabs" width="100%">
        <tr>
            <td>
                <div>
                    <div class="TabHeaderData">
                        <telerik:RadTabStrip Style="margin-right: 8px;" dir="rtl" ID="tsOrders" runat="server"
                            MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Vista" SkinsPath="~/RadControls/TabStrip/Skins">
                            <Tabs>
                                <telerik:RadTab ID="Tab1" runat="server" Text="محصولات سفارش">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <div class="cTabWrapper">
                            <telerik:RadMultiPage ID="RadMultiPage1" SelectedIndex="0" runat="server">
                                <telerik:RadPageView ID="PageView1" runat="server">
                                    <div class="cDivSep">
                                    </div>
                                    <div class="cBrowseArea" id="OrderProducts">
                                    </div>
                                    <div class="cDivSep">
                                    </div>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div style="text-align: right">
        <table class="tblEditButtons" cellpadding="2" cellspacing="4">
            <tr>
                <td>
                    <asp:ImageButton ID="imgBtnBack" Text=" بازگشت " SkinID="BackButton" OnClick="GoToList"
                        runat="server" />
                </td>
                <td>
                    <asp:ImageButton ID="imgBtnSave" Text=" ذخیره " SkinID="SaveButton" OnClick="DoSave"
                        runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnPrintFactor" OnClick="btnPrintFactor_Click" runat="server" Text="چاپ فاکتور" />
                </td>
            </tr>
        </table>
    </div>
    <div class="clear">
    </div>
    <asp:Panel runat="server" CssClass="cPnlReport" ID="pnlReport" Visible="false">
        <CR:CrystalReportViewer ID="CrystalReportViewer1" Width="700" runat="server" AutoDataBind="true"
            ReportSourceID="CrystalReportSource1" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="../Reports/crOrderFactor.rpt">
            </Report>
        </CR:CrystalReportSource>
    </asp:Panel>
</asp:Content>
